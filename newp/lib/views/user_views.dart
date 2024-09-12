// lib/views/user_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/user_controller.dart';
import '../models/user.dart';

class UserView extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD with GetX and Spring Boot'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: firstNameController,
                  decoration: InputDecoration(labelText: 'firstName'),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        userController.addUser(
                          User(
                              firstName: firstNameController.text,
                              email: emailController.text),
                        );
                        firstNameController.clear();
                        emailController.clear();
                      },
                      child: Text('POST'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        userController.fetchUsers();
                      },
                      child: Text('GET'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (userController.users.isNotEmpty) {
                          int id = userController.users.first.id!;
                          userController.updateUser(
                            id,
                            User(
                                firstName: firstNameController.text,
                                email: emailController.text),
                          );
                        }
                      },
                      child: Text('PUT'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (userController.users.isNotEmpty) {
                          int id = userController.users.first.id!;
                          userController.deleteUser(id);
                        }
                      },
                      child: Text('DELETE'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (userController.users.isEmpty) {
                return Center(child: Text('No users found.'));
              }
              return ListView.builder(
                itemCount: userController.users.length,
                itemBuilder: (context, index) {
                  final user = userController.users[index];
                  return ListTile(
                    title: Text(user.firstName),
                    subtitle: Text(user.email),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
