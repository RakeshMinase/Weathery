import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:weathery/screens/loading_screen.dart';
import 'package:weathery/screens/result_page.dart';
import 'package:weathery/Weathery_brain/getWeather.dart';

getweather weatherdata = getweather();
var current = weatherdata.getCurrentWeather();

class input_page extends StatelessWidget {
  @override
  String cityName;
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Check the Weather by the city...',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: TextField(
            style: TextStyle(
              color: Colors.white,
              height: 1.0,
            ),
            decoration: InputDecoration(
              filled: true,
              hintText: 'Enter City Name',
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(40.0),
                ),
              ),
            ),
            onChanged: (value) {
              cityName = value;
            },
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        ElevatedButton(
          onPressed: () async {
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => loadingScreen(num: 1, cityname: cityName),
              ),
            );
          },
          child: Text(
            'Get Weather',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        ElevatedButton(
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => loadingScreen(num: 2, cityname: ""),
              ),
            );
          },
          child: Text(
            'Get Current Loaction Weather',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
          ),
        ),
      ],
    );
  }
}
