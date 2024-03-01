

import 'package:dio/dio.dart';
import 'package:rentapp2/app/features/auth/data/data_source/jwtSignIn.dart';
import 'package:rentapp2/app/features/auth/data/model/PhotoClass.dart';

class PhotoRepository{

  final JwtSignIn jwtSignIn;
  final Dio dio;


  PhotoRepository({required this.jwtSignIn,required this.dio});

  Future<List<PhotoClass>> getAllPhotos() async {
  try {
    final response = await dio.get('Photos');
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((e) => PhotoClass.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  } catch (e) {
    throw Exception(e);
  }
  }

  Future<PhotoClass> getPhotoById(int id) async {
    try {
      final response = await dio.get('Photos/$id');
      if (response.statusCode == 200) {
        final data = response.data;
        return PhotoClass.fromJson(data);
      } else {
        throw Exception('Failed to load photo');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
  Future<PhotoClass> createPhoto(PhotoClass photo) async {
    try {
      final response = await dio.post('Photos', data: photo.toJson());
      if (response.statusCode == 201) {
        final data = response.data;
        return PhotoClass.fromJson(data);
      } else {
        throw Exception('Failed to create photo');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
  Future<PhotoClass> updatePhoto(PhotoClass photo) async {
    try {
      final response = await dio.put('Photos/${photo.idPhoto}', data: photo.toJson());
      if (response.statusCode == 200) {
        final data = response.data;
        return PhotoClass.fromJson(data);
      } else {
        throw Exception('Failed to update photo');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
  Future<void> deletePhoto(int id) async {
    try {
      final response = await dio.delete('Photos/$id');
      if (response.statusCode != 200) {
        throw Exception('Failed to delete photo');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}