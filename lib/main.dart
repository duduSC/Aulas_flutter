import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/homePage.dart';
import 'package:flutter_application_1/Pages/loginPage.dart';
import 'package:flutter_application_1/Pages/dogPage.dart';
import 'package:flutter_application_1/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App mobile 3",
      theme: ThemeData(colorSchemeSeed:  Colors.cyanAccent),
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.home: (_) => const Homepage(),
        AppRoutes.login: (_) => const Loginpage(),
        AppRoutes.dog:(_)=> const DogPage()
      },
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (_)=> Loginpage() ) ,
    );
  }
}
