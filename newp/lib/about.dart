import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("aa"),
          actions: [],
        ),
        body: ListView(
          children: [
            Text("mohamed charfi",
                style: Theme.of(context).textTheme.bodySmall),
            Text("mostapha charfi",
                style: Theme.of(context).textTheme.bodyMedium),
            Text("nour charfi", style: Theme.of(context).textTheme.bodyLarge)
          ],
        ));
  }
}
