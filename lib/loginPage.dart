import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/profilePage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => profilePage()),
            ),
          },
          icon: Icon(Icons.output_outlined),
        ),
      ),
      body: Column(
        children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: TextFormField(
            decoration: InputDecoration(
              label: Text("Nome")
            ),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            icon: Icon(Icons.account_box),
            label: Text("Usuário")
          ),
            validator: (value) {
              if (value.isEmpty || value== null) {
                return "Usuário é obrigatório!";
              }
              return null;  
            },
        ),
      ]),
    );
  }
}
