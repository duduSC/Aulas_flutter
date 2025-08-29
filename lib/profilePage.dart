import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/dogPage.dart';
import 'package:flutter_application_1/Pages/loginPage.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.black,
        leading: IconButton(onPressed: ()=>{Navigator.pop(context, 
        MaterialPageRoute(builder: (context)=>DogPage())
        )
        }, icon: Icon(Icons.home)
        ),
        ),
    );
  }
}
