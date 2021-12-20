// To parse this JSON data, do
//
//     final producto = productoFromJson(jsonString);

import 'dart:convert';

Producto productoFromJson(String str) => Producto.fromJson(json.decode(str));

String productoToJson(Producto data) => json.encode(data.toJson());

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
