import '../../ExportFile/export_file.dart';


class NetworkCheck {
  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
 if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  dynamic checkInternet(Function func) {
    check().then((intenet) {
      if (intenet != null && intenet) {
        func(true);
      }
      else{
        func(false);
      }
    });
  }
}