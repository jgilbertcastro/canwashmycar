import 'dart:convert';

import 'package:canwashmycar/models/weatherData.dart';
import 'package:canwashmycar/util/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;

  WeatherData weatherData;

  String error;
  String wind = "- -";
  String temp = "- -";
  String humid = "- -";
  String icon = "";
  String tempDesc = "";

  @override
  Widget build(BuildContext context) {
    this.getWeather();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Theme.of(context).primaryColorDark,
          title: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Hello Jesus",
                  style: TextStyle(
                      fontSize: 22.0, color: Colors.white, letterSpacing: 2.0),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/carwash.png',
                      color: Colors.blue,
                      width: MediaQuery.of(context).size.width / 1.2,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: Container(
                  height: size.height / 8,
                  width: size.width / 1.1,
                  decoration: BoxDecoration(
                      color: Color(0xFF212129),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Row(
                    children: <Widget>[
                      Image.network(
                          "http://openweathermap.org/img/wn/10n@2x.png"),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              tempDesc,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            Text(
                              temp + " C\u00B0",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.0),
                            ),
                            Text(
                              "mr Hammer Road London",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.0),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: size.height / 6,
                width: size.width / 1.1,
                decoration: BoxDecoration(
                    color: Color(0xFF212129),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/wind.png',
                          color: Colors.cyanAccent,
                          height: 60.0,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Wind',
                          style: TextStyle(
                            color: Colors.cyanAccent,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          wind + " km/h",
                          style: TextStyle(
                            color: Colors.cyanAccent,
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/temperature.png',
                          color: Colors.red,
                          height: 60.0,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Temperature',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          temp,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/humidity.png',
                          color: Colors.orange,
                          height: 60.0,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Humidity',
                          style: TextStyle(
                            color: Colors.orange,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          humid + "%",
                          style: TextStyle(
                            color: Colors.orange,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              new Container(
                width: size.width / 1.4,
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: () {
                    this.getWeather();
                  },
                  color: Theme.of(context).primaryColor,
                  child: new Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: new Text("Can I wash my car?",
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  getWeather() {
    var service = new Service();
    WeatherData weatherData;
    service.getLocation().then((response) async {
      var lat = response.latitude;
      var lon = response.longitude;
      final weatherResponse = await http.get(
          'https://api.openweathermap.org/data/2.5/forecast?appid=0a3b3150cfbf33fe52d6e42f8e4402bf&lat=18.5440218&lon=-69.9431227&units=Metric&mode=json&lang=es');
      if (weatherResponse.statusCode == 200) {
        weatherData =
            new WeatherData.fromJson(jsonDecode(weatherResponse.body));
        canWashMyCar(weatherData);
      }
    });
  }

  canWashMyCar(WeatherData weatherData) {
    //var humid,temp,wind direction
    var today = DateFormat.yMd().format(DateTime.parse(weatherData.list[0].dtTxt));
    var todayData = weatherData.list.where((w) => DateFormat.yMd().format(DateTime.parse(w.dtTxt)).contains(today)).toList();
   
    setState(() {
      // wind = todayData
      /*temp = weatherData.main.temp.toString();
          humid = weatherData.main.humidity.toString();
          icon = weatherData.weather[0].icon;
          tempDesc = weatherData.weather[0].description;*/
    });
  }
}
