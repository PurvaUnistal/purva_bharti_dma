import 'package:pbg_app/models/save_customer_registration_model.dart';
import 'package:http/http.dart' as http;
import '../ExportFile/export_file.dart';
import 'package:http_parser/http_parser.dart';

class ApiIntegration {
  static Future<dynamic> getTestData({var endPoint}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(GlobalConstants.token);
    try {
      String url = endPoint;
      final response = await get(
        Uri.parse(url.toString()),
      );
      log(url);
      log(url + "-->" + response.body);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return Api.error;
      }
    } catch (e) {
      if (e is SocketException) {
        log("SocketException : ${e.toString()}");
        //  CustomToast.showToast(e.toString());
      } else if (e is TimeoutException) {
        log("TimeoutException : ${e.toString()}");
        // CustomToast.showToast(e.toString());
      } else {
        log("Unhandled exception : ${e.toString()}");
        // CustomToast.showToast(e.toString());
      }
    }
    return null;
  }

  static Future<dynamic> getData({var urlEndPoint, var setApiData}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(GlobalConstants.token);
    try {
      String url = urlEndPoint;
      final response = await get(
        Uri.parse(url.toString()),
        headers: {
          "authorization": token,
        },
      );
      log(url);
      log(url + "-->" + response.body);
      if (response.statusCode == 200) {
        prefs.setString(setApiData, response.body);
        return jsonDecode(response.body);
        // return response.body;
      }
    } catch (e) {
      if (e is SocketException) {
        log("SocketException : ${e.toString()}");
        //  CustomToast.showToast(e.toString());
      } else if (e is TimeoutException) {
        log("TimeoutException : ${e.toString()}");
        // CustomToast.showToast(e.toString());
      } else {
        log("Unhandled exception : ${e.toString()}");
        // CustomToast.showToast(e.toString());
      }
    }
    return null;
  }

  Future<ChangePasswordModel> changePasswordApi(
      ChangePasswordResponse changePasswordResponse) async {
    String url = GlobalConstants.resetPassword;
    var res = await ApiHelper.postData(
        url: url, body: changePasswordResponse.toJson());
    try {
      if (res != null) {
        return ChangePasswordModel.fromJson(res);
      } else {
        log("Null Data");
      }
    } catch (e) {
      log(e.toString());
      CustomToast.showToast(e.toString());
    }
    return null;
  }

  Future<SaveCustomerRegistrationModel> saveCustRegApi(
      SaveCustRegReqModel saveCustRegReqModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(GlobalConstants.token);
    Map<String, String> headers = {
      // "Authorization": token,
      "Content-Type": "multipart/form-data"
    };
    String url = GlobalConstants.saveCustomerRegistrationOffline;
    log("saveCustomerRegistrationOffline-->${url}");
    try {
      var request = await http.MultipartRequest("Post", Uri.parse(url));

      Map<String, String> requestBody = {
        "schema": saveCustRegReqModel.schema ?? "",
        "dma_user_name": saveCustRegReqModel.dmaUserName ?? "",
        "dma_user_id": saveCustRegReqModel.dmaUserId ?? "",
        "interested": saveCustRegReqModel.interested ?? "",
        "accept_conversion_policy":
            saveCustRegReqModel.acceptConversionPolicy ?? "",
        "accept_extra_fitting_cost":
            saveCustRegReqModel.acceptExtraFittingCost ?? "",
        "area_id": saveCustRegReqModel.areaId ?? "",
        "mobile_number": saveCustRegReqModel.mobileNumber ?? "",
        "first_name": saveCustRegReqModel.firstName ?? "",
        "middle_name": saveCustRegReqModel.middleName ?? "",
        "last_name": saveCustRegReqModel.lastName ?? "",
        "guardian_type": saveCustRegReqModel.guardianType ?? "",
        "guardian_name": saveCustRegReqModel.guardianName ?? "",
        "email_id": saveCustRegReqModel.emailId ?? "",
        "property_category_id": saveCustRegReqModel.propertyCategoryId ?? "",
        "property_class_id": saveCustRegReqModel.propertyClassId ?? "",
        "building_number": saveCustRegReqModel.buildingNumber ?? "",
        "house_number": saveCustRegReqModel.houseNumber ?? "",
        /*"locality": saveCustRegReqModel.colonySocietyApartment ?? "", // streetName
      "address2": saveCustRegReqModel.streetName.toString() ?? "",  // colony Name*/
        "locality": saveCustRegReqModel.streetName ?? "", // streetName
        "address2": saveCustRegReqModel.colonySocietyApartment.toString() ??
            "", // colony Name
        "town": saveCustRegReqModel.town ?? "",
        "district_id": saveCustRegReqModel.districtId ?? "",
        "pin_code": saveCustRegReqModel.pinCode ?? "",
        "society_allowed_mdpe": saveCustRegReqModel.societyAllowedMdpe ?? "",
        "resident_status": saveCustRegReqModel.residentStatus ?? "",
        "no_of_bathroom": saveCustRegReqModel.noOfBathroom ?? "",
        "no_of_kitchen": saveCustRegReqModel.noOfKitchen ?? "",
        "existing_cooking_fuel": saveCustRegReqModel.existingCookingFuel ?? "",
        "no_of_family_members": saveCustRegReqModel.noOfFamilyMembers ?? "",
        "latitude": saveCustRegReqModel.latitude ?? "",
        "longitude": saveCustRegReqModel.longitude ?? "",
        "remarks": saveCustRegReqModel.remarks ?? "",
        "kyc_document_1": saveCustRegReqModel.kycDocument1 ?? "",
        "kyc_document_1_number": saveCustRegReqModel.kycDocument1Number ?? "",
        "kyc_document_2": saveCustRegReqModel.kycDocument2 ?? "",
        "kyc_document_2_number": saveCustRegReqModel.kycDocument2Number ?? "",
        "kyc_document_3": saveCustRegReqModel.kycDocument3,
        "kyc_document_3_number": saveCustRegReqModel.kycDocument3Number,
        "name_of_bank": saveCustRegReqModel.nameOfBank ?? "",
        "bank_account_number": saveCustRegReqModel.bankAccountNumber ?? "",
        "bank_ifsc_code": saveCustRegReqModel.bankIfscCode ?? "",
        "bank_address": saveCustRegReqModel.bankAddress ?? "",
        "initial_deposite_status":
            saveCustRegReqModel.initialDepositeStatus ?? "",
        "reason_for_hold": saveCustRegReqModel.reasonForHold ?? "",
        "deposite_type": saveCustRegReqModel.depositeType ?? "",
        "initial_amount": saveCustRegReqModel.initialAmount ?? "",
        "mode_of_deposite": saveCustRegReqModel.modeOfDeposite ?? "",
        "cheque_number": saveCustRegReqModel.chequeNumber ?? "",
        "initial_deposite_date": saveCustRegReqModel.initialDepositeDate ?? "",
        "payement_bank_name": saveCustRegReqModel.payementBankName ?? "",
        "cheque_bank_account": saveCustRegReqModel.chequeBankAccount ?? "",
        "micr": saveCustRegReqModel.micr ?? "",
      };
      if (requestBody['interested'] == "0") {
        requestBody.remove("initial_deposite_status");
        requestBody.remove("deposite_type");
        requestBody.remove("initial_amount");
        requestBody.remove("accept_conversion_policy");
        requestBody.remove("accept_extra_fitting_cost");
      }
      request.fields.addAll(requestBody);
      request.headers.addAll(headers);
      print("request.fields.addAll-->${requestBody}");

      if (saveCustRegReqModel.backSideImg1.isNotEmpty) {
        var backSide1Image = await http.MultipartFile.fromPath(
            "backside1", saveCustRegReqModel.backSideImg1,
            contentType: MediaType(
                "image", saveCustRegReqModel.backSideImg1.split('.').last));
        request.files.add(backSide1Image);
        log(
          "chequeImage" + saveCustRegReqModel.backSideImg1,
        );
      } else {
        request.fields["backside1"] = "";
      }
      if (saveCustRegReqModel.backSideImg2.isNotEmpty) {
        var backSide2Image = await http.MultipartFile.fromPath(
            "backside2", saveCustRegReqModel.backSideImg2,
            contentType: MediaType(
                "image", saveCustRegReqModel.backSideImg2.split('.').last));
        request.files.add(backSide2Image);
        log("chequeImage" + saveCustRegReqModel.backSideImg2);
      } else {
        request.fields["backside2"] = "";
      }
      if (saveCustRegReqModel.backSideImg3.isNotEmpty) {
        var backSide3Image = await http.MultipartFile.fromPath(
            "backside3", saveCustRegReqModel.backSideImg3,
            contentType: MediaType(
                "image", saveCustRegReqModel.backSideImg3.split('.').last));
        request.files.add(backSide3Image);
        log("chequeImage" + saveCustRegReqModel.backSideImg3);
      } else {
        request.fields["backside3"] = "";
      }
      if (saveCustRegReqModel.docUploadsImg1.isNotEmpty) {
        var docUploads1Image = await http.MultipartFile.fromPath(
            "document_uploads_1", saveCustRegReqModel.docUploadsImg1,
            contentType: MediaType(
                "image", saveCustRegReqModel.docUploadsImg1.split('.').last));
        request.files.add(docUploads1Image);
        log("chequeImage" + saveCustRegReqModel.docUploadsImg1);
      } else {
        request.fields["document_uploads_1"] = "";
      }
      if (saveCustRegReqModel.docUploadsImg2.isNotEmpty) {
        var docUploads2Image = await MultipartFile.fromPath(
            "document_uploads_2", saveCustRegReqModel.docUploadsImg2,
            contentType: MediaType(
                "image", saveCustRegReqModel.docUploadsImg2.split('.').last));
        request.files.add(docUploads2Image);
        log("chequeImage" + saveCustRegReqModel.docUploadsImg2);
      } else {
        request.fields["document_uploads_2"] = "";
      }
      if (saveCustRegReqModel.docUploadsImg3.isNotEmpty) {
        var docUploads3Image = await http.MultipartFile.fromPath(
            "document_uploads_3", saveCustRegReqModel.docUploadsImg3,
            contentType: MediaType(
                "image", saveCustRegReqModel.docUploadsImg3.split('.').last));
        request.files.add(docUploads3Image);
        log("chequeImage" + saveCustRegReqModel.docUploadsImg3);
      } else {
        request.fields["document_uploads_3"] = "";
      }
      if (saveCustRegReqModel.uploadCustomerPhoto.isNotEmpty) {
        var uploadCustImage = await http.MultipartFile.fromPath(
            "upload_customer_photo", saveCustRegReqModel.uploadCustomerPhoto,
            contentType: MediaType("image",
                saveCustRegReqModel.uploadCustomerPhoto.split('.').last));
        request.files.add(uploadCustImage);
        log("chequeImage" + saveCustRegReqModel.uploadCustomerPhoto);
      } else {
        request.fields["upload_customer_photo"] = "";
      }
      if (saveCustRegReqModel.uploadHousePhoto.isNotEmpty) {
        var uploadHouseImage = await http.MultipartFile.fromPath(
            "upload_house_photo", saveCustRegReqModel.uploadHousePhoto,
            contentType: MediaType(
                "image", saveCustRegReqModel.uploadHousePhoto.split('.').last));
        request.files.add(uploadHouseImage);
        log("chequeImage" + saveCustRegReqModel.uploadHousePhoto);
      } else {
        request.fields["upload_house_photo"] = "";
      }
      if (saveCustRegReqModel.ownerConsent.isNotEmpty) {
        var ownerConsentImage = await http.MultipartFile.fromPath(
            "owner_consent", saveCustRegReqModel.ownerConsent,
            contentType: MediaType(
                "image", saveCustRegReqModel.ownerConsent.split('.').last));
        request.files.add(ownerConsentImage);
        log("chequeImage" + saveCustRegReqModel.ownerConsent);
      } else {
        request.fields["owner_consent"] = "";
      }
      if (saveCustRegReqModel.customerConsent.isNotEmpty) {
        var customerConsentImage = await http.MultipartFile.fromPath(
            "customer_consent", saveCustRegReqModel.customerConsent,
            contentType: MediaType(
                "image", saveCustRegReqModel.customerConsent.split('.').last));
        request.files.add(customerConsentImage);
        log("chequeImage" + saveCustRegReqModel.customerConsent);
      } else {
        request.fields["customer_consent"] = "";
      }
      if (saveCustRegReqModel.canceledCheque.isNotEmpty) {
        var canceledChqImage = await http.MultipartFile.fromPath(
            "canceled_cheque", saveCustRegReqModel.canceledCheque,
            contentType: MediaType(
                "image", saveCustRegReqModel.canceledCheque.split('.').last));
        request.files.add(canceledChqImage);
        log("chequeImage" + saveCustRegReqModel.canceledCheque);
      } else {
        request.fields["canceled_cheque"] = "";
      }
      if (saveCustRegReqModel.chequePhoto.isNotEmpty) {
        var chequeImage = await http.MultipartFile.fromPath(
            "cheque_photo", saveCustRegReqModel.chequePhoto,
            contentType: MediaType(
                "image", saveCustRegReqModel.chequePhoto.split('.').last));
        request.files.add(chequeImage);
        log("chequeImage" + saveCustRegReqModel.chequePhoto);
      } else {
        request.fields["cheque_photo"] = "";
      }
      try {
        var response = await request.send().timeout(const Duration(minutes: 4));
        var responseData = await response.stream.bytesToString();
        log("responseString : ==>" + responseData);
        if (response.statusCode == 200) {
          return SaveCustomerRegistrationModel.fromJson(
              json.decode(responseData));
        } else {
          log(responseData.toString());
        }
      } catch (e) {
        CustomToast.showToast(e.toString());
        throw Exception('Failed to load data! ==>${e.toString()}');
      }
    } catch (exception) {
      log("request exception-->" + exception.toString());
    }
  }
}
