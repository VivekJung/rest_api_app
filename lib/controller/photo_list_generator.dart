import 'dart:convert';

import 'package:rest_api_app/screens/home2.dart';
import 'package:http/http.dart' as http;

class PhotoList {
  Future<List<Photos>> getPhotos(List<Photos> photosList) async {
    var url = "https://jsonplaceholder.typicode.com/photos";
    final response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        Photos photos = Photos(
          title: i['title'],
          url: i['url'],
          id: i['id'],
        );
        photosList.add(photos);
      }
      return photosList;
    } else {
      return photosList;
    }
  }
}
