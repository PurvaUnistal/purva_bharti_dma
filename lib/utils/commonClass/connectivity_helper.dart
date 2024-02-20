
import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:permission_handler/permission_handler.dart';


class ConnectivityHelper {

  static Future<dynamic> checkGPSPermission({required BuildContext context}) async {
    try{
      bool  isLocationEnable =  await Geolocator.isLocationServiceEnabled();
      if(isLocationEnable == false){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Location services are disabled. Please enable the services')));
        return false;
      }
      LocationPermission permission;
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Location permissions are denied')));
          return false;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Location permissions are permanently denied, we cannot request permissions.')));
        return false;
      }
      return true;
    }catch(e){
      return false;
    }
  }

  static Future<bool> checkPermissions({required BuildContext context}) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.locationAlways,
      Permission.locationWhenInUse
    ].request();

    if (Platform.isAndroid) {
      final status = await Permission.locationAlways.status;
      if (status == PermissionStatus.denied) {
        showDialog(
            context: context,
            builder: (BuildContext context) => GPSSettingPermissionPopWidget());
        return false;

      }
      if (status == PermissionStatus.permanentlyDenied) {
        showDialog(
            context: context,
            builder: (BuildContext context) => GPSSettingPermissionPopWidget());
        return false;
      }
    } else if (Platform.isIOS) {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        showDialog(
            context: context,
            builder: (BuildContext context) => GPSSettingPermissionPopWidget());
        return false;
      }
    }
    return true;
  }

}