// To parse this JSON data, do
//
//     final pedido = pedidoFromJson(jsonString);

import 'dart:convert';

Pedido pedidoFromJson(String str) => Pedido.fromJson(json.decode(str));

String pedidoToJson(Pedido data) => json.encode(data.toJson());

class Pedido {
    Pedido({
        this.idPedido,
        this.idCliente,
        this.precioPedido,
        this.descripcionPedido,
    });

    String? idPedido;
    String? idCliente;
    double? precioPedido;
    String? descripcionPedido;

    factory Pedido.fromJson(Map<String, dynamic> json) => Pedido(
        idPedido: json["id_pedido"],
        idCliente: json["id_cliente"],
        precioPedido: json["precio_pedido"].toDouble(),
        descripcionPedido: json["descripcion_pedido"],
    );

    Map<String, dynamic> toJson() => {
        "id_pedido": idPedido,
        "id_cliente": idCliente,
        "precio_pedido": precioPedido,
        "descripcion_pedido": descripcionPedido,
    };
}
