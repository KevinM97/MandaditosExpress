import 'package:flutter/material.dart';
import 'package:mandaditosexpress/src/widgets/Chat/chat_widget.dart';
import 'package:mandaditosexpress/src/widgets/Opinion/opinion_widget.dart';
import 'package:mandaditosexpress/src/widgets/Usuario/usuario_widget.dart';
import 'package:mandaditosexpress/src/widgets/productos/list_product_widget.dart';

class MenuItem {
  String label;
  IconData icon;
  MenuItem(this.label, this.icon);
}

List<MenuItem> menuOptions = [
  MenuItem('Usuario', Icons.person),
  MenuItem('Mandado', Icons.shopping_cart_outlined),
  MenuItem('Chat', Icons.chat),
  MenuItem('Opinion', Icons.chat_outlined),
];

// ignore: non_constant_identifier_names
List<Widget> content_widget = [
  const UsuarioWidget(),
  const ListProduct(),
  const ChatWidget(),
  const OpinionWidget()
];
