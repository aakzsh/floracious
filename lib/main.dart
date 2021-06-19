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
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset(
              "assets/logo.png",
              height: 90,
            ),
            Container(
              height: 280,
              width: 280,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                    child: Divider(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ArView()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            height: 100,
                            width: 100,
                            child: Center(
                              child: Icon(
                                Icons.message,
                                size: 50,
                              ),
                            ),
                          )),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Reminder()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            height: 100,
                            width: 100,
                            child: Center(
                              child: Icon(Icons.notifications, size: 50),
                            ),
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Search()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            height: 100,
                            width: 100,
                            child: Center(
                              child: Icon(Icons.search, size: 50),
                            ),
                          )),
                      InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            height: 100,
                            width: 100,
                            child: Center(
                              child: Icon(Icons.compare_arrows_sharp, size: 50),
                            ),
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(108, 151, 114, 1),
          Color.fromRGBO(11, 59, 45, 1),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      ),
    );
  }
}
