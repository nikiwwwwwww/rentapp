import 'package:dio/dio.dart';
import 'package:rentapp2/app/features/auth/data/data_source/jwtSignIn.dart';
import 'package:rentapp2/app/features/auth/data/model/CategoryClass.dart';

class CategoryRepository {
  final JwtSignIn jwtSignIn;
  final Dio dio;


  CategoryRepository({required this.jwtSignIn,required this.dio});

  Future<List<CategoryClass>> getAllCategories() async {
      try {
        final response = await dio.get('Categories');
        if (response.statusCode == 200) {
          final List<dynamic> data = response.data;
          return data.map((e) => CategoryClass.fromJson(e)).toList();
        } else {
          throw Exception('Failed to load categories');
        }
      } catch (e) {
        throw Exception(e);
      }
    }

    // Метод для получения категории по ее идентификатору
    Future<CategoryClass> getCategoryById(int id) async {
      try {
        final response = await dio.get('Categories/$id');
        if (response.statusCode == 200) {
          final data = response.data;
          return CategoryClass.fromJson(data);
        } else {
          throw Exception('Failed to load category');
        }
      } catch (e) {
        throw Exception(e);
      }
    }

    // Метод для создания новой категории
    Future<CategoryClass> createCategory(CategoryClass category) async {
      try {
        final response = await dio.post('Categories', data: category.toJson());
        if (response.statusCode == 201) {
          final data = response.data;
          return CategoryClass.fromJson(data);
        } else {
          throw Exception('Failed to create category');
        }
      } catch (e) {
        throw Exception(e);
      }
    }

    // Метод для обновления существующей категории
    Future<CategoryClass> updateCategory(CategoryClass category) async {
      try {
        final response = await dio.put('Categories/${category.idCategory}', data: category.toJson());
        if (response.statusCode == 200) {
          final data = response.data;
          return CategoryClass.fromJson(data);
        } else {
          throw Exception('Failed to update category');
        }
      } catch (e) {
        throw Exception(e);
      }
    }

    // Метод для удаления категории
    Future<void> deleteCategory(int id) async {
      try {
        final response = await Dio().delete('Categories/$id');
        if (response.statusCode != 200) {
          throw Exception('Failed to delete category');
        }
      } catch (e) {
        throw Exception(e);
      }
  }
}