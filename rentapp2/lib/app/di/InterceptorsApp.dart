import 'package:dio/dio.dart';
import 'package:rentapp2/app/di/service.dart';
import 'package:rentapp2/app/features/auth/data/data_source/AuthRemoteDataSource.dart';
import 'package:rentapp2/app/features/auth/data/data_source/TokenUser.dart';
import 'package:rentapp2/app/features/auth/data/data_source/jwtSignIn.dart';

class InterceptorsApp extends QueuedInterceptor {
  
  
  //Dio dio = service();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await TokenUser().getToken() ?? "";
    options.headers['Authorization'] = "Bearer $token";
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    //print(
    //     'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    // if (response.statusCode == 401 &&
    //     response.data['error'] == 'Invalid JWT token' &&
    //     response.statusCode == 403) {
    //   // Обновить JWT-токен
    //   String newToken = await JwtSignIn(dio: service())
    //       .refreshToken(TokenUser().getToken().toString());
    //   TokenUser().setToken(newToken);
    // }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      try {
        final token = service<JwtSignIn>().refreshToken(await TokenUser().getToken().toString());
        if (token != '') {
          await service<TokenUser>().setToken(token.toString());
          final response =
              await service<AuthRemoteDataSource>().fetch(err.requestOptions);
          return handler.resolve(response);
        }
      } catch (e) {
        super.onError(err, handler);
      }
    } else {
      super.onError(err, handler);
    }
  }
}
