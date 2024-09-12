// lib/controllers/user_controller.dart
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';

class UserController extends GetxController {
  var users = <User>[].obs;
  final String baseUrl =
      'http://192.168.1.46:8080/api/employees'; // For Android Emulator; use localhost for iOS

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      users.value = (json.decode(response.body) as List)
          .map((data) => User.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<void> addUser(User user) async {
    print(user);
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode == 201) {
      fetchUsers();
    } else {
      throw Exception('Failed to add user');
    }
  }

  Future<void> updateUser(int id, User user) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode == 200) {
      fetchUsers();
    } else {
      throw Exception('Failed to update user');
    }
  }

  Future<void> deleteUser(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      fetchUsers();
    } else {
      throw Exception('Failed to delete user');
    }
  }
}
