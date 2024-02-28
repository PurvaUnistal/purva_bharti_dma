import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

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
        Utils.warningSnackBar(e.toString(), context);
      } else if (e is TimeoutException) {
        log("TimeoutException : ${e.toString()}");
        Utils.warningSnackBar(e.toString(), context);
      } else {
        log("Unhandled exception : ${e.toString()}");
        Utils.warningSnackBar(e.toString(), context);
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
    required String urlEndPoint,
    required var body,
    required BuildContext context,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(PrefsValue.token);
    Map<String, String> headers = {"Authorization": token!, "Content-Type": "multipart/form-data"};
    try {
      var request = new MultipartRequest("POST", Uri.parse(urlEndPoint));
      if (HiveDataBase.leadBoxCustomerRegistration!.values.isNotEmpty) {
        List<SaveCustomerRegistrationOfflineModel> saveCustRegOfflineModelHiveList = HiveDataBase.leadBoxCustomerRegistration!.values.toList();
        for (int i = 0; i < saveCustRegOfflineModelHiveList.length; i++) {
          SaveCustomerRegistrationOfflineModel saveCustRegOfflineModel = saveCustRegOfflineModelHiveList[i];
          var backSide1Image = await MultipartFile.fromPath("backside1", saveCustRegOfflineModel.backSidePhoto1!);
          request.files.add(backSide1Image);
          var backSide2Image = await MultipartFile.fromPath("backside2", saveCustRegOfflineModel.backSidePhoto2!);
          request.files.add(backSide2Image);
          var backSide3Image = await MultipartFile.fromPath("backside3", saveCustRegOfflineModel.backSidePhoto3!);
          request.files.add(backSide3Image);
          var documentUploads1 = await MultipartFile.fromPath("document_uploads_1", saveCustRegOfflineModel.documentUploadsPhoto1!);
          request.files.add(documentUploads1);
          var documentUploads2 = await MultipartFile.fromPath("document_uploads_2", saveCustRegOfflineModel.documentUploadsPhoto2!);
          request.files.add(documentUploads2);
          var documentUploads3 = await MultipartFile.fromPath("document_uploads_3", saveCustRegOfflineModel.documentUploadsPhoto3!);
          request.files.add(documentUploads3);
          var uploadCustomerPhoto = await MultipartFile.fromPath("upload_customer_photo", saveCustRegOfflineModel.uploadCustomerPhoto!);
          request.files.add(uploadCustomerPhoto);
          var uploadHousePhoto = await MultipartFile.fromPath("upload_house_photo", saveCustRegOfflineModel.uploadHousePhoto!);
          request.files.add(uploadHousePhoto);
          var customerConsentPhoto = await MultipartFile.fromPath("customer_consent", saveCustRegOfflineModel.customerConsentPhoto!);
          request.files.add(customerConsentPhoto);
          var ownerConsent = await MultipartFile.fromPath("owner_consent", saveCustRegOfflineModel.ownerConsent!);
          request.files.add(ownerConsent);
          var canceledChequePhoto = await MultipartFile.fromPath("canceled_cheque", saveCustRegOfflineModel.canceledChequePhoto!);
          request.files.add(canceledChequePhoto);
          var chequePhoto = await MultipartFile.fromPath("cheque_photo", saveCustRegOfflineModel.chequePhoto!);
          request.files.add(chequePhoto);
        }
      }
      request.fields.addAll(body);
      request.headers.addAll(headers);
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        var result = json.decode(String.fromCharCodes(responseData));
        log("result==>${result.toString()}");
        return result;
      } else {
        return Api.error;
      }
    } catch (e) {
      CustomToast.showToast(
        e.toString(),
      );
      return Api.error;
    }
  }
}
