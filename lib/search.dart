import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'main.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

String citylol;
double templol;

class _SearchState extends State<Search> {
  String key = '856822fd8e22db5e1ba48c0e7d69844a';
  WeatherFactory ws;
  List<Weather> _data = [];
  double lat, lon;
  String city = "Fetching..";
  double temp = 0;
  weather() async {
    Weather weather = await ws.currentWeatherByLocation(
        position.latitude, position.longitude);
    setState(() {
      citylol = weather.areaName;
      templol = weather.temperature.celsius;
      temp = templol;
      city = citylol;
      print(_data);
      super.dispose();
    });
  }

  @override
  void initState() {
    super.initState();
    ws = new WeatherFactory(key);
  }

  Widget build(BuildContext context) {
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
            padding: EdgeInsets.all(20),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
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
              height: 400,
              color: Colors.transparent,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[plant(), plant(), plant(), plant()],
                ),
              ))
        ],
      ),
    ));
  }
}

plant() {
  return ListTile(
    leading: Icon(Icons.nature),
    title: Text("Plant's Name"),
    subtitle: Text("Information about plants"),
  );
}
