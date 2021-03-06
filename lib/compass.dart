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
      appBar: new AppBar(
        title: const Text('Compass'),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Transform.rotate(
          // to get the angle deviation
          angle: ((_direction ?? 0) * (pi / 180) * -1),
          child: Image.network(
              'https://cdn3.vectorstock.com/i/1000x1000/33/02/a-compass-rose-icon-eps-10-vector-26153302.jpg'),
        ),
      ),
    );
  }
}
