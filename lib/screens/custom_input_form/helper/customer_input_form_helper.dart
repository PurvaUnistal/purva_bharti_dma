import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:permission_handler/permission_handler.dart';

class CustomerInputFormHelper{


  static Future<dynamic> cameraPiker({BuildContext context, File cameraImage}) async {
    if (await Permission.camera.request().isGranted) {
      try {
        final XFile camera = await ImagePicker().pickImage(
          source: ImageSource.camera,
          imageQuality: 60,
          maxHeight: 900,
          maxWidth: 1000,
        );
        if (camera.path.isNotEmpty) {
          cameraImage = File(camera.path);
          log("cameraImage-->${camera.path.toString()}");
        } else {
          print('no image selected');
        }
      } on PlatformException catch (e) {
        print('Platform exception $e');
      } catch (e) {
        print('Unknown error: $e');
      }
      return cameraImage;
    }
  }

  static Future<dynamic> galleryPiker({ BuildContext context,  File galleryImage}) async {
    // if (await Permission.photos.request().isGranted) {
    try {
      final XFile gallery = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 60,
        maxHeight: 900,
        maxWidth: 1000,
      );
      if (gallery.path.isNotEmpty) {
        galleryImage = File(gallery.path.toString());
        log("galleryImage-->${gallery.path.toString()}");
      } else {
        log('no image selected');
      }
    } catch (e) {
      log('Unknown error: $e');
    }
    return galleryImage;

    //  }
  }

  static Future<Position> getCurrentLocation() async {
    await Geolocator.requestPermission();
    await Permission.locationAlways.request();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    log('latitude : ${position.latitude} longitude : ${position.longitude}');
    return position;
  }

  static Future<bool> isInternetConnected() async {
    bool isConnect = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnect = true;
      }
    } on SocketException catch (_) {}

    return isConnect;
  }


}