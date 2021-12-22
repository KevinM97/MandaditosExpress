import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandaditosexpress/providers/theme_provider.dart';
import 'package:mandaditosexpress/utils/main_menu.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<String> _options = ["Usuario", "Mandado", "Chat", "Opinion"];
  //final themeController = Get.put(ThemeProvider());
  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          centerTitle: true,
          title: Text(
            _options[_selectedIndex],
            style: TextStyle(color: Colors.white),
          ),
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: SizedBox.square(
              dimension: 40.0,
              child: Switch(
                activeColor: Theme.of(context).primaryColorLight,
                value: mainProvider.mode,
                onChanged: (bool value) async {
                  mainProvider.mode = value;
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setBool("mode", value);
                },
              )),
        ),
        body: content_widget[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.orange,
          onTap: (int index) {
            _selectedIndex = index;
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
