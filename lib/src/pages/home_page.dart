import 'package:flutter/material.dart';
import 'package:mandaditosexpress/utils/main_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;
  final List<String> _options = ["Usuario", "Mandado", "Chat", "Opinion"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Mandaditos Express"),
          backgroundColor: Colors.orange,
        ),
        body: content_widget[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.orange,
          onTap: (int index) {
            _selectedIndex = index;
            color:
            Colors.white;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          items: menuOptions
              .map((e) => BottomNavigationBarItem(
                  icon: Icon(
                    e.icon,
                    color: Colors.white,
                  ),
                  label: e.label,
                  backgroundColor: Colors.orange))
              .toList(),
          currentIndex: _selectedIndex,
        ));
  }
}

      //body: const Center(child: Text("Inicio")),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Usuario',
      //       backgroundColor: Colors.orange,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_cart_outlined),
      //       label: 'Mandado',
      //       backgroundColor: Colors.orange,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.chat),
      //       label: 'Chat',
      //       backgroundColor: Colors.orange,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.chat_outlined),
      //       label: 'Opinión',
      //       backgroundColor: Colors.orange,
      //     ),
      //   ],
      //   currentIndex: 0,
      // ),