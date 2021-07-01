import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import 'package:intl/intl.dart';

import 'package:shared_preferences/shared_preferences.dart';

FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

class Reminder extends StatefulWidget {
  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  final List<String> names = <String>[];
  TextEditingController hoursController = TextEditingController();
  TextEditingController minsController = TextEditingController();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void submit() {
    int hh = int.parse(hoursController.text);
    int mm = int.parse(minsController.text);

    displayNotification(hh, mm);
    storeTimeInfo(hh, mm);
  }

  var counter = 0;
  List<String> rem = [];

  void loadTimeInfo() async {
    final SharedPreferences prefs = await _prefs;
    final savedNumber = prefs.getStringList("reminder").toList() ?? [];

    // print(savedNumber);
    for (var i = 0; i < savedNumber.length; i++) {
      var m = savedNumber[i];
      var formatstr = DateTime.parse(m);
      // var month = DateFormat().add_yMMMM().format(formatstr);
      var time = DateFormat().add_jm().format(formatstr).toString();
      // print(month);
      // print(time);
      print(names);
      setState(() {
        names.insert(0, time);
      });

      // return ListTile(
      //   leading: Icon(
      //     Icons.nature,
      //   ),
      //   title: Text("$time"),
      // );
    }
  }

  void storeTimeInfo(int hh, int mm) async {
    final SharedPreferences prefs = await _prefs;

    var now = DateTime.now();
    var notifTime = now.add(Duration(hours: hh, minutes: mm));
    rem.add(notifTime.toString());
    // print(rem);
    await prefs.setStringList("reminder", rem);
    // var month = DateFormat().add_yMMMM().format(notifTime);
    // var time = DateFormat().add_jm().format(notifTime);
    // print(time);
    // print(month);
    loadTimeInfo();
  }

  void initState() {
    //initialize android local notif settings
    initializeSetting();
    tz.initializeTimeZones();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                height: 400,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(108, 151, 114, 1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                width: double.infinity,
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: names.length,
                    itemBuilder: (BuildContext context, int index) {
                      return givelisthehe('${names[index]}');
                    })),
            Container(
                height: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.watch_later,
                            color: Color.fromRGBO(108, 151, 114, 1),
                            size: 40,
                          ),
                        ),
                        Text(
                          "Remind me after",
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[800]),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "hh",
                              ),
                              controller: hoursController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(hintText: "mm"),
                              controller: minsController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                      ],
                    ),
                    MaterialButton(
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "Set Reminder",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      onPressed: () => submit(),
                      color: Color.fromRGBO(108, 151, 114, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ],
                ))
          ],
        )),
      ),
    );
  }
}

Future<void> displayNotification(int hh, int mm) async {
  print(mm);
  print(hh);
  notificationsPlugin.zonedSchedule(
      0,
      'Eureka needs water',
      'Time to water your plants',
      tz.TZDateTime.now(tz.local).add(
        Duration(hours: hh, minutes: mm),
      ),
      NotificationDetails(
          android: AndroidNotificationDetails(
              'channel id', 'channel name', 'channel description')),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true);
}

void initializeSetting() async {
  var initializeAndroid = AndroidInitializationSettings('pnt');
  var initializeSetting = InitializationSettings(android: initializeAndroid);
  await notificationsPlugin.initialize(initializeSetting);
}

givelisthehe(String time) {
  return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          height: 60,
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Row(
              children: <Widget>[
                Icon(Icons.emoji_nature,
                    size: 50, color: Color.fromRGBO(108, 151, 114, 1)),
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(time,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(108, 151, 114, 1))),
                )
              ],
            ),
          )));
}
