import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pbg_app/Service/Apis.dart';
import 'package:pbg_app/Service/api_server_dio.dart';
import 'package:pbg_app/Utils/Utils.dart';
import 'package:pbg_app/Utils/common_widgets/InternetConnectivity/connectivity_helper.dart';
import 'package:pbg_app/features/RegistrationForm/domain/model/save_registration_form_model.dart';
import 'package:pbg_app/features/viewAndSyncRecords/domain/Model/send_registration_offline_model.dart';

class ViewSyncRecordHelper {
  static Future<SendRegistrationOfflineModel?> sendData(
      {required BuildContext context,
      required SaveRegistrationFormModel custRegSyncData}) async {
    try {
      if (!await ConnectivityHelper.checkInternetConnect(context: context)) {
        return null;
      }
      var inputFormat = DateFormat('dd-MM-yyyy');
      var date1 = inputFormat.parse(custRegSyncData.chequeDepositDate.toString().replaceAll("00:00:00.000", ""));
      Map<String, String> json = {
        "interested": custRegSyncData.registrationType ?? "",
        "area_id": custRegSyncData.areaId ?? "",
        "mobile_number": custRegSyncData.mobileNumber ?? "",
        "alternateMobile": custRegSyncData.alternateMobile ?? "",
        "first_name": custRegSyncData.firstName ?? "",
        "middle_name": custRegSyncData.middleName ?? "",
        "last_name": custRegSyncData.lastName ?? "",
        "guardian_type": custRegSyncData.guardianType ?? "",
        "guardian_name": custRegSyncData.guardianName ?? "",
        "email_id": custRegSyncData.emailId ?? "",
        "property_category_id": custRegSyncData.propertyCategoryId ?? "",
        "property_class_id": custRegSyncData.propertyClassId ?? "",
        "house_number": custRegSyncData.houseNumber!,
        /*"locality": colonySocietyApartment ?? "",
         "address2": streetName ?? "",*/
        "locality": custRegSyncData.streetName ?? "",
        "address2": custRegSyncData.colonySocietyApartment ?? "",
        "town": custRegSyncData.town ?? "",
        "pin_code": custRegSyncData.pinCode ?? "",
        "society_allowed_mdpe": custRegSyncData.societyAllowedMdpe ?? "",
        // "resident_status": custRegSyncData.residentStatus ?? "",
        "resident_status": "Owner",
        "no_of_bathroom": custRegSyncData.noOfBathroom ?? "",
        "no_of_kitchen": custRegSyncData.noOfKitchen ?? "",
        "existing_cooking_fuel": custRegSyncData.existingCookingFuel ?? "",
        "no_of_family_members": custRegSyncData.noOfFamilyMembers ?? "",
        "latitude": custRegSyncData.latitude ?? "",
        "longitude": custRegSyncData.longitude ?? "",
        "remarks": custRegSyncData.noInitialDepositStatusReason ?? "",
        "schema": custRegSyncData.schema ?? "",
        "dma_user_name": custRegSyncData.dmaUserName ?? "",
        "dma_user_id": custRegSyncData.dmaUserId ?? "",
        "kyc_document_1": custRegSyncData.kycDocument1 ?? "",
        "kyc_document_1_number": custRegSyncData.kycDocument1Number ?? "",
        "kyc_document_2": custRegSyncData.kycDocument2 ?? "",
        "kyc_document_2_number": custRegSyncData.kycDocument2Number ?? "",
        "kyc_document_3": custRegSyncData.kycDocument3 ?? "",
        "kyc_document_3_number": custRegSyncData.kycDocument3Number ?? "",
        "name_of_bank": custRegSyncData.bankNameOfBank ?? "",
        "bank_account_number": custRegSyncData.bankAccountNumber ?? "",
        "bank_ifsc_code": custRegSyncData.bankIfscCode ?? "",
        "bank_address": custRegSyncData.bankAddress ?? "",
        "initial_deposite_status": custRegSyncData.initialDepositeStatus ?? "0",
        "reason_for_hold": custRegSyncData.nearestLandmark ?? "",
        "mode_of_deposite": custRegSyncData.modeOfDeposite ?? "",
        "deposite_type": custRegSyncData.schemeType ?? "",
        "initial_amount": custRegSyncData.schemeTypeAmount ?? "",
        "initial_deposite_date": date1.toString().replaceAll("00:00:00.000", ""),
        "payement_bank_name": custRegSyncData.payementBankName ?? "",
        "cheque_bank_account": custRegSyncData.chequeBankAccount ?? "",
        "cheque_number": custRegSyncData.chequeNumber ?? "",
        "district_id": custRegSyncData.districtId ?? "",
        "accept_conversion_policy":
            custRegSyncData.acceptConversionPolicy ?? "",
        "accept_extra_fitting_cost":
            custRegSyncData.acceptExtraFittingCost ?? "",
        "micr": custRegSyncData.chequeMicrAccount ?? "",
        "building_number": custRegSyncData.buildingNumber ?? "",
      };
      if (json['interested'] == "0") {
        json.remove("initial_deposite_status");
        json.remove("deposite_type");
        json.remove("initial_amount");
        json.remove("accept_conversion_policy");
        json.remove("accept_extra_fitting_cost");
      }
      log("requestBody-->${json}");
      var res = await ApiHelperDio.postDataWithFile(
          urlEndPoint: AppUrl.saveCustomerRegistrationOffline,
          body: json,
          context: context,
          imageRequestObject: [
            ImageRequestObject(
                "backside1",
                custRegSyncData.idBackPath1 == null
                    ? ""
                    : custRegSyncData.idBackPath1),
            ImageRequestObject(
                "backside2",
                custRegSyncData.addBackPath2 == null
                    ? ""
                    : custRegSyncData.addBackPath2),
            ImageRequestObject(
                "backside3",
                custRegSyncData.nocBackPath3 == null
                    ? ""
                    : custRegSyncData.nocBackPath3),
            ImageRequestObject(
                "document_uploads_1",
                custRegSyncData.idFrontPath1 == null
                    ? ""
                    : custRegSyncData.idFrontPath1),
            ImageRequestObject(
                "document_uploads_2",
                custRegSyncData.addFrontPath2 == null
                    ? ""
                    : custRegSyncData.addFrontPath2),
            ImageRequestObject(
                "document_uploads_3",
                custRegSyncData.nocFrontPath3 == null
                    ? ""
                    : custRegSyncData.nocFrontPath3),
            ImageRequestObject(
                "upload_customer_photo",
                custRegSyncData.uploadCustomerPhoto == null
                    ? ""
                    : custRegSyncData.uploadCustomerPhoto),
            ImageRequestObject(
                "upload_house_photo",
                custRegSyncData.uploadHousePhoto == null
                    ? ""
                    : custRegSyncData.uploadHousePhoto),
            ImageRequestObject(
                "canceled_cheque",
                custRegSyncData.canceledChequePhoto == null
                    ? ""
                    : custRegSyncData.canceledChequePhoto),
            ImageRequestObject(
                "cheque_photo",
                custRegSyncData.chequePhoto == null
                    ? ""
                    : custRegSyncData.chequePhoto),
            ImageRequestObject(
                "owner_consent",
                custRegSyncData.ownerConsent == null
                    ? ""
                    : custRegSyncData.ownerConsent),
            ImageRequestObject(
                "customer_consent",
                custRegSyncData.customerConsent == null
                    ? ""
                    : custRegSyncData.customerConsent),
          ]);
      log("res-->${res}");
      if (res != null) {
        return SendRegistrationOfflineModel.fromJson(res);
      }else{
        print("no response");
      }
    } catch (e) {
      log("SaveCustomerCatch-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
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
