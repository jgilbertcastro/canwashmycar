import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:flutter/services.dart';

class Service {

  Future<String> getWeather(String lat, String lon) async {
     Map<String, double> location;
    final weatherResponse = await http.get(
          'https://api.openweathermap.org/data/2.5/weather?APPID=2ac4a2730c64fcd2dd7cec483c2d54d8&lat=$lat&lon=$lon');

  }
}