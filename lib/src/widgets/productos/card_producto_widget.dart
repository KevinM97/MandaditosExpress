import 'package:flutter/material.dart';
import 'package:mandaditosexpress/src/models/productos_model.dart';

class Productcard extends StatelessWidget {
  const Productcard({Key? key, required this.model}) : super(key: key);
  final Producto model;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      elevation: 7.0,
      child: ListTile(
        focusColor: Colors.orange,
        title: Text(
          model.name ?? "",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(
          Icons.arrow_drop_down,
          size: 50,
          color: Colors.black,
        ),
      ),
    );
  }
}
