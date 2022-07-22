import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:rest_api_app/models/products_model.dart';

Future<ProductsModel> getAllProductsData() async {
  var url = "https://webhook.site/500fa8a4-6c90-4667-8920-d51789ba55fa";
  final response = await http.get(Uri.parse(url));
  var data = jsonDecode(response.body);
  log(response.statusCode.toString());
  if (response.statusCode == 200) {
    return ProductsModel.fromJson(data);
  } else {
    log('error while fetching :: ${response.statusCode}');
    return ProductsModel.fromJson(data);
  }
}
