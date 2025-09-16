import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/userService.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/widgets/userCard.dart';

class UserListPage extends StatefulWidget {
  final Userservice userService;
  const UserListPage({super.key, required this.userService});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  late Future<List<User>> _futureUsers = Future.value([]);

  void _loadUser() {
    setState(() {
      _futureUsers = widget.userService.getUsers();
    });
  }
  @override
  void initState() {
    super.initState();
    _loadUser();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Usuarios")),
      body: Column(
        children: [
          FutureBuilder(
            future: _futureUsers,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<User> listaUsuario = snapshot.data!;
                return ListView.builder(
                  itemCount: listaUsuario.length,
                  itemBuilder: (context, usuario) {
                    return UserCard();
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}