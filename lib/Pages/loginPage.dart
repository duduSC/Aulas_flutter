import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/homePage.dart';
import 'package:flutter_application_1/Pages/userListPage.dart';
import 'package:flutter_application_1/Pages/userPage.dart';
import 'package:flutter_application_1/Services/auth.dart';
import 'package:flutter_application_1/profilePage.dart';
import 'package:flutter_application_1/routes.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formKey = GlobalKey<FormState>();
  final _usrController = TextEditingController();
  final _pwdController = TextEditingController();

  void _doLogin() {
    final user = _usrController.text.trim();
    final password = _pwdController.text.trim();
    final auth = Auth.authenticate(user, password);

    if (auth) {
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.userList,
        arguments: {'user': user},
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 30),
          content: Text("Usuário ou senha inválidos!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            ),
          },
          icon: Icon(Icons.output_outlined),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Image(image: AssetImage("logo-vertical.png")),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: _usrController,
                          decoration: InputDecoration(
                            labelText: "Usuário",
                            prefixIcon: Icon(Icons.personal_injury_rounded),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(width: 124),
                        TextFormField(
                          controller: _pwdController,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.key_off_rounded),
                            border: UnderlineInputBorder(),
                            label: Text("Senha"),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: _doLogin,
                            child: const Text("Entrar")
                          ),
                        ),
                      ],
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
  //JWT
}
