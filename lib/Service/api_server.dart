import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServer {
  static Future<dynamic> getData(
      {var urlEndPoint, required BuildContext context}) async {
    try {
      if (await ConnectivityHelper.checkInternetConnect(context: context) ==
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
        return  Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => SplashView(),
          ),
              (Route<dynamic> route) => false,
        );
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
      if (await ConnectivityHelper.checkInternetConnect(context: context) ==
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
        return  Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => SplashView(),
          ),
              (Route<dynamic> route) => false,
        );
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

  static Future<dynamic> postDataWithFile({
    var urlEndPoint,
    var body,
    required  List<ImageRequestObject> imageRequestObject,
    required BuildContext context
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(PrefsValue.token) ?? "";
    try {
      if(await ConnectivityHelper.checkInternetConnect(context: context) == false){
        return null;
      }
      Map<String, String> headers = {"Authorization": token};
      var request = MultipartRequest("POST", Uri.parse(urlEndPoint));

      for(int i=0; i< imageRequestObject.length ; i++) {
        var element = imageRequestObject[i];
        if (element.path!.isNotEmpty && !element.path!.startsWith("http")) {
          final mimeTypeData = lookupMimeType(element.path!, headerBytes: [0xFF, 0xD8])!.split('/');
          var file = await MultipartFile.fromPath(element.key!, element.path!, contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
          request.files.add(file);
        } else {
          body[element.key] = element.path;
        }
      }
      request.fields.addAll(body);
      request.headers.addAll(headers);
      var response = await request.send();
      var responseData = await response.stream.toBytes();
      var result = json.decode(String.fromCharCodes(responseData));
      if (response.statusCode == 200) {
        log("result-->${result.toString()}");
        return result;
      } else if (response.statusCode == 401) {
        log("result-->${result.toString()}");
        return result;
      } else if (response.statusCode == 415) {
        Utils.errorSnackBar(msg: result['data'].toString(), context:context);
        log(result['data'].toString());
        return null;
      } else if (response.statusCode == 400) {
        return result;
      } else {
        return null;
      }
    } catch (e) {
      log("postDataWithFile-->${e.toString()}");
      return null;
    }
  }

}

class ImageRequestObject {
  String? key;
  String? path;

  ImageRequestObject(this.key, this.path);
}

