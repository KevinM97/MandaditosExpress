import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mandaditosexpress/src/services/imagen_service.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Container(
            //color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Column(
              children: [
                _Avatar(),
                SizedBox(height: 10.0),
                _Name(),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          _Buttons(),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    final _ButtonsState _act = _ButtonsState();
    return Container(
      height: 160.0,
      width: 160.0,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            // child: FadeInImage(
            //   placeholder: const AssetImage('assets/images/user.png'),
            //   image: const AssetImage('assets/images/user.png'),
            // ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                  color: Colors.deepOrange),
              child: IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {
                  _act._editImg(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Name extends StatelessWidget {
  const _Name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Kevin Mina',
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 5.0),
        Text(
          'kevinminey@email.com',
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}

class _Buttons extends StatefulWidget {
  const _Buttons({Key? key}) : super(key: key);

  @override
  State<_Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<_Buttons> {
  final FotosService _fotosService = FotosService();

  File? image;

  String urlImagen = "";

  Future _selectImage(ImageSource source) async {
    try {
      final imageCamera = await ImagePicker().pickImage(source: source);
      if (imageCamera == null) return;
      final imageTemporary = File(imageCamera.path);
      image = imageTemporary;
      if (image != null) {
        urlImagen = await _fotosService.uploadImage(image!);
      }
    } on Exception {
      // print('Fallo al escoger una imagen: $e');
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          const Divider(height: 0.0),
          _renderButton(
            icon: Icons.history,
            color: Colors.amber[600]!,
            text: 'Historial de pedidos',
            onTap: () {},
          ),
          const Divider(height: 0.0),
          _renderButton(
              icon: Icons.create_sharp,
              color: Colors.blue,
              text: 'Editar información',
              onTap: () {}),
          const Divider(height: 0.0),
          _renderButton(
            icon: Icons.lock,
            color: Colors.blueGrey,
            text: 'Cambiar Contraseña',
            onTap: () {},
          ),
          const Divider(height: 0.0),
          const SizedBox(height: 100.0),
          const Divider(height: 0.0),
          _renderButton(
            icon: Icons.power_settings_new,
            color: Colors.red,
            text: 'Cerrar sesión',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _renderButton({
    required IconData icon,
    required Color color,
    required String text,
    required Function() onTap,
  }) {
    return ListTile(
      onTap: onTap,
      tileColor: Colors.deepOrange[100],
      leading: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20.0,
        ),
      ),
      title: Text(text),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey[600],
        size: 20.0,
      ),
    );
  }

  void _logOut(BuildContext context) async {
    Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
  }

  void _editImg(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: <Widget>[
              const Icon(
                Icons.camera_alt,
                color: Colors.black,
                size: 24.0,
              ),
              TextButton(
                onPressed: () async {
                  await _selectImage(ImageSource.camera);
                },
                child: const Text(
                  'Cámara',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () async {
                  await _selectImage(ImageSource.gallery);
                },
                child: const Text('Galería',
                    style: TextStyle(color: Colors.black)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child:
                    const Text('Cerrar', style: TextStyle(color: Colors.black)),
              )
            ],
          );
        });
  }
}
