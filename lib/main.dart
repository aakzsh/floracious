import 'package:floracious/compass.dart';
import 'package:floracious/reminder.dart';
import 'package:floracious/search.dart';
import 'package:flutter/material.dart';
import 'arView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Floracious",
      home: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("Floracious",
                  style: TextStyle(color: Colors.white, fontSize: 40)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Divider(color: Colors.white),
              ),
              GridView.count(
                crossAxisCount: 2,
                primary: true,
                shrinkWrap: true,
                children: <Widget>[
                  AspectRatio(
                      aspectRatio: 1,
                      child: MaterialButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ARView()));
                        },
                        child: Icon(Icons.vrpano_rounded),
                        height: 150,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      )),
                  AspectRatio(
                      aspectRatio: 1,
                      child: MaterialButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Reminder()));
                        },
                        child: Icon(Icons.notifications),
                        height: 150,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      )),
                  AspectRatio(
                      aspectRatio: 1,
                      child: MaterialButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Search()));
                        },
                        child: Icon(Icons.search),
                        height: 150,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      )),
                  AspectRatio(
                      aspectRatio: 1,
                      child: MaterialButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Compass()));
                        },
                        child: Icon(Icons.compare_arrows_sharp),
                        height: 150,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      )),
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(1, 11, 59, 45),
            Color.fromARGB(1, 108, 151, 114),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        ),
      ),
    );
  }
}
