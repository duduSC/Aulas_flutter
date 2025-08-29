import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

 @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text(''),
              accountEmail: const Text(''),
              currentAccountPicture: CircleAvatar(child: Text('')),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Início'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}