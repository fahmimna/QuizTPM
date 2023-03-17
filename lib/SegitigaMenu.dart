import 'package:flutter/material.dart';
import 'dart:math';

class SegitigaMenu extends StatefulWidget {
  @override
  _SegitigaMenuState createState() => _SegitigaMenuState();
}

class _SegitigaMenuState extends State<SegitigaMenu> {
  final _formKey = GlobalKey<FormState>();
  final _sisiSatuController = TextEditingController();
  final _sisiDuaController = TextEditingController();
  final _sisiTigaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MENU SEGITIGA',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: _sisiSatuController,
                    decoration: InputDecoration(
                      labelText: 'Sisi 1',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Sisi 1 is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _sisiDuaController,
                    decoration: InputDecoration(
                      labelText: 'Sisi 2',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Sisi 2 is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _sisiTigaController,
                    decoration: InputDecoration(
                      labelText: 'Sisi 3',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Sisi 3 is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        double sisiSatu = double.parse(_sisiSatuController.text);
                        double sisiDua = double.parse(_sisiDuaController.text);
                        double sisiTiga = double.parse(_sisiTigaController.text);
                        double keliling = sisiSatu + sisiDua + sisiTiga;
                        double s = keliling / 2;
                        double luas = sqrt(s * (s - sisiSatu) * (s - sisiDua) * (s - sisiTiga));
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Hasil'),
                            content: Text('Luas: $luas\nKeliling: $keliling'),
                            actions: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Text(
                      'HITUNG',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}