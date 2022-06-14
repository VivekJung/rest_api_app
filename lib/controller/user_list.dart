import 'dart:convert';
import 'package:rest_api_app/models/user_model.dart';
import 'package:http/http.dart' as http;

Future<List<UserModel>> getUsersApi(List<UserModel> userList) async {
  var url = "https://jsonplaceholder.typicode.com/users";
  final response = await http.get(Uri.parse(url));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map<String, dynamic> i in data) {
      userList.add(UserModel.fromJson(i));
    }
    return userList;
  } else {
    return userList;
  }
}
