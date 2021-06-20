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
    final savedNumber = await prefs.getStringList("reminder").toList() ?? [];
    // print(savedNumber);
    for (var i = 0; i < savedNumber.length; i++) {
      var m = savedNumber[i];
      var formatstr = DateTime.parse(m);
      var month = DateFormat().add_yMMMM().format(formatstr);
      var time = DateFormat().add_jm().format(formatstr);
      print(month);
      print(time);
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
      appBar: AppBar(
        title: Text('Reminder'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        child: Container(
            child: Column(
          children: <Widget>[
            Row(
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: hoursController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: TextField(
                    controller: minsController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () => submit(),
              child: Text('Set Reminder'),
            )
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
