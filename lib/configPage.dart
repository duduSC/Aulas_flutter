import 'package:flutter/material.dart';
import 'package:flutter_application_1/profilePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class configPage extends StatefulWidget {
  const configPage({super.key});

  @override
  State<configPage> createState() => _configPageState();
}

class _configPageState extends State<configPage> {
  final Map<String, Color> colors = {
    'blue': Colors.blue,
    'red': Colors.red,
    'green': Colors.green,
    'yellow': Colors.yellow,
    'purple': Colors.purple,
    'teal': Colors.teal,
    'orange': Colors.orange,
  };
      Color? selectedColor;

  @override
  Widget build(BuildContext context) {

    void _setColor(String colorName, Color color) async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('cor', colorName);

      setState(() {
        selectedColor = color;
      });
    }

    void _getColor() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? colorName = prefs.getString('cor');
      setState(() {
        selectedColor = colors[colorName];
      });
    }

    @override
    void _initState() {
      _getColor();
      super.initState();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  selectedColor?? Colors.black,
        leading: IconButton(onPressed: ()=>{Navigator.pop(context, 
        MaterialPageRoute(builder: (context)=>profilePage())
        )
        }, icon: Icon(Icons.home)
        ),
        ),
            body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var entry in colors.entries)
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: entry.value,
                  minimumSize: const Size(300, 60),
                ),
                child: Text(''),
                onPressed: () => _setColor(entry.key, entry.value),
              ),
            ),
        ],
      ),
    );
  }
}