import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mandaditosexpress/src/models/productos_model.dart';

class ProductService {
  ProductService();
  final String _rootUrl =
      "https://mandaditos-express-backend-default-rtdb.firebaseio.com/mandados.json";

  Future<List<ProductosModel>> getProducto() async {
    List<ProductosModel> resultPreoduct = [];
    try {
      var url = Uri.parse(_rootUrl);
      final response = await http.get(url);
      if (response.body.isEmpty) return resultPreoduct;

      Map<String, dynamic> _request = json.decode(response.body);
      List<dynamic> listProduct = _request["productos"];
      //List<dynamic> listvaccines = json.decode(response.body);

      for (var item in listProduct) {
        final ProductToadd = ProductosModel.fromJson(item);
        resultPreoduct.add(ProductToadd);
      }
      return resultPreoduct;
      // ignore: avoid_print
      //print(response);
    } catch (ex) {
      return resultPreoduct;
      // ignore: avoid_print
      //print(ex);
    }
  }
}
