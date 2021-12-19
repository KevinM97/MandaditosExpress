import 'package:flutter/material.dart';
import 'package:mandaditosexpress/src/models/Prueba.dart';
import 'package:mandaditosexpress/src/models/productos_model.dart';

class Productcard extends StatelessWidget {
  const Productcard({Key? key, required this.model}) : super(key: key);
  final Content model;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7.0,
      child: ListTile(
          title: Text(model.country ?? ""),
          trailing: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          )),
    );
  }
}
