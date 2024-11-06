import 'package:flutter/material.dart';

class MyAppView extends StatefulWidget {
  const MyAppView({super.key});

  @override
  State<MyAppView> createState() => _MyAppViewState();
}

class _MyAppViewState extends State<MyAppView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Expense Track"),
        backgroundColor: Colors.teal,
        leading: const CircleAvatar(
        ),
        actions: const <Widget>[Drawer()],
      ),
      body: ListView(),
    );
  }
}
