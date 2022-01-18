import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:mandaditosexpress/src/models/cliente_model.dart';

class ClienteService {
  ClienteService();
  final String _rootUrl = "https://mandaditos-express-backend.web.app/api/cliente";
  Future<Cliente> getAhorros() async {
    Cliente? result;
    try {
      var url = Uri.parse(_rootUrl);
      final response = await http.get(url);
      if (response.body.isEmpty) return result!;
      List<dynamic> listBody = json.decode(response.body);
      for (var item in listBody) {
        final ahorro = Cliente.fromJson(item);
        result = ahorro;
      }
      return result!;
    } catch (ex) {
      return result!;
    }
  }

  Future<Cliente> getCliente(String uid) async {
    Cliente? user;
    final QuerySnapshot result = await Future.value(FirebaseFirestore.instance
        .collection("cliente")
        .where("id_cliente", isEqualTo: uid)
        .get());
    var list = result.docs;
    dynamic us = list[0].data();
    user = Cliente.fromJson(us);
    user.idU = list[0].id;
    return user;
  }

  Future<void> sendToServer(Cliente cli) async {
    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      CollectionReference reference =
          FirebaseFirestore.instance.collection('cliente');
      await reference.add({
        "id_cliente": cli.idCliente,
        "nombre_cliente": cli.nombreCliente,
        "correo_cliente": cli.correoCliente,
        "img_cliente": cli.imgCliente
      });
    });
  }

  Future<void> updateToServer(Cliente cli) async {
    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      CollectionReference reference =
          FirebaseFirestore.instance.collection('cliente');
      await reference.doc(cli.idU).update({
        "id_cliente": cli.idCliente,
        "nombre_cliente": cli.nombreCliente,
        "correo_cliente": cli.correoCliente,
        "img_cliente": cli.imgCliente
      });
    });
  }
}