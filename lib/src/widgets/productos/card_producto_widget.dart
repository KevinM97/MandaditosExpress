import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mandaditosexpress/src/models/productos_model.dart';
import 'package:mandaditosexpress/src/services/productos_service.dart';

class Productcard extends StatefulWidget {
  const Productcard({Key? key, required this.model}) : super(key: key);

  final ProductosModel model;

  @override
  State<Productcard> createState() => _ProductcardState();
}

class _ProductcardState extends State<Productcard> {
  final ProductService _productService = ProductService();
  List<ProductosModel>? _listProduct;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.orange,
      onTap: () {
        //this._listaProductos(context, widget.model.idPedido);
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text(widget.model.descripcionPedido ?? "",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          backgroundColor: Colors.orange)),
                  content: Text(widget.model.precioPedido.toString()),
                  actions: [
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cerrar",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                ));
      },
      title: Text(
        widget.model.descripcionPedido ?? "",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(
        Icons.arrow_drop_down,
        size: 50,
        color: Colors.black,
      ),
    );
  }

  // _listaProductos(context, model) {
  //   showDialog(
  //       context: context,
  //       builder: (_) => AlertDialog(
  //             title: Text("Lista de mandados"),
  //             content: Container(
  //                 child: ListView(
  //                     children: _listProduct!.map((e) {
  //               final priority = Container(
  //                   child: const Icon(Icons.info, color: Colors.white));
  //               return Card(
  //                 elevation: 7.0,
  //                 child: ListTile(
  //                   leading: const Icon(Icons.directions_boat_outlined,
  //                       color: Colors.blue),
  //                   title: Text(e.descripcionPedido ?? ""),
  //                 ),
  //               );
  //             }).toList())),
  //             actions: [
  //               TextButton(
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },
  //                   child: Text(
  //                     "Cerrar",
  //                     style: TextStyle(fontWeight: FontWeight.bold),
  //                   ))
  //             ],
  //           ));
  // }
}
/*Card(
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
    );*/