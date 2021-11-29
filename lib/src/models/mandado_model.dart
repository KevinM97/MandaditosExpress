// To parse this JSON data, do
//
//     final mandado = mandadoFromJson(jsonString);

import 'dart:convert';

Mandado mandadoFromJson(String str) => Mandado.fromJson(json.decode(str));

String mandadoToJson(Mandado data) => json.encode(data.toJson());

class Mandado {
    Mandado({
        this.idMandado,
        this.idCliente,
        this.idPedido,
        this.precioMandado,
        this.direccionInicialMandado,
        this.direccionFinalMandado,
        this.estadoMandado,
    });

    String? idMandado;
    String? idCliente;
    String? idPedido;
    double? precioMandado;
    String? direccionInicialMandado;
    String? direccionFinalMandado;
    int? estadoMandado;

    factory Mandado.fromJson(Map<String, dynamic> json) => Mandado(
        idMandado: json["id_mandado"],
        idCliente: json["id_cliente"],
        idPedido: json["id_pedido"],
        precioMandado: json["precio_mandado"].toDouble(),
        direccionInicialMandado: json["direccionInicial_mandado"],
        direccionFinalMandado: json["direccionFinal_mandado"],
        estadoMandado: json["estado_mandado"],
    );

    Map<String, dynamic> toJson() => {
        "id_mandado": idMandado,
        "id_cliente": idCliente,
        "id_pedido": idPedido,
        "precio_mandado": precioMandado,
        "direccionInicial_mandado": direccionInicialMandado,
        "direccionFinal_mandado": direccionFinalMandado,
        "estado_mandado": estadoMandado,
    };
}