import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pbg_app/Service/Apis.dart';
import 'package:pbg_app/Service/api_server_dio.dart';
import 'package:pbg_app/Utils/Utils.dart';
import 'package:pbg_app/Utils/common_widgets/InternetConnectivity/connectivity_helper.dart';
import 'package:pbg_app/Utils/common_widgets/res/app_config.dart';
import 'package:pbg_app/Utils/common_widgets/res/enums.dart';
import 'package:pbg_app/features/RegistrationForm/domain/model/save_registration_form_model.dart';
import 'package:pbg_app/features/viewAndSyncRecords/domain/Model/send_registration_offline_model.dart';

class ViewSyncRecordHelper {
  static Future<SendRegistrationOfflineModel?> sendData({
    required BuildContext context,
    required SaveRegistrationFormModel custRegSyncData,
  }) async {
    try {
      if (!await ConnectivityHelper.checkInternetConnect(context: context)) {
        return null;
      }
      var inputFormat = DateFormat('dd-MM-yyyy');
      var date1 = inputFormat.parse(
        custRegSyncData.chequeDepositDate.toString().replaceAll(
          "00:00:00.000",
          "",
        ),
      );
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
        "locality": custRegSyncData.streetName ?? "",
        "address2": custRegSyncData.colonySocietyApartment ?? "",
        "town": custRegSyncData.town ?? "",
        "pin_code": custRegSyncData.pinCode ?? "",
        "society_allowed_mdpe": custRegSyncData.societyAllowedMdpe ?? "",
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
        "accept_conversion_policy": custRegSyncData.acceptConversionPolicy ?? "",
        "accept_extra_fitting_cost": custRegSyncData.acceptExtraFittingCost ?? "",
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

      if (AppConfig.instanceInit()!.client == Client.purvaBharti
          || AppConfig.instanceInit()!.client == Client.hpoil
          || AppConfig.instanceInit()!.client == Client.hngpl) {
        json["client_request_id"] = custRegSyncData.clientRequestId ?? "";
        json["door_no"] = custRegSyncData.doorNumber ?? "";
        json["ward_no"] = custRegSyncData.wardNumber ?? "";
        json["floor"] = custRegSyncData.floorNumber ?? "";
        json["dob"] = custRegSyncData.dob ?? "00:00:00.000";
        json["landmark"] = custRegSyncData.nearestLandmark ?? "";
        json["premise_type"] = custRegSyncData.premiseType ?? "";
      }
      log("requestBody-->${json}");

      var res = await ApiHelperDio.postDataWithFile(
        urlEndPoint: AppUrl.saveCustomerRegistrationOffline,
        body: json,
        imageRequestObject: [
          ImageRequestObject(
            key: "backside1",
            path: custRegSyncData.idBackPath1 ?? "",
          ),
          ImageRequestObject(
            key: "backside2",
            path: custRegSyncData.addBackPath2 ?? "",
          ),
          ImageRequestObject(
            key: "backside3",
            path: custRegSyncData.nocBackPath3 ?? "",
          ),
          ImageRequestObject(
            key: "document_uploads_1",
            path: custRegSyncData.idFrontPath1 ?? "",
          ),
          ImageRequestObject(
            key: "document_uploads_2",
            path: custRegSyncData.addFrontPath2 ?? "",
          ),
          ImageRequestObject(
            key: "document_uploads_3",
            path: custRegSyncData.nocFrontPath3 ?? "",
          ),
          ImageRequestObject(
            key: "upload_customer_photo",
            path: custRegSyncData.uploadCustomerPhoto ?? "",
          ),
          ImageRequestObject(
            key: "upload_house_photo",
            path: custRegSyncData.uploadHousePhoto ?? "",
          ),
          ImageRequestObject(
            key: "canceled_cheque",
            path: custRegSyncData.canceledChequePhoto ?? "",
          ),
          ImageRequestObject(
            key: "cheque_photo",
            path: custRegSyncData.chequePhoto ?? "",
          ),
          ImageRequestObject(
            key: "owner_consent",
            path: custRegSyncData.ownerConsent ?? "",
          ),
          ImageRequestObject(
            key: "customer_consent",
            path: custRegSyncData.customerConsent ?? "",
          ),
        ],
      );

      log("res-->${res}");

      // ✅ FIX: Proper error handling for different response types
      if (res != null) {
        // Check if response is a Map
        if (res is Map<String, dynamic>) {
          // Check for error status codes
          if (res.containsKey('success')) {
            final successCode = res['success'];

            // If success code is not 0 or 1 (assuming 0/1 = success)
            if (successCode != 0 && successCode != 1 && successCode != true) {
              String errorMessage = "An error occurred";

              // Extract error message safely
              if (res.containsKey('errors')) {
                final errors = res['errors'];
                if (errors is List && errors.isNotEmpty) {
                  // If errors is a list of lists, flatten it
                  if (errors[0] is List) {
                    errorMessage = "Validation errors: ${errors.toString()}";
                  } else if (errors[0] is String) {
                    errorMessage = errors[0];
                  } else if (errors[0] is Map) {
                    errorMessage = errors[0].toString();
                  }
                } else if (errors is String) {
                  errorMessage = errors;
                } else if (errors is Map) {
                  errorMessage = errors.toString();
                }
              }

              log("Error Response: $errorMessage");
              Utils.errorSnackBar(msg: errorMessage, context: context);
              return null;
            }

            // If success, try to parse the model
            try {
              return SendRegistrationOfflineModel.fromJson(res);
            } catch (e) {
              log("Error parsing model: $e");
              Utils.errorSnackBar(msg: "Failed to parse response", context: context);
              return null;
            }
          }
        } else if (res is String) {
          // If response is a string, log it
          log("String response: $res");
          Utils.errorSnackBar(msg: res, context: context);
          return null;
        }

        // Default success case
        try {
          return SendRegistrationOfflineModel.fromJson(res);
        } catch (e) {
          log("Error parsing model: $e");
          Utils.errorSnackBar(msg: "Failed to process response", context: context);
          return null;
        }
      } else {
        log("No response received");
        Utils.errorSnackBar(msg: "No response from server", context: context);
      }
    } catch (e) {
      log("SaveCustomerCatch-->${e.toString()}");

      // Extract meaningful error message
      String errorMsg = e.toString();
      if (e is FormatException) {
        errorMsg = "Invalid response format from server";
      } else if (e is TypeError) {
        errorMsg = "Data type error: please check server response";
      }

      Utils.errorSnackBar(msg: errorMsg, context: context);
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
    } on SocketException catch (_) {
      isConnect = false;
    }
    return isConnect;
  }
}