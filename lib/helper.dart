import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ARKitHelper {
  static void addSphere({@required ARKitController controller}) {
    final material = ARKitMaterial(
      lightingModelName: ARKitLightingModel.physicallyBased,
      diffuse: ARKitMaterialProperty(
        color: Colors.red,
      ),
    );

    final sphere = ARKitSphere(
      materials: [material],
      radius: 0.2,
    );

    final node =
        ARKitNode(geometry: sphere, position: vector.Vector3(0, -1.0, -1.5));

    controller.add(node);
  }

  static void addText({@required ARKitController controller}) {
    final material = ARKitMaterial(
        diffuse: ARKitMaterialProperty(
      color: Colors.blue,
    ));
    final text =
        ARKitText(text: "BAKRY", extrusionDepth: 1, materials: [material]);

    final node = ARKitNode(
        geometry: text,
        position: vector.Vector3(-1.0, -2.0, -1.5),
        scale: vector.Vector3(0.05, 0.05, 0.05));

    controller.add(node);
  }

  static void addPlane({@required ARKitController controller}) {
    final material = ARKitMaterial(
        transparency: 0.5,
        diffuse: ARKitMaterialProperty(
          color: Colors.white,
        ));

    final plane = ARKitPlane(
      materials: [material],
      width: 1,
      height: 1,
    );

    final node =
        ARKitNode(geometry: plane, position: vector.Vector3(0, -1.0, -1.5));
    controller.add(node);
  }
}
