import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CustomerInputFormHelper{


  static Future<dynamic> cameraPiker({BuildContext context, File cameraImage}) async {
    /*  await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (Platform.isAndroid) {
      */ /*if (androidInfo.version.sdkInt <= 32) {
        /// use [Permissions.storage.status]
      }  else {
        /// use [Permissions.photos.status]
      }*/ /*
    }*/
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


}