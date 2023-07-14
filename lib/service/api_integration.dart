import 'package:hpcl_app/models/save_customer_registration_model.dart';
import 'package:http/http.dart' as http;
import '../ExportFile/export_file.dart';

class ApiIntegration{

  Future<ChangePasswordModel> changePasswordApi(ChangePasswordResponse changePasswordResponse)async{
    String url = GlobalConstants.resetPassword;
    var res = await ApiHelper.postData(url: url, body: changePasswordResponse.toJson());
    try{
      if(res != null){
        return ChangePasswordModel.fromJson(res);
      } else{
        print("Null Data");
      }
    }catch(e){
      print(e.toString());
      CustomToast.showToast(e.toString());
    }
    return null;
  }


  Future<SaveCustomerRegistrationModel> saveCustRegApi(SaveCustRegReqModel saveCustRegReqModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(GlobalConstants.token);
    Map<String, String> headers = { "Authorization": token};
    String url = GlobalConstants.saveCustomerRegistrationOffline;
    var multipartRequest =  http.MultipartRequest("Post", Uri.parse(url));
    Map<String, String> requestBody = {
      "area_id": saveCustRegReqModel.areaId,
      "mobile_number": saveCustRegReqModel.mobileNumber,
      "first_name": saveCustRegReqModel.firstName,
      "middle_name": saveCustRegReqModel.middleName,
      "last_name": saveCustRegReqModel.lastName,
      "guardian_type": saveCustRegReqModel.guardianType,
      "guardian_name": saveCustRegReqModel.guardianName,
      "email_id": saveCustRegReqModel.emailId,
      "property_category_id": saveCustRegReqModel.propertyCategoryId,
      "property_class_id": saveCustRegReqModel.propertyClassId,
      "house_number": saveCustRegReqModel.houseNumber,
      "locality": saveCustRegReqModel.locality,
      "town": saveCustRegReqModel.town,
      "pin_code": saveCustRegReqModel.pinCode,
      "society_allowed_mdpe": saveCustRegReqModel.societyAllowedMdpe,
      "resident_status": saveCustRegReqModel.residentStatus,
      "no_of_bathroom": saveCustRegReqModel.noOfBathroom,
      "no_of_kitchen": saveCustRegReqModel.noOfKitchen,
      "existing_cooking_fuel": saveCustRegReqModel.existingCookingFuel,
      "no_of_family_members": saveCustRegReqModel.noOfFamilyMembers,
      "latitude": saveCustRegReqModel.latitude,
      "longitude": saveCustRegReqModel.longitude,
      "remarks": saveCustRegReqModel.remarks,
      "schema": saveCustRegReqModel.schema,
      "dma_user_name": saveCustRegReqModel.dmaUserName,
      "dma_user_id": saveCustRegReqModel.dmaUserId,
      "owner_consent": saveCustRegReqModel.ownerConsent,
      "kyc_document_1": saveCustRegReqModel.kycDocument1,
      "kyc_document_2": saveCustRegReqModel.kycDocument2,
      "kyc_document_3": saveCustRegReqModel.kycDocument3,
      "kyc_document_2_number": saveCustRegReqModel.kycDocument2Number,
      "name_of_bank": saveCustRegReqModel.nameOfBank,
      "bank_account_number": saveCustRegReqModel.bankAccountNumber,
      "bank_ifsc_code": saveCustRegReqModel.bankIfscCode,
      "bank_address": saveCustRegReqModel.bankAddress,
      "initial_deposite_status": saveCustRegReqModel.initialDepositeStatus,
      "reason_for_hold": saveCustRegReqModel.reasonForHold,
      "mode_of_deposite": saveCustRegReqModel.modeOfDeposite,
      "deposite_type": saveCustRegReqModel.depositeType,
      "initial_amount": saveCustRegReqModel.initialAmount ?? "",
      "initial_deposite_date": saveCustRegReqModel.initialDepositeDate ?? "",
      "payement_bank_name": saveCustRegReqModel.payementBankName ?? "",
      "cheque_bank_account": saveCustRegReqModel.chequeBankAccount ?? "",
      "cheque_number": saveCustRegReqModel.chequeNumber ?? "",
      "interested": saveCustRegReqModel.interested ?? "",
      "district_id": saveCustRegReqModel.districtId ?? "",
      "kyc_document_3_number": saveCustRegReqModel.kycDocument3Number ?? "",
      "accept_conversion_policy": saveCustRegReqModel.acceptConversionPolicy ?? "",
      "accept_extra_fitting_cost": saveCustRegReqModel.acceptExtraFittingCost ?? "",
      "micr": saveCustRegReqModel.micr ?? "",
    };
    print("requestBody-->"+requestBody.toString());
    multipartRequest.headers.addAll(headers);
    multipartRequest.fields.addAll(requestBody);

    /*multipartRequest.files.add(await http.MultipartFile.fromPath("backside1", saveCustRegReqModel.backSide1));
    multipartRequest.files.add(await http.MultipartFile.fromPath("backside2", saveCustRegReqModel.backSide2));
    multipartRequest.files.add(await http.MultipartFile.fromPath("backside3", saveCustRegReqModel.backSide3));
    multipartRequest.files.add(await http.MultipartFile.fromPath("document_uploads_1", saveCustRegReqModel.documentUploads1));
    multipartRequest.files.add(await http.MultipartFile.fromPath("document_uploads_2", saveCustRegReqModel.documentUploads2));
    multipartRequest.files.add(await http.MultipartFile.fromPath("document_uploads_3", saveCustRegReqModel.documentUploads3));
    multipartRequest.files.add(await http.MultipartFile.fromPath("upload_customer_photo", saveCustRegReqModel.uploadCustomerPhoto));
    multipartRequest.files.add(await http.MultipartFile.fromPath("upload_house_photo", saveCustRegReqModel.uploadHousePhoto));
    multipartRequest.files.add(await http.MultipartFile.fromPath("customer_consent", saveCustRegReqModel.customerConsent));
    multipartRequest.files.add(await http.MultipartFile.fromPath("canceled_cheque", saveCustRegReqModel.canceledCheque));
    multipartRequest.files.add(await http.MultipartFile.fromPath("cheque_photo", saveCustRegReqModel.chequePhoto));*/

    if (saveCustRegReqModel.backSide1.isNotEmpty) {
      var rfcFormImage = await http.MultipartFile.fromPath("backside1", saveCustRegReqModel.backSide1);
      multipartRequest.files.add(rfcFormImage);
      print("saveCustRegReqModel.backSide1-->" + rfcFormImage.toString());
    } else {
      multipartRequest.fields["backside1"] = "";
    }
    if (saveCustRegReqModel.backSide2.isNotEmpty) {
     var rfcFormImage = await http.MultipartFile.fromPath("backside2", saveCustRegReqModel.backSide2);
      multipartRequest.files.add(rfcFormImage..toString());
      print("saveCustRegReqModel.backSide2-->" + rfcFormImage.toString());
    } else {
      multipartRequest.fields["backside2"] = "";
    }
    if (saveCustRegReqModel.backSide3.isNotEmpty) {
      var rfcFormImage = await http.MultipartFile.fromPath("backside3", saveCustRegReqModel.backSide3);
      multipartRequest.files.add(rfcFormImage);
      print("saveCustRegReqModel.backSide3-->" + rfcFormImage.toString());
    } else {
      multipartRequest.fields["backside3"] = "";
    }
    if (saveCustRegReqModel.documentUploads1.isNotEmpty) {
      var rfcFormImage = await http.MultipartFile.fromPath("document_uploads_1", saveCustRegReqModel.documentUploads1);
     multipartRequest.files.add(rfcFormImage);
      print("saveCustRegReqModel.documentUploads1-->" + rfcFormImage.toString());
    } else {
      multipartRequest.fields["document_uploads_1"] = "";
    }
    if (saveCustRegReqModel.documentUploads2.isNotEmpty) {
      var rfcFormImage = await http.MultipartFile.fromPath("document_uploads_2", saveCustRegReqModel.documentUploads2);
      multipartRequest.files.add(rfcFormImage);
      print("saveCustRegReqModel.documentUploads2-->" + rfcFormImage.toString());
    } else {
      multipartRequest.fields["document_uploads_2"] = "";
    }
    if (saveCustRegReqModel.documentUploads3.isNotEmpty) {
      var rfcFormImage = await http.MultipartFile.fromPath("document_uploads_3", saveCustRegReqModel.documentUploads3);
     multipartRequest.files.add(rfcFormImage);
      print("saveCustRegReqModel.documentUploads3,-->" + rfcFormImage.toString());
    } else {
      multipartRequest.fields["document_uploads_3"] = "";
    }
    if (saveCustRegReqModel.uploadCustomerPhoto.isNotEmpty) {
      var rfcFormImage = await http.MultipartFile.fromPath("upload_customer_photo", saveCustRegReqModel.uploadCustomerPhoto);
    multipartRequest.files.add(rfcFormImage);
      print("saveCustRegReqModel.uploadCustomerPhoto-->" + rfcFormImage.toString());
    } else {
      multipartRequest.fields["upload_customer_photo"] = "";
    }
    if (saveCustRegReqModel.uploadHousePhoto.isNotEmpty) {
      var rfcFormImage = await http.MultipartFile.fromPath("upload_house_photo", saveCustRegReqModel.uploadHousePhoto);
       multipartRequest.files.add(rfcFormImage);
      print("saveCustRegReqModel.uploadHousePhoto-->" + rfcFormImage.toString());
    } else {
      multipartRequest.fields["upload_house_photo"] = "";
    }
    if (saveCustRegReqModel.customerConsent.isNotEmpty) {
      var rfcFormImage = await http.MultipartFile.fromPath("customer_consent", saveCustRegReqModel.customerConsent);
     multipartRequest.files.add(rfcFormImage);
      print("saveCustRegReqModel.customerConsent-->" + rfcFormImage.toString());
    } else {
      multipartRequest.fields["customer_consent"] = "";
    }
    if (saveCustRegReqModel.canceledCheque.isNotEmpty) {
     var rfcFormImage = await http.MultipartFile.fromPath("canceled_cheque", saveCustRegReqModel.canceledCheque);
     multipartRequest.files.add(rfcFormImage);
      print("saveCustRegReqModel.canceledCheque-->" + rfcFormImage.toString());
    } else {
      multipartRequest.fields["canceled_cheque"] = "";
    }
    if (saveCustRegReqModel.chequePhoto.isNotEmpty) {
      var rfcFormImage = await http.MultipartFile.fromPath("cheque_photo", saveCustRegReqModel.chequePhoto);
      multipartRequest.files.add(rfcFormImage);
      print("saveCustRegReqModel.chequePhoto-->" + rfcFormImage.toString());
    } else {
      multipartRequest.fields["cheque_photo"] = "";
    }


    var response = await multipartRequest.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print("Response-->" + response.toString() + "responseString :" + responseString);

    try {
      if (response.statusCode == 200) {
        return SaveCustomerRegistrationModel.fromJson(json.decode(responseString));
      }
      else {
        print("Failed");
        throw Exception('Failed to load data!');
      }
    } catch(e){
      print("Failed" +e.toString());
      throw Exception('Failed to load data!');
    }

  }




}