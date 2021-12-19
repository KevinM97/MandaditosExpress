import 'package:flutter/material.dart';
import 'package:mandaditosexpress/src/pages/home_page.dart';
import 'package:mandaditosexpress/src/widgets/login/login_widget.dart';
import 'package:mandaditosexpress/src/widgets/productos/List_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const List_Product(),
    );
  }
}
