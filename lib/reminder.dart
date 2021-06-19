import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

class Reminder extends StatefulWidget {
  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  TextEditingController hoursController = TextEditingController();
  TextEditingController minsController = TextEditingController();

  void submit() {
    int hh = int.parse(hoursController.text);
    int mm = int.parse(minsController.text);
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
              onPressed: () => displayNotification(),
              child: Text('Set Reminder'),
            )
          ],
        )),
      ),
    );
  }
}

Future<void> displayNotification() async {
  notificationsPlugin.zonedSchedule(
      0,
      'Zanie needs food, attention pwease',
      'Where are you?',
      tz.TZDateTime.now(tz.local).add(
        Duration(seconds: 5),
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
