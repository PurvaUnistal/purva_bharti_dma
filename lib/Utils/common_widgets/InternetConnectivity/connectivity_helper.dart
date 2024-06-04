import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class ConnectivityHelper {

  static Future<dynamic> allConnectivityCheck({required BuildContext context}) async {
    bool isConnected = await checkInterNetConnect();
    if (isConnected == false) {
      if (!context.mounted) return;
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              const InternetConnectivityPopWidget());
      return false;
    }
    return true;
  }

  static Future<bool> checkInterNetConnect() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }
}
