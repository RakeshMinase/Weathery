import 'package:flutter/material.dart';
import 'package:weathery/constants.dart';
import 'loading_screen.dart';

class result_page extends StatefulWidget {
  result_page({this.climateData});
  final climateData;

  @override
  _result_pageState createState() => _result_pageState();
}

class _result_pageState extends State<result_page> {
  String city = ' ';
  double temperature;
  String condition;
  String cloudyDetail;
  String pressureDetail;
  String windspeedDetail;
  String humidityDetail;
  int temp;

  @override
  void initState() {
    super.initState();
    addData(widget.climateData);
  }

  void addData(dynamic data) {
    setState(() {
      if (data != null) {
        temperature = data['main']['temp'];
        temp = temperature.toInt();
        condition = data['weather'][0]['main'];
        cloudyDetail = data['clouds']['all'].toString();
        pressureDetail = data['main']['pressure'].toString();
        windspeedDetail = data['wind']['speed'].toString();
        humidityDetail = data['main']['humidity'].toString();
        city = data['name'];
      } else {
        city = "Error: Unable to get Weather Data";
        temp = 0;
        condition = 'error';
        cloudyDetail = 'NA';
        pressureDetail = 'NA';
        humidityDetail = 'NA';
        windspeedDetail = 'NA';
      }
    });
  }

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
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ),
          body: Stack(
            children: <Widget>[
              Image.asset(
                'images/bg_image.jpg',
                width: 500.0,
                height: 1000.0,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70.0, right: 70.0),
                child: ListView(
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 90.0),
                        child: Text(
                          city,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45.0,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '$condition, ',
                            style: descStyle,
                          ),
                          Text(
                            '${DateTime.now().hour}:${DateTime.now().minute}',
                            style: descStyle,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80.0,
                    ),
                    Text(
                      '$temp°',
                      style: tempstyle,
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Text(
                      'Weather Details',
                      style: descStyle,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    detailRow(
                      rowTitle: 'Cloudy',
                      rowValue: '$cloudyDetail%',
                    ),
                    detailRow(
                      rowTitle: 'Humidity',
                      rowValue: '$humidityDetail%',
                    ),
                    detailRow(
                      rowTitle: 'Pressure',
                      rowValue: '$pressureDetail hPa',
                    ),
                    detailRow(
                      rowTitle: 'Wind Speed',
                      rowValue: '$windspeedDetail km/hr',
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class detailRow extends StatelessWidget {
  detailRow({this.rowTitle, this.rowValue});

  final String rowTitle;
  final String rowValue;
  var extra;

  @override
  void initState() {
    if (rowTitle == 'Pressure') {
      extra = 'hPa';
    } else if (rowTitle == 'Wind Speed') {
      extra = 'km/h';
    } else {
      extra = '%';
    }
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          rowTitle,
          style: detailStyle,
        ),
        Text(
          rowValue,
          style: detailStyle,
        ),
      ],
    );
  }
}
