import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class ArView extends StatefulWidget {
  @override
  _ArViewState createState() => _ArViewState();
}

class _ArViewState extends State<ArView> {
  func() async {
    var status = await Permission.camera.status;
    if (status.isDenied) {
      print("pain");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: WebView(
        initialUrl: 'https://console.echoar.xyz/arjs?key=misty-boat-6649',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    ));
  }
}
