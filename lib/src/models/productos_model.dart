// To parse this JSON data, do
//
//     final productos = productosFromJson(jsonString);

import 'dart:convert';

ProductosModel productosFromJson(String str) =>
    ProductosModel.fromJson(json.decode(str));

String productosToJson(ProductosModel data) => json.encode(data.toJson());

class ProductosModel {
  ProductosModel({
    this.description,
    this.name,
    this.price,
    this.quantity,
  });

  String? description;
  String? name;
  int? price;
  int? quantity;

  factory ProductosModel.fromJson(Map<String, dynamic> json) => ProductosModel(
        description: json["description"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "name": name,
        "price": price,
        "quantity": quantity,
      };
}
