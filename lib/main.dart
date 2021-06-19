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
      debugShowCheckedModeBanner: false,
      title: "Floracious",
      home: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.asset(
                "assets/logo.png",
                height: 150,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Divider(color: Colors.white),
              ),
              GridView.count(
                crossAxisCount: 2,
                primary: true,
                shrinkWrap: true,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: AspectRatio(
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
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: AspectRatio(
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
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: AspectRatio(
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
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: AspectRatio(
                        aspectRatio: 1,
                        child: MaterialButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Compass()));
                          },
                          child: Icon(Icons.directions),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        )),
                  ),
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.green,
            Colors.greenAccent,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        ),
      ),
    );
  }
}
