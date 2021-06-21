import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'main.dart';
import 'dart:math';
import 'data.dart';

// https://www.houseplantsexpert.com/
class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

String citylol;
double templol;
String city = "Fetching..";
double temp = 0;
var rng = new Random();

class _SearchState extends State<Search> {
  String key = '856822fd8e22db5e1ba48c0e7d69844a';
  WeatherFactory ws;
  List<Weather> _data = [];
  double lat, lon;
  weather() async {
    Weather weather = await ws.currentWeatherByLocation(
        position.latitude, position.longitude);
    setState(() {
      citylol = weather.areaName;
      templol = weather.temperature.celsius;
      temp = templol;
      city = citylol;
    });
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    ws = new WeatherFactory(key);
  }

  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    weather();

    return Scaffold(
        body: Container(
      color: Color.fromRGBO(229, 229, 229, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.location_city),
                      Text("$city")
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.cloud, color: Colors.yellow),
                      Text("$temp")
                    ],
                  ),
                ),
              ],
            ),
            padding: EdgeInsets.all(10),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: TextField(),
                  height: 35,
                  width: 250,
                  color: Colors.white,
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.search))
              ],
            ),
          ),
          Container(
              height: h - 110,
              color: Colors.transparent,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    for (int i = 1; i <= 10; i++) plant(rng.nextInt(29))
                  ],
                ),
              ))
        ],
      ),
    ));
  }
}

plant(lol) {
  return Padding(
      padding: EdgeInsets.all(10),
      child: ListTile(
        leading: Image.network(
          "https://www.houseplantsexpert.com/" + photourl[lol],
          height: 50,
          width: 50,
        ),
        title: Text(
          name[lol],
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: EdgeInsets.all(3),
          child: Text(desc[lol]),
        ),
      ));
}
