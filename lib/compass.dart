import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math'; // to calculate angle
import 'package:flutter/services.dart'; // since we use device resources

class Compass extends StatefulWidget {
  //since the direction keeps changing, so should the angle and the compass pointer, thus we use STFUL widget
  @override
  _CompassState createState() => new _CompassState();
}

class _CompassState extends State<Compass> {
  double _direction;

  @override
  void initState() {
    super.initState();
    FlutterCompass.events.listen((double direction) {
      setState(() {
        _direction = direction;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: CompassRed(direction: _direction),
    );
  }
}

class CompassRed extends StatelessWidget {
  const CompassRed({
    Key key,
    @required double direction,
  })  : _direction = direction,
        super(key: key);

  final double _direction;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Transform.rotate(
              // to get the angle deviation
              angle: ((_direction ?? 0) * (pi / 180) * -1),
              child: Image.asset(
                "assets/compass.png",
                height: 450,
              ),
            ),
            Container(
                child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.light_mode,
                      color: Colors.black,
                    ),
                    Text("bright throughout")
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.cloud,
                      color: Colors.black,
                    ),
                    Text("mild for longest duration")
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.brightness_6,
                      color: Colors.black,
                    ),
                    Text("low-medium")
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.brightness_low,
                      color: Colors.black,
                    ),
                    Text("less sunlight")
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
