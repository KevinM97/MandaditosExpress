// To parse this JSON data, do
//
//     final productosModel = productosModelFromJson(jsonString);

import 'dart:convert';

List<ProductosModel> productosModelFromJson(String str) =>
    List<ProductosModel>.from(
        json.decode(str).map((x) => ProductosModel.fromJson(x)));

String productosModelToJson(List<ProductosModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductosModel {
  ProductosModel({
    this.idPedido,
    this.idCliente,
    this.precioPedido,
    this.descripcionPedido,
  });

  String? idPedido;
  int? idCliente;
  double? precioPedido;
  String? descripcionPedido;

  factory ProductosModel.fromJson(Map<String, dynamic> json) => ProductosModel(
        idPedido: json["idPedido"],
        idCliente: json["idCliente"],
        precioPedido: json["precioPedido"].toDouble(),
        descripcionPedido: json["descripcionPedido"],
      );

  Map<String, dynamic> toJson() => {
        "idPedido": idPedido,
        "idCliente": idCliente,
        "precioPedido": precioPedido,
        "descripcionPedido": descripcionPedido,
      };
}
