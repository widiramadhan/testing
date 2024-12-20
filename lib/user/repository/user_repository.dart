import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/user/model/user_model.dart';

class UserRepository {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  final dio = Dio();

  Future<List<UserModel>> fetchUsers() async {
    final response = await dio.get('$baseUrl/posts');

    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return List<UserModel>.from(
        data.map(
          (e) => UserModel.fromJson(e),
        ),
      ).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
