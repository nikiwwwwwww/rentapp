import 'package:dio/dio.dart';
import 'package:rentapp2/app/features/auth/data/data_source/jwtSignIn.dart';
import 'package:rentapp2/app/features/auth/data/model/ClientClass.dart';


class ClientRepository {
  final JwtSignIn jwtSignIn;
  final Dio dio;


  ClientRepository({required this.jwtSignIn,required this.dio});

  Future<List<ClientClass>> getClients() async {
    String path = "Clients";       
    final response = await dio.get(path);
    return response.data['Clients'].map((json) => ClientClass.fromJson(json)).toList();  
  }

  Future<void> postClient(ClientClass client) async {
      String path = "Clients"; 
      final response = await dio.post(path, data: client.toJson());   
      print(response.statusCode);
  }
  Future<void> putClient(ClientClass client) async {
    String path = "Clients/${client.idClient}";
    final response = await dio.put(path, data: client.toJson());
    print(response.statusCode);
  }
}
  


