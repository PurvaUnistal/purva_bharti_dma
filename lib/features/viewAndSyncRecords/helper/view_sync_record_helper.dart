import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pbg_app/common/Utils/common_widget/Utils.dart';
import 'package:pbg_app/common/server/api_server.dart';
import 'package:pbg_app/common/server/app_url.dart';
import 'package:pbg_app/features/viewAndSyncRecords/domain/Model/CustRegSyncModel.dart';


class ViewSyncRecordHelper {

  static Future<SaveCustomerRegistrationOfflineModel?> sendData({required BuildContext context, required CustRegSync custRegSyncData}) async{
    try{
      Map<String, String> json =  {
        "interested": custRegSyncData.interested ?? "",
        "area_id": custRegSyncData.areaId ?? "",
        "mobile_number":custRegSyncData.mobileNumber ?? "",
        "alternateMobile": custRegSyncData.alternateMobile ?? "",
        "first_name": custRegSyncData.firstName ?? "",
        "middle_name": custRegSyncData.middleName ?? "",
        "last_name": custRegSyncData.lastName ?? "",
        "guardian_type": custRegSyncData.guardianType ?? "",
        "guardian_name": custRegSyncData.guardianName ?? "",
        "email_id": custRegSyncData.emailId ?? "",
        "property_category_id": custRegSyncData.propertyCategoryId ?? "",
        "property_class_id": custRegSyncData.propertyClassId ?? "",
        "house_number": custRegSyncData.housePhoto ?? "",
        /*"locality": colonySocietyApartment ?? "",
         "address2": streetName ?? "",*/
        "locality": custRegSyncData.streetName ?? "",
        "address2": custRegSyncData.colonySocietyApartment ?? "",
        "town": custRegSyncData.town ?? "",
        "pin_code": custRegSyncData.pinCode ?? "",
        "society_allowed_mdpe": custRegSyncData.societyAllowedMdpe ?? "",
        "resident_status": custRegSyncData.residentStatus ?? "",
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
        "name_of_bank": custRegSyncData.nameOfBank ?? "",
        "bank_account_number": custRegSyncData.bankAccountNumber ?? "",
        "bank_ifsc_code": custRegSyncData.bankIfscCode ?? "",
        "bank_address": custRegSyncData.bankAddress ?? "",
        "initial_deposite_status": custRegSyncData.initialDepositStatus ?? "",
        "reason_for_hold": custRegSyncData.nearestLandmark ?? "",
        "mode_of_deposite": custRegSyncData.modeOfDeposit ?? "",
        "deposite_type": custRegSyncData.depositType ?? "",
        "initial_amount": custRegSyncData.initialAmount ?? "",
        "initial_deposite_date": custRegSyncData.chequeDepositDate ?? "",
        "payement_bank_name": custRegSyncData.paymentBankName ?? "",
        "cheque_bank_account": custRegSyncData.chequeBankAccount ?? "",
        "cheque_number": custRegSyncData.chequeNumber ?? "",
        "district_id": custRegSyncData.districtId ?? "",
        "accept_conversion_policy": custRegSyncData.acceptConversionPolicy ?? "",
        "accept_extra_fitting_cost": custRegSyncData.acceptExtraFittingCost ?? "",
        "micr": custRegSyncData.micr ?? "",
        "building_number": custRegSyncData.buildingNumber ?? "",
      };
      print("json-->${json}");
      var res = await ApiServer.postDataWithFile(
        endPoint: AppUrl.saveCustomerRegistrationOffline,
        body: json, context: context,
        keyWord1: "backside1", filePath1: custRegSyncData.backside1 ?? "",
        keyWord2: "backside2", filePath2: custRegSyncData.backside2 ?? "",
        keyWord3: "backside3", filePath3: custRegSyncData.backside3 ?? "",
        keyWord4: "document_uploads_1", filePath4: custRegSyncData.documentUploads1 ?? "",
        keyWord5: "document_uploads_2", filePath5: custRegSyncData.documentUploads2 ?? "",
        keyWord6: "document_uploads_3", filePath6: custRegSyncData.documentUploads3 ?? "",
        keyWord7: "upload_customer_photo", filePath7: custRegSyncData.uploadCustomerPhoto ?? "",
        keyWord8: "upload_house_photo", filePath8: custRegSyncData.uploadHousePhoto ?? "",
        keyWord9: "canceled_cheque", filePath9: custRegSyncData.canceledCheque ?? "",
        keyWord10: "cheque_photo", filePath10: custRegSyncData.chequePhoto ?? "",
        keyWord11: "owner_consent", filePath11: custRegSyncData.ownerConsent ?? "",
        keyWord12: "customer_consent", filePath12 : custRegSyncData.customerConsent ?? "",
      );
      return SaveCustomerRegistrationOfflineModel.fromJson(res);
    } catch(e){
      log("SaveCustomerCatch-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
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
