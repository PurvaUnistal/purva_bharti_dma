import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class ApiServer {
  static Future<dynamic> getData(
      {var urlEndPoint, required BuildContext context}) async {
    try {
      if (await ConnectivityHelper.allConnectivityCheck(context: context) ==
          false) {
        return null;
      }
      String token = await SharedPref.getString(key: PrefsValue.token);
      var header = {"Authorization": token};
      final response = await get(Uri.parse(urlEndPoint),headers:header );
      log("URL-->${urlEndPoint.toString()}");
      log(urlEndPoint + "==> " + response.body);
      if (response.statusCode == 200) {
        return response.body.toString();
      } else if (response.body == "Access denied") {
        await SharedPref.clearAll();
        return Navigator.of(context).pushNamedAndRemoveUntil(RoutesName.splash, (Route<dynamic> route) => false);
      }
      if (response.statusCode == 400) {
        return response.body.toString();
      } else {
        log("Api.error-->getElse");
        return null;
      }
    } catch (e) {
      log("ApiServer-->${e.toString()}");
      if (e is SocketException) {
        log("SocketException : ${e.toString()}");
        Utils.warningSnackBar(msg: "No Internet", context: context);
      } else if (e is TimeoutException) {
        log("TimeoutException : ${e.toString()}");
        Utils.warningSnackBar(
            msg: "Timeout, Please try again", context: context);
      } else {
        log("Unhandled exception : ${e.toString()}");
        Utils.warningSnackBar(msg: e.toString(), context: context);
      }
      return null;
    }
  }

  static Future<dynamic> postData({required String urlEndPoint, var body, required BuildContext context}) async {
    try {
      if (await ConnectivityHelper.allConnectivityCheck(context: context) ==
          false) {
        return null;
      }
      String token = await SharedPref.getString(key: PrefsValue.token) ?? "";
      Map<String, String> headers = {"Authorization": token};
      var res = await post(Uri.parse(urlEndPoint), body: body, headers: headers);
      print(res.body);
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      } else if (res.statusCode == 403) {
        return SessionDialogUtils.logOut(context: context);
      } else if (res.body == "Access denied") {
        await SharedPref.clearAll();
        return Navigator.of(context).pushNamedAndRemoveUntil(RoutesName.splash, (Route<dynamic> route) => false);
      }else if (res.statusCode == 401) {
        return jsonDecode(res.body);
      } else if (res.statusCode == 415) {
        return jsonDecode(res.body);
      }else if (res.statusCode == 500) {
        return jsonDecode(res.body);
      }
    } catch (e) {
      print("catch--->" + e.toString());
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
  }

  static Future<dynamic> postDataWithFile({required var endPoint, required var body,
    required BuildContext context,
    required String filePath1, required String keyWord1,
    required String filePath2, required String keyWord2,
    required String filePath3, required String keyWord3,
    required String filePath4, required String keyWord4,
    required String filePath5, required String keyWord5,
    required String filePath6, required String keyWord6,
    required String filePath7, required String keyWord7,
    required String filePath8, required String keyWord8,
    required String filePath9, required String keyWord9,
    required String filePath10, required String keyWord10,
    required String filePath11, required String keyWord11,
    required String filePath12, required String keyWord12,

  }) async {
    try {
      if (await ConnectivityHelper.allConnectivityCheck(context: context) ==
          false) {
        return null;
      }
      String token = await SharedPref.getString(key: PrefsValue.token) ?? "";
      Map<String, String> headers = {"Authorization": token};
      var request = MultipartRequest("POST", Uri.parse(endPoint));
      if(filePath1.isNotEmpty){
        File f = new File(filePath1);
        lookupMimeType(filePath1, headerBytes: [0xFF, 0xD8])!.split('/');
        var uploadFile = await MultipartFile.fromPath(keyWord1, filePath1,
            contentType: MediaType("image", filePath1.split('.').last));
        request.files.add(uploadFile);
      }

      if(filePath2.isNotEmpty){
        final mimeTypeData = lookupMimeType(filePath2, headerBytes: [0xFF, 0xD8])!.split('/');
        var uploadFile1 = await MultipartFile.fromPath(keyWord2, filePath2,
            contentType: MediaType("image", filePath2.split('.').last))
        //  contentType: MediaType(mimeTypeData[0], mimeTypeData[1]))
            ;
        request.files.add(uploadFile1);
      }

      if(filePath3.isNotEmpty){
        final mimeTypeData = lookupMimeType(filePath3, headerBytes: [0xFF, 0xD8])!.split('/');
        var uploadFile2 = await MultipartFile.fromPath(keyWord3, filePath3,
            contentType: MediaType("image", filePath3.split('.').last));
        //  contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
        request.files.add(uploadFile2);
      }

      if(filePath4.isNotEmpty){
        final mimeTypeData = lookupMimeType(filePath4, headerBytes: [0xFF, 0xD8])!.split('/');
        var uploadFile3 = await MultipartFile.fromPath(keyWord4, filePath4,
            contentType: MediaType("image", filePath4.split('.').last));
        // contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
        request.files.add(uploadFile3);
      }

      if(filePath5.isNotEmpty){
        final mimeTypeData = lookupMimeType(filePath5, headerBytes: [0xFF, 0xD8])!.split('/');
        var uploadFile4 = await MultipartFile.fromPath(keyWord5, filePath5,
            contentType: MediaType("image", filePath5.split('.').last));
        //  contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
        request.files.add(uploadFile4);
      }

      if(filePath6.isNotEmpty){
        final mimeTypeData = lookupMimeType(filePath6, headerBytes: [0xFF, 0xD8])!.split('/');
        var uploadFile5 = await MultipartFile.fromPath(keyWord6, filePath6,
            contentType: MediaType("image", filePath6.split('.').last));
        //  contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
        request.files.add(uploadFile5);
      }
      if(filePath7.isNotEmpty){
        final mimeTypeData = lookupMimeType(filePath7, headerBytes: [0xFF, 0xD8])!.split('/');
        var uploadFile6 = await MultipartFile.fromPath(keyWord7, filePath7,
            contentType: MediaType("image", filePath7.split('.').last));
        // contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
        request.files.add(uploadFile6);
      }

      if(filePath8.isNotEmpty){
        final mimeTypeData = lookupMimeType(filePath8, headerBytes: [0xFF, 0xD8])!.split('/');
        var uploadFile7 = await MultipartFile.fromPath(keyWord8, filePath8,
            contentType: MediaType("image", filePath8.split('.').last));
        //  contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
        request.files.add(uploadFile7);
      }

      if(filePath9.isNotEmpty){
        final mimeTypeData = lookupMimeType(filePath9, headerBytes: [0xFF, 0xD8])!.split('/');
        var uploadFile8 = await MultipartFile.fromPath(keyWord9, filePath9,
            contentType: MediaType("image", filePath9.split('.').last));
        //  contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
        request.files.add(uploadFile8);
      }

      if(filePath10.isNotEmpty){
        final mimeTypeData = lookupMimeType(filePath10, headerBytes: [0xFF, 0xD8])!.split('/');
        var uploadFile9 = await MultipartFile.fromPath(keyWord10, filePath10,
            contentType: MediaType("image", filePath10.split('.').last));
        // contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
        request.files.add(uploadFile9);
      }

      if(filePath11.isNotEmpty){
        final mimeTypeData = lookupMimeType(filePath11, headerBytes: [0xFF, 0xD8])!.split('/');
        var uploadFile10 = await MultipartFile.fromPath(keyWord11, filePath11,
            contentType: MediaType("image", filePath11.split('.').last));
        // contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
        request.files.add(uploadFile10);
      }

      if(filePath12.isNotEmpty){
        final mimeTypeData = lookupMimeType(filePath12, headerBytes: [0xFF, 0xD8])!.split('/');
        var uploadFile11 = await MultipartFile.fromPath(keyWord12, filePath12,
            contentType: MediaType("image", filePath12.split('.').last));
        //  contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
        request.files.add(uploadFile11);
      }
      request.fields.addAll(body);
      request.headers.addAll(headers);
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        var result = json.decode(String.fromCharCodes(responseData));
        log("result-->${result.toString()}");
        return result;
      } else if (response.statusCode == 401 || response == "Access denied") {
        await SharedPref.clearAll();
        return Navigator.of(context).pushNamedAndRemoveUntil(RoutesName.splash, (Route<dynamic> route) => false);
      } else if (response.statusCode == 415) {
        var responseData = await response.stream.toBytes();
        var result = json.decode(String.fromCharCodes(responseData));
        log(result.toString());
        return result;
      } else if (response.statusCode == 400) {
        var responseData = await response.stream.toBytes();
        var result = json.decode(String.fromCharCodes(responseData));
        log(result.toString());
        return result;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
    }
}


