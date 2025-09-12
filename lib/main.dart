import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/homePage.dart';
import 'package:flutter_application_1/Pages/loginPage.dart';
import 'package:flutter_application_1/Pages/dogPage.dart';
import 'package:flutter_application_1/Pages/userListPage.dart';
import 'package:flutter_application_1/Services/userService.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final userService=  Userservice();
    return MaterialApp(
      title: "App mobile 3",
      theme: ThemeData(colorSchemeSeed:  Colors.cyanAccent , fontFamily:  "Fonte"
),
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.home: (_) => const Homepage(),
        AppRoutes.login: (_) => const Loginpage(),
        AppRoutes.dog:(_)=> const DogPage(),
        AppRoutes.userList:(_)=>  UserListPage(userService: userService)
      },
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (_)=> Loginpage() ) ,
    );
  }
}
