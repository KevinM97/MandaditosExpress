import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditInfoWidget extends StatefulWidget {
  const EditInfoWidget({Key? key}) : super(key: key);

  @override
  _EditInfoWidgetState createState() => _EditInfoWidgetState();
}

class _EditInfoWidgetState extends State<EditInfoWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final Stream<QuerySnapshot> _editStream =
  FirebaseFirestore.instance.collection('Cliente').snapshots();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextFormField(
                      controller: textController1,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Nombre de Usuario',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding:
                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                      ),
                      textAlign: TextAlign.start,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Field is required';
                        }

                        return null;
                      },
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Divider(
                      height: 30,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextFormField(
                      controller: textController2,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Nombre y apellido',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding:
                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                        prefixIcon: const Icon(
                          Icons.location_history_sharp,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Divider(
                          height: 30,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextFormField(
                          controller: textController3,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Correo electrónico',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Divider(
                          height: 150,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Center(
                              child: _renderButton(
                                text: 'Confirmar Cambios',
                                color: Colors.blue,
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderButton({
    required String text,
    required Color color,
    required Function() onTap,
  }) {
    return ListTile(
      
      onTap: onTap,
      tileColor: Colors.deepOrange,
      title: Text(text),
    );
  }
}
