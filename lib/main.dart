import 'package:flutter/material.dart';
import 'screens/input_screen.dart';

void main() => runApp(weathery());

class weathery extends StatefulWidget {
  @override
  _weatheryState createState() => _weatheryState();
}

class _weatheryState extends State<weathery> {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Center(
                child: Text(
              'Weathery',
              style: TextStyle(
                fontSize: 20.0,
              ),
            )),
          ),
          body: Stack(
            children: <Widget>[
              Image.asset(
                'images/bg_image.jpg',
                width: 500.0,
                height: 1000.0,
                fit: BoxFit.fill,
              ),
              input_page()
            ],
          )),
    );
  }
}
