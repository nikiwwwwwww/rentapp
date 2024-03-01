import 'package:dio/dio.dart';

abstract interface class AuthRemoteDataSource {

  Future fetch(RequestOptions options);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
 
   final Dio _dio;
 
  AuthRemoteDataSourceImpl(this._dio);

  
  @override
  Future fetch(RequestOptions options) {
    try {
      return _dio.fetch(options);
    } catch (_) {
      rethrow;
    }
  }
}