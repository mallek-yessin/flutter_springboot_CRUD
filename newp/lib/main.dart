// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/user_views.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter CRUD with GetX and Spring Boot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserView(),
    );
  }
}
