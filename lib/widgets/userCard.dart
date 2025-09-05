import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        title: Text("teste"),
        subtitle: Text("teste99"),
      ),
    );
  }
}