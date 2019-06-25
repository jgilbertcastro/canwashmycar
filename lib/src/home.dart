import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Theme.of(context).primaryColorDark,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Hello Jesus",
                style: TextStyle(
                    fontSize: 22.0, 
                    color: Colors.white, 
                    letterSpacing: 2.0
                    ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(child: 
              Row(
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
                      Image.asset(
                        'assets/images/rain.png',
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "DELIVERY",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            Text(
                              "D45 Amerlands",
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
                height: size.height / 8,
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
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/rain.png',
                          color: Colors.blue,
                          height: 60.0,
                        ),
                            SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Rain',
                          style: TextStyle(
                            color: Colors.blue,
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
}
