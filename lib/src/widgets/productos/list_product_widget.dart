import 'package:flutter/material.dart';
import 'package:mandaditosexpress/src/models/productos_model.dart';
import 'package:mandaditosexpress/src/services/productos_service.dart';

import 'card_producto_widget.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  final ProductService _productService = ProductService();
  List<ProductosModel>? _listProduct;

  @override
  void initState() {
    super.initState();
    _downloadService();
  }

  @override
  Widget build(BuildContext context) {
    return _listProduct == null
        ? const Center(
            child: SizedBox(
                height: 0.0, width: 0.0, child: CircularProgressIndicator()))
        : _listProduct!.isEmpty
            ? const Center(child: SizedBox(child: Text("No hay mandaditos")))
            : ListView(
                children:
                    _listProduct!.map((e) => Productcard(model: e)).toList());
  }

  _downloadService() async {
    _listProduct = await _productService.getProducto();
    if (mounted) {
      setState(() {});
    }
  }
}
