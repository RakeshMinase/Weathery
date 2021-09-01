import 'package:http/http.dart';
import 'get_json.dart';
import 'location.dart';

const apikey = '774a019ca4da208abd61e0b947b0f1f2';
const openMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class getweather {
  Future<dynamic> getCityWeather(String cityName) async {
    getData weatherData =
        getData('$openMapUrl?q=$cityName&appid=$apikey&units=metric');

    var climateData = await weatherData.getJson();

    return climateData;
  }

  Future<dynamic> getCurrentWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    var lat = location.latitude;
    var lon = location.longitude;
    getData weatherData = getData(
        '$openMapUrl?lat=$lat&lon=$lon&appid=$apikey&units=metric');
    var climateData = weatherData.getJson();

    return climateData;
  }
}
