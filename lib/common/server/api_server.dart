import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:pbg_app/common/Utils/common_widget/Utils.dart';

import 'api_error.dart';

class ApiServer {
  static Future<dynamic> getData({var urlEndPoint, required BuildContext context, }) async {
    try {
      final response = await get(
        Uri.parse(urlEndPoint),
      ).timeout(Duration(minutes: 4));
      log("URL-->${urlEndPoint.toString()}");
      log(urlEndPoint + "==>" + response.body);
      if (response.statusCode == 200) {
        return response.body.toString();
      } else {
        log("Api.error-->${Api.error}");
        return Api.error;
      }
    } catch (e) {
      log("ApiServer-->${e.toString()}");
      if (e is SocketException) {
        log("SocketException : ${e.toString()}");
        Utils.errorSnackBar(msg: e.toString(), context: context);
      } else if (e is TimeoutException) {
        log("TimeoutException : ${e.toString()}");
        Utils.errorSnackBar(msg: e.toString(), context: context);
      } else {
        log("Unhandled exception : ${e.toString()}");
        Utils.errorSnackBar(msg: e.toString(), context: context);
      }
      return Api.error;
    }
  }

  static Future<dynamic> postData({var urlEndPoint, required BuildContext context, var body}) async {
    try {
      final response = await post(Uri.parse(urlEndPoint),
          //  headers: APIs.headerData,
          body: json.encode(body))
          .timeout(Duration(minutes: 1));
      log("get Res ===== ${response.body}");
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      if (e is SocketException) {
        log("SocketException : ${e.toString()}");
      } else if (e is TimeoutException) {
        log("TimeoutException : ${e.toString()}");
      } else {
        log("Unhandled exception : ${e.toString()}");
      }
    }
    return null;
  }

  static Future<dynamic> postDataWithFile({
    required var endPoint, required var body,
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
    try{
      var request = MultipartRequest("POST", Uri.parse(endPoint));

      if(filePath1.isNotEmpty){
        final mimeTypeData = lookupMimeType(filePath1, headerBytes: [0xFF, 0xD8])!.split('/');
        var uploadFile = await MultipartFile.fromPath(keyWord1, filePath1,
            contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
        request.files.add(uploadFile);
      }

      if(filePath2.isNotEmpty){
        final mimeTypeData = lookupMimeType(filePath2, headerBytes: [0xFF, 0xD8])!.split('/');
        var uploadFile = await MultipartFile.fromPath(keyWord2, filePath2,
            contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
        request.files.add(uploadFile);
      }

      if(filePath3.isNotEmpty){
        final mimeTypeData = lookupMimeType(filePath3, headerBytes: [0xFF, 0xD8])!.split('/');
        var uploadFile = await MultipartFile.fromPath(keyWord3, filePath3,
            contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
        request.files.add(uploadFile);
      }

      if(filePath4.isNotEmpty){
        final mimeTypeData = lookupMimeType(filePath4, headerBytes: [0xFF, 0xD8])!.split('/');
        var uploadFile = await MultipartFile.fromPath(keyWord4, filePath4,
            contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
        request.files.add(uploadFile);
      }

      if(filePath5.isNotEmpty){
        final mimeTypeData = lookupMimeType(filePath5, headerBytes: [0xFF, 0xD8])!.split('/');
        var uploadFile = await MultipartFile.fromPath(keyWord5, filePath5,
            contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
        request.files.add(uploadFile);
      }

      if(filePath6.isNotEmpty){
        final mimeTypeData = lookupMimeType(filePath6, headerBytes: [0xFF, 0xD8])!.split('/');
        var uploadFile = await MultipartFile.fromPath(keyWord6, filePath6,
            contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
        request.files.add(uploadFile);
      }
      if(filePath7.isNotEmpty){
        final mimeTypeData = lookupMimeType(filePath7, headerBytes: [0xFF, 0xD8])!.split('/');
        var uploadFile = await MultipartFile.fromPath(keyWord7, filePath7,
            contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
        request.files.add(uploadFile);
      }

      if(filePath8.isNotEmpty){
        final mimeTypeData = lookupMimeType(filePath8, headerBytes: [0xFF, 0xD8])!.split('/');
        var uploadFile = await MultipartFile.fromPath(keyWord8, filePath8,
            contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
        request.files.add(uploadFile);
      }

      if(filePath9.isNotEmpty){
        final mimeTypeData = lookupMimeType(filePath9, headerBytes: [0xFF, 0xD8])!.split('/');
        var uploadFile = await MultipartFile.fromPath(keyWord9, filePath9,
            contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
        request.files.add(uploadFile);
      }

      if(filePath10.isNotEmpty){
        final mimeTypeData = lookupMimeType(filePath10, headerBytes: [0xFF, 0xD8])!.split('/');
        var uploadFile = await MultipartFile.fromPath(keyWord10, filePath10,
            contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
        request.files.add(uploadFile);
      }

      if(filePath11.isNotEmpty){
        final mimeTypeData = lookupMimeType(filePath11, headerBytes: [0xFF, 0xD8])!.split('/');
        var uploadFile = await MultipartFile.fromPath(keyWord11, filePath11,
            contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
        request.files.add(uploadFile);
      }

      if(filePath12.isNotEmpty){
        final mimeTypeData = lookupMimeType(filePath12, headerBytes: [0xFF, 0xD8])!.split('/');
        var uploadFile = await MultipartFile.fromPath(keyWord12, filePath12,
            contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
        request.files.add(uploadFile);
      }

      Map<String, String> headers = {
// "Authorization": token,
        "Content-Type": "multipart/form-data"
      };
      request.fields.addAll(body);
      request.headers.addAll(headers);
      var response = await request.send();
      if(response.statusCode == 200){
        var responseData = await response.stream.toBytes();
        var result = json.decode(String.fromCharCodes(responseData));
        log("result-->${result.toString()}");
        return result;
      } else if(response.statusCode == 415){
        var responseData = await response.stream.toBytes();
        var result = json.decode(String.fromCharCodes(responseData));
        log(result.toString());
        return result;
      } else if(response.statusCode == 400){
        var responseData = await response.stream.toBytes();
        var result = json.decode(String.fromCharCodes(responseData));
        log(result.toString());
        return result;
      }else {
        return null;
      }
    }catch(e){
      log("MultipartFile-->${e.toString()}");
      return null;
    }
  }

}
