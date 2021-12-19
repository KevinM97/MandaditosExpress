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

  ProductosClass? productos;

  factory ProductosModel.fromJson(Map<String, dynamic> json) => ProductosModel(
        productos: ProductosClass.fromJson(json["productos"]),
      );

  Map<String, dynamic> toJson() => {
        "productos": productos!.toJson(),
      };
}

class ProductosClass {
  ProductosClass({
    this.mrGaTixYNxI9LeNrwH,
  });

  MrGaTixYNxI9LeNrwH? mrGaTixYNxI9LeNrwH;

  factory ProductosClass.fromJson(Map<String, dynamic> json) => ProductosClass(
        mrGaTixYNxI9LeNrwH:
            MrGaTixYNxI9LeNrwH.fromJson(json["-MrGaTixYNxI9Le_nrwH"]),
      );

  Map<String, dynamic> toJson() => {
        "-MrGaTixYNxI9Le_nrwH": mrGaTixYNxI9LeNrwH!.toJson(),
      };
}

class MrGaTixYNxI9LeNrwH {
  MrGaTixYNxI9LeNrwH({
    this.description,
    this.name,
    this.price,
    this.quantity,
  });

  String? description;
  String? name;
  int? price;
  int? quantity;

  factory MrGaTixYNxI9LeNrwH.fromJson(Map<String, dynamic> json) =>
      MrGaTixYNxI9LeNrwH(
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
