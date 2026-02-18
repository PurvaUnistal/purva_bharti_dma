import 'package:flutter/material.dart';
import 'enums.dart';

class EnvironmentConfig extends InheritedWidget {
  final EnvironmentFlavors flavors;

  const EnvironmentConfig({required super.child, required this.flavors});

  static EnvironmentConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    throw UnimplementedError();
  }

  String get generalUrlBaseFlavour {
    print("flavor-->${flavors}");
    switch (flavors) {
      case EnvironmentFlavors.prodPBGPL:
        return "https://pbgpl.smartgasnet.com/api/";
      case EnvironmentFlavors.prodMGL:
        return "https://mgl.smartgasnet.com/api/";
      case EnvironmentFlavors.prodVRPL:
        return "https://vrpl.plcms.net/api/";
      case EnvironmentFlavors.prodVPPL:
        return "https://vppl.plcms.net/api/";
      case EnvironmentFlavors.prodHPOIL:
        return "https://hpoil.smartgasnet.com/api/";
    }
  }

  Color get primaryTheme {
    switch (flavors) {
      case EnvironmentFlavors.prodPBGPL:
        return Colors.green.shade800;
      case EnvironmentFlavors.prodMGL:
        return Colors.green.shade800;
      case EnvironmentFlavors.prodHPOIL:
        return Colors.red.shade700;
      case EnvironmentFlavors.prodVPPL:
        return Colors.green.shade800;
      case EnvironmentFlavors.prodVRPL:
        return Colors.amber.shade400;
    }
  }

  Color get secondaryTheme {
    switch (flavors) {
      case EnvironmentFlavors.prodPBGPL:
        return Colors.yellow.shade800;
      case EnvironmentFlavors.prodMGL:
        return Colors.yellow.shade800;
      case EnvironmentFlavors.prodHPOIL:
        return Colors.red.shade700;
      case EnvironmentFlavors.prodVPPL:
        return Colors.green.shade800;
      case EnvironmentFlavors.prodVRPL:
        return Colors.amber.shade400;
    }
  }
}
