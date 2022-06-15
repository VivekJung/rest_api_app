import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

//creating multip
class _SignUpScreenState extends State<SignUpScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  login(String email, String password) async {
    try {
      // Signup or login; change the uri
      var uri = "https://reqres.in/api/login";
      // var uri = "https://reqres.in/api/register";
      Response response = await post(Uri.parse(uri), body: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        //getting response data, here : id and token
        var data = jsonDecode(response.body.toString());
        log(data.toString());
        log(data['id'].toString());
        log('response executed successfully');
      } else {
        log('response failed');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign-up API'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  login(emailController.text.toString(),
                      passwordController.text.toString());
                },
                icon: const Icon(Icons.login),
                label: const Text("Signup"),
              ),
            ],
          ),
        ));
  }
}
