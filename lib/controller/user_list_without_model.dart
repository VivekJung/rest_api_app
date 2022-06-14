import 'dart:convert';

import 'package:http/http.dart' as http;

Future getApiofUsers(List<dynamic> dataList) async {
  var uri = "https://jsonplaceholder.typicode.com/users";
  final response = await http.get(Uri.parse(uri));

  if (response.statusCode == 200) {
    var individualData = jsonDecode(response.body.toString());
    for (Map i in individualData) {
      dataList.add(i);
    }
    return dataList;
  } else {
    return dataList;
  }
}
