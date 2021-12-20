import 'package:flutter/material.dart';
import 'package:mandaditosexpress/src/models/productos_model.dart';
import 'package:mandaditosexpress/src/services/productos_service.dart';

import 'card_producto_widget.dart';

class List_Product extends StatefulWidget {
  const List_Product({Key? key}) : super(key: key);

  @override
  _List_ProductState createState() => _List_ProductState();
}

class _List_ProductState extends State<List_Product> {
  final ProductService _productService = ProductService();
  List<ProductosModel>? _listProduct;

  @override
  void initState() {
    super.initState();
    _downloadService();
  }

  Widget build(BuildContext context) {
    return _listProduct == Null
        ? const Center(
            child: SizedBox(
                height: 50.0, width: 50.1, child: CircularProgressIndicator()))
        : _listProduct!.isEmpty
            ? const Center(
                child:
                    SizedBox(child: Text("No hay informacion en el servicio")))
            : Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 25.0, horizontal: 14.0),
                child: ListView(
                    children: _listProduct!
                        .map((e) => Productcard(model: e))
                        .toList()));
  }

  _downloadService() async {
    _listProduct = await _productService.getProducto();
    setState(() {});
  }
}
