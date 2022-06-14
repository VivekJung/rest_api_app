import 'package:flutter/material.dart';
import 'package:rest_api_app/screens/home.dart';
import 'package:rest_api_app/screens/home2.dart';
import 'package:rest_api_app/screens/home3.dart';
import 'package:rest_api_app/screens/home4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'REST API',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen4(),
    );
  }
}
