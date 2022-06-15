import 'package:flutter/material.dart';
import 'package:rest_api_app/screens/home.dart';
import 'package:rest_api_app/screens/home2.dart';
import 'package:rest_api_app/screens/home3.dart';
import 'package:rest_api_app/screens/home4.dart';
import 'package:rest_api_app/screens/home5.dart';
import 'package:rest_api_app/screens/signup.dart';
import 'package:rest_api_app/screens/upload_image.dart';

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
        primarySwatch: Colors.purple,
      ),

      ///tips:
      /// use jsonviewer.stack.hu to get format of your json file
      /// webhook.site to make fake apis
      /// https://webhook.site/6b261580-822a-4302-8c39-c3e6d8a4a987 this is current fake api url
      /// nested loop - starting with object and nested to arrays and objects.
      /// create a model as done in home.dart
      home: const UploadImageScreen(),
    );
  }
}
