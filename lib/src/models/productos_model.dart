// To parse this JSON data, do
//
//     final productos = productosFromJson(jsonString);

import 'dart:convert';

ProductosModel productosFromJson(String str) =>
    ProductosModel.fromJson(json.decode(str));

String productosToJson(ProductosModel data) => json.encode(data.toJson());

class ProductosModel {
  ProductosModel({
    this.productos,
  });

  Map<String, Producto>? productos;

  factory ProductosModel.fromJson(Map<String, dynamic> json) => ProductosModel(
        productos: Map.from(json["productos"])
            .map((k, v) => MapEntry<String, Producto>(k, Producto.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "productos": Map.from(productos!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Producto {
  Producto({
    this.description,
    this.name,
    this.price,
    this.quantity,
  });

  String? description;
  String? name;
  int? price;
  int? quantity;

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
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
