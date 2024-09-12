import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepagesState();
}

class _HomepagesState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Package"),
          actions: [],
        ),
        body: ListView(
          children: [
            MaterialButton(
              onPressed: () async {
                var response =
                    await get(Uri.parse("192.168.1.46:8080/api/employees"));

                var responsebody = jsonDecode(response.body);
                print(responsebody);
              },
              child: Text("aaaaa"),
            )
          ],
        ));
  }
}
