// Метод для получения списка всех продуктов
import 'package:dio/dio.dart';
import 'package:rentapp2/app/features/auth/data/data_source/jwtSignIn.dart';
import 'package:rentapp2/app/features/auth/data/model/ProductClass.dart';

class ProductRepository {
  final JwtSignIn jwtSignIn;
  final Dio dio;
  ProductRepository({required this.jwtSignIn,required this.dio});

Future<List<ProductClass>> getAllProducts() async {
    try {
      final response = await dio.get('Products');
      final List<dynamic> data = response.data;
      return data.map((e) => ProductClass.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  // Метод для получения продукта по его идентификатору
  Future<ProductClass> getProductById(int id) async {
    try {
      final response = await dio.get('Products/$id');
      if (response.statusCode == 200) {
        final data = response.data;
        return ProductClass.fromJson(data);
      } else {
        throw Exception('Failed to load product');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // Метод для создания нового продукта
  Future<ProductClass> createProduct(ProductClass product) async {
    try {
      final response = await dio.post('Products', data: product.toJson());
      if (response.statusCode == 201) {
        final data = response.data;
        return ProductClass.fromJson(data);
      } else {
        throw Exception('Failed to create product');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // Метод для обновления существующего продукта
  Future<ProductClass> updateProduct(ProductClass product) async {
    try {
      final response = await dio.put('Products/${product.idProduct}', data: product.toJson());
      if (response.statusCode == 200) {
        final data = response.data;
        return ProductClass.fromJson(data);
      } else {
        throw Exception('Failed to update product');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // Метод для удаления продукта
  Future<void> deleteProduct(int id) async {
    try {
      final response = await dio.delete('Products/$id');
      if (response.statusCode != 200) {
        throw Exception('Failed to delete product');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}