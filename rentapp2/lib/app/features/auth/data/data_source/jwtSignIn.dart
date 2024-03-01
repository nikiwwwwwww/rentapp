//import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class JwtSignIn {
  final Dio dio;

  JwtSignIn({required this.dio});
  //  var email = "nikitossa123@mail.com";
  //  var password = "nik070604";
  Future<String> getToken(String email, String password) async {
    try {
      final response = await dio.post(
        "Token/signIn",
        data: {
          "idClient": 0,
          "email": email,
          "phoneNumber": "string",
          "birthDate": "2024-02-18T07:42:39.086Z",
          "firstName": "string",
          "lastName": "string",
          "middleName": "string",
          "registrationDate": "2024-02-18T07:42:39.086Z",
          "typeClient": true,
          "passwordHash": password,
          "photo": "string",
          "role": "string"
        },
      );
      return response.data as String;
    } catch (e) {
        print(e.toString());
      return 'fail';
    }
  }

    Future<String> refreshToken(String token) async {
    try {
      Response response = await dio.post(
        "Token/refreshToken?oldToken=$token",
        
      );
      return response.data as String;
    } catch (e) {
        print(e.toString());
      return 'fail';
    }
  }

}
