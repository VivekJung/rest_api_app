import 'dart:convert';

import 'package:rest_api_app/models/user_posts_model.dart';
import 'package:http/http.dart' as http;

class UserPostListGenerator {
//getting Api and putting into list of model.
  Future<List<UserPostsModel>> getUserPostsApi(
      List<UserPostsModel> postList) async {
    final response = await http.get(
      Uri.parse(
        "https://jsonplaceholder.typicode.com/posts",
      ),
    );

    //putting datas gained from json into var data
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        //adding each data into list
        postList.add(UserPostsModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }
}
