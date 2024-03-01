import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rentapp2/app/di/InterceptorsApp.dart';
import 'package:rentapp2/app/features/auth/data/data_source/AuthRemoteDataSource.dart';
import 'package:rentapp2/app/features/auth/data/data_source/TokenUser.dart';
import 'package:rentapp2/app/features/auth/data/data_source/jwtSignIn.dart';
import 'package:rentapp2/app/features/auth/data/repository/Catrgories.dart';
import 'package:rentapp2/app/features/auth/data/repository/Clients.dart';
import 'package:rentapp2/app/features/auth/data/repository/Photo.dart';
import 'package:rentapp2/app/features/auth/data/repository/Products.dart';
import 'package:rentapp2/app/features/auth/presentation/controller/todo_controller.dart';

final service = GetIt.instance;

Future<void> init() async {
  service.registerLazySingleton(() => JwtSignIn(dio: service()));

  service.registerLazySingleton(() => TokenUser());
  //service.registerLazySingleton(() => RespClient(jwtSignIn: service(), dio: service()));
  service.registerLazySingleton(
      () => ClientRepository(jwtSignIn: service(), dio: service()));
  service.registerLazySingleton(
      () => ProductRepository(jwtSignIn: service(), dio: service()));
  service.registerLazySingleton(
      () => CategoryRepository(jwtSignIn: service(), dio: service()));
  service.registerLazySingleton(
      () => PhotoRepository(jwtSignIn: service(), dio: service()));

  service.registerLazySingleton(() => AuthRemoteDataSourceImpl(service()));

  service.registerLazySingleton(() => TodoController());

  service.registerLazySingleton(
    () {
      return Dio(
        BaseOptions(
          baseUrl: "http://192.168.169.134:7080/api/",
          // headers: {
          //   "Authorization": "Bearer ${TokenUser().getToken().toString()}"
          // },
        ),
      )..interceptors.addAll(
          [
            // InterceptorsApp(),
            InterceptorsApp(),
            PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseBody: true,
              error: true,
              compact: true,
              maxWidth: 90,
              responseHeader: true,
              logPrint: (object) => print("DIO-LOG : $object"),
              request: true,
            ),
          ],
        );
    },
  );
}
