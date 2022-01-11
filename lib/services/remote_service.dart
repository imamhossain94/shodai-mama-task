import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shodai_mama_task/models/product.dart';

class RemoteService {
  static var client = http.Client();
  static String productUrl = "https://fakestoreapi.com/products";

  static Future<dynamic> fetchProduct() async {
    var response = await client.get(Uri.parse(productUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode == 200) {
      var jsonString = response.body;
      final dataJson = json.decode(jsonString);
      return dataJson;
    } else {
      return null;
    }
  }





}
