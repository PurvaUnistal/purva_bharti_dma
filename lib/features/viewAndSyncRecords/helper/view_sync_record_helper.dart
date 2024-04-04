import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pbg_app/common/Utils/common_widget/Utils.dart';
import 'package:pbg_app/common/server/api_server.dart';
import 'package:pbg_app/common/server/app_url.dart';
import 'package:pbg_app/features/viewAndSyncRecords/domain/Model/CustRegSyncModel.dart';


class ViewSyncRecordHelper {

  static Future<SaveCustomerRegistrationOfflineModel?> sendData({required BuildContext context, required CustRegSync custRegSyncData}) async{
   try{
     Map<String, dynamic> json = {
       "area_id": custRegSyncData.areaId.toString() ?? "",
       "mobile_number":custRegSyncData.mobileNumber.toString() ?? "",
       "alternateMobile": custRegSyncData.alternateMobile.toString() ?? "",
       "first_name": custRegSyncData.firstName.toString() ?? "",
       "middle_name": custRegSyncData.middleName.toString() ?? "",
       "last_name": custRegSyncData.lastName.toString() ?? "",
       "guardian_type": custRegSyncData.guardianType.toString() ?? "",
       "guardian_name": custRegSyncData.guardianName.toString() ?? "",
       "email_id": custRegSyncData.emailId.toString() ?? "",
       "property_category_id": custRegSyncData.propertyCategoryId.toString(),
       "property_class_id": custRegSyncData.propertyClassId,
       "house_number": custRegSyncData.housePhoto.toString() ?? "",
       /*"locality": colonySocietyApartment.toString() ?? "",
      "address2": streetName.toString() ?? "",*/
       "locality": custRegSyncData.streetName.toString() ?? "",
       "address2": custRegSyncData.colonySocietyApartment.toString() ?? "",
       "town": custRegSyncData.town.toString() ?? "",
       "pin_code": custRegSyncData.pinCode.toString() ?? "",
       "society_allowed_mdpe": custRegSyncData.societyAllowedMdpe.toString() ?? "",
       "resident_status": custRegSyncData.residentStatus.toString() ?? "",
       "no_of_bathroom": custRegSyncData.noOfBathroom.toString() ?? "",
       "no_of_kitchen": custRegSyncData.noOfKitchen.toString() ?? "",
       "existing_cooking_fuel": custRegSyncData.existingCookingFuel.toString() ?? "",
       "no_of_family_members": custRegSyncData.noOfFamilyMembers.toString() ?? "",
       "latitude": custRegSyncData.latitude.toString() ?? "",
       "longitude": custRegSyncData.longitude.toString() ?? "",
       "remarks": custRegSyncData.noInitialDepositStatusReason.toString() ?? "",
       "schema": custRegSyncData.schema.toString() ?? "",
       "dma_user_name": custRegSyncData.dmaUserName.toString() ?? "",
       "dma_user_id": custRegSyncData.dmaUserId.toString() ?? "",
       "kyc_document_1": custRegSyncData.kycDocument1.toString() ?? "",
       "kyc_document_1_number": custRegSyncData.kycDocument1Number.toString() ?? "",
       "kyc_document_2": custRegSyncData.kycDocument2.toString() ?? "",
       "kyc_document_2_number": custRegSyncData.kycDocument2Number.toString() ?? "",
       "kyc_document_3": custRegSyncData.kycDocument3.toString() ?? "",
       "kyc_document_3_number": custRegSyncData.kycDocument3Number.toString() ?? "",
       "name_of_bank": custRegSyncData.nameOfBank.toString() ?? "",
       "bank_account_number": custRegSyncData.bankAccountNumber.toString() ?? "",
       "bank_ifsc_code": custRegSyncData.bankIfscCode.toString() ?? "",
       "bank_address": custRegSyncData.bankAddress.toString() ?? "",
       "initial_deposite_status": custRegSyncData.initialDepositStatus.toString() ?? "",
       "reason_for_hold": custRegSyncData.nearestLandmark.toString() ?? "",
       "mode_of_deposite": custRegSyncData.modeOfDeposit.toString() ?? "",
       "deposite_type": custRegSyncData.depositType.toString() ?? "",
       "initial_amount": custRegSyncData.initialAmount.toString() ?? "",
       "initial_deposite_date": custRegSyncData.chequeDepositDate.toString() ?? "",
       "payement_bank_name": custRegSyncData.paymentBankName.toString() ?? "",
       "cheque_bank_account": custRegSyncData.chequeBankAccount.toString() ?? "",
       "cheque_number": custRegSyncData.chequeNumber.toString() ?? "",
       "interested": custRegSyncData.interested.toString() ?? "",
       "district_id": custRegSyncData.districtId.toString() ?? "",
       "accept_conversion_policy": custRegSyncData.acceptConversionPolicy.toString() ?? "",
       "accept_extra_fitting_cost": custRegSyncData.acceptExtraFittingCost.toString() ?? "",
       "micr": custRegSyncData.micr.toString() ?? "",
       "building_number": custRegSyncData.buildingNumber.toString() ?? "",
     };
     print("json-->${json}");
     var res = await ApiServer.postDataWithFile(
         endPoint: AppUrl.saveCustomerConsentOffline,
         body: json, context: context,
         filePath1: "backside1", keyWord1:  custRegSyncData.backside1.toString(),
         filePath2: "backside2", keyWord2: custRegSyncData.backside2.toString(),
         filePath3: "backside3", keyWord3: custRegSyncData.backside3.toString(),
         filePath4: "document_uploads_1", keyWord4: custRegSyncData.documentUploads1.toString(),
         filePath5: "document_uploads_2", keyWord5: custRegSyncData.documentUploads2.toString(),
         filePath6: "document_uploads_3", keyWord6: custRegSyncData.documentUploads3.toString(),
         filePath7: "upload_customer_photo", keyWord7: custRegSyncData.uploadCustomerPhoto.toString(),
         filePath8: "upload_house_photo", keyWord8: custRegSyncData.uploadHousePhoto.toString(),
         filePath9: "canceled_cheque", keyWord9: custRegSyncData.canceledCheque.toString(),
         filePath10: "cheque_photo", keyWord10: custRegSyncData.chequePhoto.toString(),
         filePath11: "owner_consent", keyWord11: custRegSyncData.ownerConsent.toString(),
       filePath12: "customer_consent", keyWord12 : custRegSyncData.customerConsent.toString(),
     );
     return SaveCustomerRegistrationOfflineModel.fromJson(res);
   }catch(e){
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
