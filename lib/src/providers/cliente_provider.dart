import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mandaditosexpress/src/models/cliente_model.dart';

class UserProvider extends ChangeNotifier {
  String? _idCliente;
  String? _correoCliente;
  String _nombreCliente = "";
  final Cliente? _client =
      Cliente(nombreCliente: '', correoCliente: '', idCliente: '', imgCliente: '');

  String? get getUid => _idCliente;
  String? get getEmail => _correoCliente;
  String? get getNombre => _nombreCliente;
  Cliente? get getClientes => _client;

  set setNombre(String value) {
    _nombreCliente = value;
    notifyListeners();
  }
  Cliente? getCliente() {
    return _client;
  }
}