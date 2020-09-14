import 'package:flutter_arkit/helper.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ARKitController _arKitController;

  _onARKitViewCreated(ARKitController controller) {
    _arKitController = controller;
    ARKitHelper.addSphere(controller: _arKitController);
    ARKitHelper.addText(controller: _arKitController);
    ARKitHelper.addPlane(controller: _arKitController);
  }

  @override
  void dispose() {
    _arKitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ARKitSceneView(
        onARKitViewCreated: _onARKitViewCreated,
        showStatistics: true,
      ),
    );
  }
}
