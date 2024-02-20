import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class ApiHelper {
  static get baseUrl => GlobalConstants.BaseUrl;

  static Future<dynamic> getData(
      {required String url, required BuildContext context}) async {
    try {
      Uri uri = Uri.parse(baseUrl + url);
      var res = await get(uri);
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      } else {
        return Api.error;
      }
    } catch (e) {
      CustomToast.showToast(e.toString());
      return Api.error;
    }
  }

  static Future<dynamic> postData(
      {required String url, required var body}) async {
    try {
      var res = await post(Uri.parse(url), body: body);
      print(res.body);
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      } else {
        return Api.error;
      }
    } catch (e) {
      print(e.toString());
      CustomToast.showToast(e.toString());
      return Api.error;
    }
  }

  static Future<dynamic> postDataWithFile(
      {required String url, var body, required String filePath}) async {
    try {
      Uri uri = Uri.parse(baseUrl + url);
      print(url);
      print(body.toString());
      var uploadFile = await MultipartFile.fromPath("PHOTO", filePath);
      var request = new MultipartRequest("POST", uri);
      request.files.add(uploadFile);
      request.fields.addAll(body);
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        var result = json.decode(String.fromCharCodes(responseData));
        print(result.toString());
        return result;
      } else {
        return Api.error;
      }
    } catch (e) {
      CustomToast.showToast(e.toString());
      return Api.error;
    }
  }
}

enum Api { error }
