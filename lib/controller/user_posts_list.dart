import 'dart:convert';

import 'package:rest_api_app/models/user_posts_model.dart';
import 'package:http/http.dart' as http;

//getting Api and putting into list of model. You have to see nature of your api before making a model.
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
    postList.clear(); // this will not let list to reload again.
    //adding each data into list
    for (Map<String, dynamic> i in data) {
      postList.add(UserPostsModel.fromJson(i));
    }
    return postList;
  } else {
    return postList;
  }
}
