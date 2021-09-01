

import 'package:flutter/material.dart';
import 'package:weathery/Weathery_brain/getWeather.dart';
import 'package:weathery/screens/input_screen.dart';
import 'package:weathery/screens/result_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loadingScreen extends StatefulWidget {
  loadingScreen({@required this.num, this.cityname});

  final int num;
  String cityname;

  @override
  _loadingScreenState createState() =>
      _loadingScreenState(n: num, cityName: cityname);
}

class _loadingScreenState extends State<loadingScreen> {
  _loadingScreenState({@required this.n, this.cityName});

  final int n;
  String cityName;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var weatherData;
    if (n == 2) {
      weatherData = await getweather().getCurrentWeather();
    } else if (n == 1) {
      weatherData = await getweather().getCityWeather(cityName);
    } else {
      Navigator.pop(context);
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => result_page(climateData: weatherData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
