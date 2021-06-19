import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  ArCoreController arCoreController;
  Future<Uint8List> getImage() async {
    final ByteData bytes = await rootBundle.load('assets/plant.png');
    final Uint8List list = bytes.buffer.asUint8List();

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('search'),
        ),
        body: ArCoreView(
          onArCoreViewCreated: _onArCoreViewCreated,
          enableTapRecognizer: true,
        ));
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;

    _addCylinder(arCoreController);
  }

  void _addCylinder(ArCoreController controller) async {
    final ByteData bytes = await rootBundle.load('assets/plant.png');
    final Uint8List l = bytes.buffer.asUint8List();

    final cylinder = ArCoreImage(bytes: l, width: 1000, height: 1000);
    final node = ArCoreNode(
      image: cylinder,
      position: vector.Vector3(0.0, -1.5, -2.0),
    );
    controller.addArCoreNode(node);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}
