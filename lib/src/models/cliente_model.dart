// To parse this JSON data, do
//
//     final cliente = clienteFromJson(jsonString);

import 'dart:convert';

Cliente clienteFromJson(String str) => Cliente.fromJson(json.decode(str));

String clienteToJson(Cliente data) => json.encode(data.toJson());

class Cliente {
    Cliente({
        this.idCliente,
        this.userCliente,
        this.nombreCliente,
        this.telefonoCliente,
        this.correoCliente,
        this.imgCliente,
        this.contrasea,
        this.idU,
    });

    String? idCliente;
    String? userCliente;
    String? nombreCliente;
    String? telefonoCliente;
    String? correoCliente;
    String? imgCliente;
    String? contrasea;
    String? idU;
    

    factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        idCliente: json["id_cliente"],
        userCliente: json["user_cliente"],
        nombreCliente: json["nombre_cliente"],
        telefonoCliente: json["telefono_cliente"],
        correoCliente: json["correo_cliente"],
        imgCliente: json["img_cliente"],
        contrasea: json["contraseña"],
    );

    Map<String, dynamic> toJson() => {
        "id_cliente": idCliente,
        "user_cliente": userCliente,
        "nombre_cliente": nombreCliente,
        "telefono_cliente": telefonoCliente,
        "correo_cliente": correoCliente,
        "img_cliente": imgCliente,
        "contraseña": contrasea,
    };
}
