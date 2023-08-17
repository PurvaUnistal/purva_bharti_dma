import 'package:hpcl_app/models/save_customer_registration_model.dart';
import 'package:http/http.dart' as http;
import '../ExportFile/export_file.dart';

class ApiIntegration {
  Future<ChangePasswordModel> changePasswordApi(
      ChangePasswordResponse changePasswordResponse) async {
    String url = GlobalConstants.resetPassword;
    var res = await ApiHelper.postData(
        url: url, body: changePasswordResponse.toJson());
    try {
      if (res != null) {
        return ChangePasswordModel.fromJson(res);
      } else {
        print("Null Data");
      }
    } catch (e) {
      print(e.toString());
      CustomToast.showToast(e.toString());
    }
    return null;
  }

  Future<SaveCustomerRegistrationModel> saveCustRegApi(
      SaveCustRegReqModel saveCustRegReqModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(GlobalConstants.token);
    Map<String, String> headers = {"Authorization": token};
    String url = GlobalConstants.saveCustomerRegistrationOffline;
    print("url" + url);
    var request = await http.MultipartRequest("Post", Uri.parse(url));
    Map<String, String> requestBody = {
      "schema": saveCustRegReqModel.schema ?? "",
      "dma_user_name": saveCustRegReqModel.dmaUserName ?? "",
      "dma_user_id": saveCustRegReqModel.dmaUserId ?? "",
      "interested": saveCustRegReqModel.interested ?? "",
      "accept_conversion_policy": saveCustRegReqModel.acceptConversionPolicy ?? "",
      "accept_extra_fitting_cost": saveCustRegReqModel.acceptExtraFittingCost ?? "",
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
      "address2": saveCustRegReqModel.colonySocietyApartment.toString() ?? "",  // colony Name
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
      "kyc_document_3": saveCustRegReqModel.kycDocument3 ?? "",
      "kyc_document_3_number": saveCustRegReqModel.kycDocument3Number ?? "",
      "name_of_bank": saveCustRegReqModel.nameOfBank ?? "",
      "bank_account_number": saveCustRegReqModel.bankAccountNumber ?? "",
      "bank_ifsc_code": saveCustRegReqModel.bankIfscCode ?? "",
      "bank_address": saveCustRegReqModel.bankAddress ?? "",
      "initial_deposite_status": saveCustRegReqModel.initialDepositeStatus ?? "",
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
    print("requestBody-->" + requestBody.toString());
    request.headers.addAll(headers);
    request.fields.addAll(requestBody);

    if (saveCustRegReqModel.backSideImg1.isNotEmpty) {
      var backSide1Image = await http.MultipartFile.fromPath(
          "backside1", saveCustRegReqModel.backSideImg1);
      request.files.add(backSide1Image);
      print("backside1-->" + backSide1Image.toString());
    } else {
      request.fields["backside1"] = "";
    }
    if (saveCustRegReqModel.backSideImg2.isNotEmpty) {
      var backSide2Image = await http.MultipartFile.fromPath(
          "backside2", saveCustRegReqModel.backSideImg2);
      request.files.add(backSide2Image..toString());
      print("backside2-->" + backSide2Image.toString());
    } else {
      request.fields["backside2"] = "";
    }
    if (saveCustRegReqModel.backSideImg3.isNotEmpty) {
      var backSide3Image = await http.MultipartFile.fromPath(
          "backside3", saveCustRegReqModel.backSideImg3);
      request.files.add(backSide3Image);
      print("backside3-->" + backSide3Image.toString());
    } else {
      request.fields["backside3"] = "";
    }
    if (saveCustRegReqModel.docUploadsImg1.isNotEmpty) {
      var docUploads1Image = await http.MultipartFile.fromPath(
          "document_uploads_1", saveCustRegReqModel.docUploadsImg1);
      request.files.add(docUploads1Image);
      print("docUploads1Image-->" + docUploads1Image.toString());
    } else {
      request.fields["document_uploads_1"] = "";
    }
    if (saveCustRegReqModel.docUploadsImg2.isNotEmpty) {
      var docUploads2Image = await http.MultipartFile.fromPath(
          "document_uploads_2", saveCustRegReqModel.docUploadsImg2);
      request.files.add(docUploads2Image);
      print("docUploads2Image-->" + docUploads2Image.toString());
    } else {
      request.fields["document_uploads_2"] = "";
    }
    if (saveCustRegReqModel.docUploadsImg3.isNotEmpty) {
      var docUploads3Image = await http.MultipartFile.fromPath(
          "document_uploads_3", saveCustRegReqModel.docUploadsImg3);
      request.files.add(docUploads3Image);
      print("docUploads3Image-->" + docUploads3Image.toString());
    } else {
      request.fields["document_uploads_3"] = "";
    }
    if (saveCustRegReqModel.uploadCustomerPhoto.isNotEmpty) {
      var uploadCustImage = await http.MultipartFile.fromPath("upload_customer_photo", saveCustRegReqModel.uploadCustomerPhoto);
      request.files.add(uploadCustImage);
      print("uploadCustImage-->" + uploadCustImage.toString());
    } else {
      request.fields["upload_customer_photo"] = "";
    }
    if (saveCustRegReqModel.uploadHousePhoto.isNotEmpty) {
      var uploadHouseImage = await http.MultipartFile.fromPath(
          "upload_house_photo", saveCustRegReqModel.uploadHousePhoto);
      request.files.add(uploadHouseImage);
      print("uploadHouseImage-->" + uploadHouseImage.toString());
    } else {
      request.fields["upload_house_photo"] = "";
    }
    if (saveCustRegReqModel.ownerConsent.isNotEmpty) {
      var ownerConsentImage = await http.MultipartFile.fromPath("owner_consent", saveCustRegReqModel.ownerConsent);
      request.files.add(ownerConsentImage);
      print("ownerConsentLength-->" +ownerConsentImage.length.toString());
      print("ownerConsentImage-->" + ownerConsentImage.toString());
    } else {
      request.fields["owner_consent"] = "";
    }
    if (saveCustRegReqModel.customerConsent.isNotEmpty) {
      var customerConsentImage = await http.MultipartFile.fromPath(
          "customer_consent", saveCustRegReqModel.customerConsent);
      request.files.add(customerConsentImage);
      print("customerConsentImage-->" + customerConsentImage.toString());
    } else {
      request.fields["customer_consent"] = "";
    }
    if (saveCustRegReqModel.canceledCheque.isNotEmpty) {
      var canceledChqImage = await http.MultipartFile.fromPath("canceled_cheque", saveCustRegReqModel.canceledCheque);
      request.files.add(canceledChqImage);
      print("canceledChqImage-->" + canceledChqImage.toString());
    } else {
      request.fields["canceled_cheque"] = "";
    }
    if (saveCustRegReqModel.chequePhoto.isNotEmpty) {
      var chequeImage = await http.MultipartFile.fromPath("cheque_photo", saveCustRegReqModel.chequePhoto);
      request.files.add(chequeImage);
      print("chequeImage-->" + chequeImage.toString());
    } else {
      request.fields["cheque_photo"] = "";
    }
    print("requestBody-->" + requestBody.toString());
    try {
      var response = await request.send();
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      print("Response-->" + response.toString());
      print("responseString :" + responseString);
      if (response.statusCode == 200) {
        return SaveCustomerRegistrationModel.fromJson(
            json.decode(responseString));
      }
    } catch (e) {
      print("Failed------------>" + e.toString());
      CustomToast.showToast(e.toString());
      throw Exception(e.toString());
    }
  }
}
