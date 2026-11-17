import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:flutter/material.dart';
import 'package:pbg_app/Utils/common_widgets/res/app_config.dart';

class RegistrationFormHelper {
  /// Creates a new clientRequestId. Called only for a NEW record.
  static String newClientRequestId() =>
      DateTime.now().microsecondsSinceEpoch.toString();

  /// Shows the error and returns null, so every check can be one line.
  static Null _fail(BuildContext context, String msg) {
    Utils.errorSnackBar(msg: msg, context: context);
    return null;
  }

  static Future<dynamic> textFieldValidationCheck({
    required BuildContext context,
    required String registrationType,
    required String reasonRegistration,
    required String chargeId,
    required String areaId,
    required String mobileNumber,
    required String altMobileNo,
    required String firstName,
    required String middleName,
    required String lastName,
    required String guardianType,
    required String guardianName,
    required String emailId,
    required String propertyCategoryId,
    required String propertyClassId,
    required String buildingNumber,
    required String houseNumber,
    required String colonySocietyApartment,
    required String streetName,
    required String town,
    required String districtId,
    required String nearestLandmark,
    required String pinCode,
    required String latitude,
    required String longitude,
    required String residentStatus,
    required String noOfKitchen,
    required String noOfBathroom,
    required String existingCookingFuel,
    required String noOfFamilyMembers,
    required String idProof,
    required String idProofNo,
    required File idFrontPath,
    required File idBackPath,
    required String addProof,
    required String addProofNo,
    required File addFrontPath,
    required File addBackPath,
    required String ownershipProperty,
    required File ownerConsent,
    required File customerConsent,
    required String eBillingModel,
    required String bankNameOfBank,
    required String bankAccountNumber,
    required String bankIfscCode,
    required String bankAddress,
    required File nocDocPath,
    required File customerPath,
    required File housePath,
    required String acceptConversionPolicy,
    required String acceptExtraFittingCost,
    required String societyAllowedMdpe,
    required String depositStatus,
    required String reasonDeposit,
    required String schemeType,
    required String depositAmt,
    required String modeDepositValue,
    required String chqNo,
    required String chqDate,
    required String chqBank,
    required String chequeAccountNo,
    required String chequeMICRNo,
    required String doorNumber,
    required String wardNumber,
    required String floorNumber,
    required String dob,
    required String premiseType,
    required File chequePath,
    required File canceledCheque,
    // NEW: editing keeps the record's original id.
    bool isUpdate = false,
    String? clientRequestId,
  }) async {
    try {
      // ---------------- Basic details ----------------
      if (registrationType.isEmpty) {
        return _fail(context, "The Registration field is required.");
      }
      if (chargeId.isEmpty) {
        return _fail(context, "The Charge Area field is required.");
      }
      if (areaId.isEmpty) {
        return _fail(context, "The Area field is required.");
      }
      if (mobileNumber.isEmpty) {
        return _fail(context, "The Mobile Number field is required.");
      }
      if (firstName.isEmpty) {
        return _fail(context, "The First Name field is required.");
      }
      if (lastName.isEmpty) {
        return _fail(context, "The Last Name field is required.");
      }

      if (registrationType == "1") {
        if (guardianType.isEmpty) {
          return _fail(context, "The Guardian Type field is required.");
        }
        if (guardianName.isEmpty) {
          return _fail(context, "The Guardian Name field is required.");
        }
        if (propertyCategoryId.isEmpty) {
          return _fail(context, "The Property Category field is required.");
        }
        if (propertyClassId.isEmpty) {
          return _fail(context, "The Property Class Id field is required.");
        }
      }

      // ---------------- Address ----------------
      if (houseNumber.isEmpty) {
        return _fail(context, "The House Number field is required.");
      }
      if (colonySocietyApartment.isEmpty) {
        return _fail(context, "The Colony/Society/Apartment field is required.");
      }
      if (streetName.isEmpty) {
        return _fail(context, "The Lane/Street Name field is required.");
      }
      if (districtId.isEmpty) {
        return _fail(context, "The District field is required.");
      }
      if (pinCode.isEmpty) {
        return _fail(context, "The Pin Code field is required.");
      }
      // FIX: was `&&`, so a missing latitude OR longitude alone passed.
      if (latitude.isEmpty || longitude.isEmpty) {
        return _fail(
          context,
          "Location access denied. Please enable location services and grant "
              "location permissions in app settings to proceed.",
        );
      }
      if (noOfKitchen.isEmpty) {
        return _fail(context, "The No. of Kitchen field is required.");
      }
      if (noOfBathroom.isEmpty) {
        return _fail(context, "The No. of Bathroom field is required.");
      }
      if (existingCookingFuel.isEmpty) {
        return _fail(context, "The Cooking Fuel field is required.");
      }
      if (noOfFamilyMembers.isEmpty) {
        return _fail(context, "The No. of Family Members field is required.");
      }

      // ---------------- KYC 1 ----------------
      if (idProof.isEmpty) {
        return _fail(context, "The KYC(Identification Proof) field is required.");
      }
      if (idProofNo.isEmpty) {
        return _fail(
            context, "The KYC(Identification Proof)Number field is required.");
      }
      if (idFrontPath.path.isEmpty) {
        return _fail(context, "The Id Proof Front Image field is required.");
      }

      // ---------------- Registration-only checks ----------------
      if (registrationType == "1") {
        if (addProof.isEmpty) {
          return _fail(context, "The KYC (Address Proof) field is required.");
        }
        if (addProofNo.isEmpty) {
          return _fail(
              context, "The KYC (Address Proof)Number field is required.");
        }
        if (addFrontPath.path.isEmpty) {
          return _fail(
              context, "The Address Proof Front Image field is required.");
        }
        if (ownershipProperty.isEmpty) {
          return _fail(
              context, "The Ownership Type Property field is required.");
        }
        // FIX: this used to be an `else if` in the chain, so choosing
        // "Rented" (with a NOC) skipped ALL the checks below it.
        if (ownershipProperty == "Rented" && nocDocPath.path.isEmpty) {
          return _fail(context, "The NOC Document field is required.");
        }
        if (acceptConversionPolicy.isEmpty) {
          return _fail(
              context, "The Accept Conversion Policy field is required.");
        }
        if (acceptExtraFittingCost.isEmpty) {
          return _fail(
              context, "The Accept Extra Fitting Cost field is required.");
        }
        if (societyAllowedMdpe.isEmpty) {
          return _fail(context, "The Society Allows MDPE field is required.");
        }
        if (depositStatus.isEmpty) {
          return _fail(context, "The Deposit Status field is required.");
        }
        if (schemeType.isEmpty) {
          return _fail(context, "The Scheme Type field is required.");
        }
        if (modeDepositValue.isEmpty) {
          return _fail(context, "The Mode Of Deposit field is required.");
        }
        if (modeDepositValue == "1") {
          if (chqNo.isEmpty) {
            return _fail(context, "The Cheque Number field is required.");
          }
          if (chqDate.isEmpty) {
            return _fail(context, "The Cheque date field is required.");
          }
          if (chqBank.isEmpty) {
            return _fail(context, "The Cheque Bank Name field is required.");
          }
          if (chequeAccountNo.isEmpty) {
            return _fail(
                context, "The Cheque Bank Account Number field is required.");
          }
          if (chequeMICRNo.isEmpty) {
            return _fail(context, "The Cheque MICR Code field is required.");
          }
          if (chequePath.path.isEmpty) {
            return _fail(context, "The Cheque Image field is required.");
          }
        }
      }

      final user = AppConfig.instanceInit()?.loginData.user;

      // Edit -> keep the original id. New -> create it once, here.
      final String requestId =
      (isUpdate && (clientRequestId ?? "").isNotEmpty)
          ? clientRequestId!
          : newClientRequestId();

      return SaveRegistrationFormModel(
        clientRequestId: requestId,
        schema: user?.schema,
        dmaUserId: user?.id,
        dmaUserName: user?.name,
        registrationType: registrationType,
        acceptConversionPolicy: acceptConversionPolicy,
        acceptExtraFittingCost: acceptExtraFittingCost,
        societyAllowedMdpe: societyAllowedMdpe,
        areaId: areaId,
        chargeArea: chargeId,
        mobileNumber: mobileNumber,
        alternateMobile: altMobileNo,
        firstName: firstName,
        middleName: middleName,
        lastName: lastName,
        guardianType: guardianType,
        guardianName: guardianName,
        emailId: emailId,
        propertyCategoryId: propertyCategoryId,
        propertyClassId: propertyClassId,
        buildingNumber: buildingNumber,
        houseNumber: houseNumber,
        colonySocietyApartment: colonySocietyApartment,
        streetName: streetName,
        town: town,
        districtId: districtId,
        pinCode: pinCode,
        residentStatus: residentStatus,
        noOfKitchen: noOfKitchen,
        noOfBathroom: noOfBathroom,
        existingCookingFuel: existingCookingFuel,
        noOfFamilyMembers: noOfFamilyMembers,
        latitude: latitude,
        longitude: longitude,
        nearestLandmark: nearestLandmark,
        kycDocument1: idProof,
        kycDocument1Number: idProofNo,
        kycDocument2: addProof,
        kycDocument2Number: addProofNo,
        kycDocument3: ownershipProperty,
        eBillingModel: eBillingModel,
        bankNameOfBank: bankNameOfBank,
        bankAccountNumber: bankAccountNumber,
        bankIfscCode: bankIfscCode,
        bankAddress: bankAddress,
        initialDepositeStatus: depositStatus,
        noInitialDepositStatusReason: reasonDeposit,
        schemeType: schemeType,
        schemeTypeAmount: depositAmt,
        modeOfDeposite: modeDepositValue,
        chequeNumber: chqNo,
        chequeDepositDate: chqDate,
        payementBankName: chqBank,
        chequeBankAccount: chequeAccountNo,
        chequeMicrAccount: chequeMICRNo,
        idFrontPath1: idFrontPath.path,
        idBackPath1: idBackPath.path,
        addFrontPath2: addFrontPath.path,
        addBackPath2: addBackPath.path,
        nocFrontPath3: nocDocPath.path,
        nocBackPath3: nocDocPath.path,
        uploadHousePhoto: housePath.path,
        uploadCustomerPhoto: customerPath.path,
        customerConsent: customerConsent.path,
        ownerConsent: ownerConsent.path,
        canceledChequePhoto: canceledCheque.path,
        chequePhoto: chequePath.path,
        reasonRegistration: reasonRegistration,
        wardNumber: wardNumber,
        premiseType: premiseType,
        floorNumber: floorNumber,
        dob: dob,
        doorNumber: doorNumber,
      );
    } catch (e) {
      log("textFieldValidationCheck-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
  }

  /// Finds the Hive key of a queued record by its clientRequestId.
  /// Keys stay stable when other records are deleted; indexes do not.
  static dynamic findLocalKey(String? clientRequestId) {
    if (clientRequestId == null || clientRequestId.isEmpty) return null;
    final box = HiveDataBase.registrationFormBox;
    if (box == null) return null;
    for (final key in box.keys) {
      if (box.get(key)?.clientRequestId == clientRequestId) return key;
    }
    return null;
  }

  /// Removes a queued record (used after an edited record is sent online).
  static Future<void> deleteLocalRecord(String? clientRequestId) async {
    final key = findLocalKey(clientRequestId);
    if (key != null) {
      await HiveDataBase.registrationFormBox?.delete(key);
    }
  }

  /// Saves a record to Hive for later sync. Returns true when it was stored.
  ///  - Edit: same clientRequestId, overwrites the queued record by key.
  ///  - New:  keeps the id created in textFieldValidationCheck (never re-created).
  static Future<bool> addCustRegSyncLocalDB({
    required bool isUpdate,
    required int index, // kept so existing calls compile; not used
    required BuildContext context,
    required SaveRegistrationFormModel custRegSyncStore,
  }) async {
    try {
      final hiveBox = HiveDataBase.registrationFormBox;
      if (hiveBox == null) {
        Utils.errorSnackBar(
          msg: "Local database not available",
          context: context,
        );
        return false;
      }

      // FIX: a NEW record used to get a second, different id here. The id
      // is now created once (in textFieldValidationCheck) and reused.
      final String requestId = (custRegSyncStore.clientRequestId ?? "").isNotEmpty
          ? custRegSyncStore.clientRequestId!
          : newClientRequestId();

      final existingKey = findLocalKey(requestId);

      // A NEW record must not reuse an id that is already queued.
      if (!isUpdate && existingKey != null) {
        Utils.errorSnackBar(
          msg: "This record is already saved offline.",
          context: context,
        );
        return false;
      }

      final entry = _buildEntry(custRegSyncStore, requestId);

      // Editing a record that is still queued: overwrite it by key.
      if (isUpdate && existingKey != null) {
        await hiveBox.put(existingKey, entry);
        Utils.successSnackBar(
          msg: "No internet. Record updated offline and will sync automatically.",
          context: context,
        );
        return true;
      }

      // New record (or an edited one that was already synced meanwhile).
      // The limit applies only to new records, so an edit is never blocked.
      if (!isUpdate && hiveBox.length >= 15) {
        Utils.errorSnackBar(
          msg: 'Please upload previous records before adding more.',
          context: context,
        );
        return false;
      }

      log("custRegSyncAdd$entry");
      await hiveBox.add(entry);
      Utils.successSnackBar(
        msg: "No internet. Data saved offline and will sync automatically.",
        context: context,
      );
      return true;
    } catch (e) {
      Utils.errorSnackBar(msg: e.toString(), context: context);
      log("addCustRegSyncLocalDB Error: ${e.toString()}");
      return false;
    }
  }

  /// Fresh copy for Hive (a HiveObject instance can't live under two keys).
  static SaveRegistrationFormModel _buildEntry(
      SaveRegistrationFormModel s,
      String requestId,
      ) {
    return SaveRegistrationFormModel(
      clientRequestId: requestId,
      dmaUserName: s.dmaUserName ?? "",
      dmaUserId: s.dmaUserId ?? "",
      schema: s.schema ?? "",
      registrationType: s.registrationType ?? "",
      acceptConversionPolicy: s.acceptConversionPolicy ?? "",
      acceptExtraFittingCost: s.acceptExtraFittingCost ?? "",
      societyAllowedMdpe: s.societyAllowedMdpe ?? "",
      chargeArea: s.chargeArea ?? "",
      areaId: s.areaId ?? "",
      mobileNumber: s.mobileNumber ?? "",
      alternateMobile: s.alternateMobile ?? "",
      firstName: s.firstName ?? "",
      middleName: s.middleName ?? "",
      lastName: s.lastName ?? "",
      guardianType: s.guardianType ?? "",
      guardianName: s.guardianName ?? "",
      emailId: s.emailId ?? "",
      propertyCategoryId: s.propertyCategoryId ?? "",
      propertyClassId: s.propertyClassId ?? "",
      buildingNumber: s.buildingNumber ?? "",
      houseNumber: s.houseNumber ?? "",
      colonySocietyApartment: s.colonySocietyApartment ?? "",
      streetName: s.streetName ?? "",
      town: s.town ?? "",
      districtId: s.districtId ?? "",
      pinCode: s.pinCode ?? "",
      residentStatus: s.residentStatus ?? "",
      noOfKitchen: s.noOfKitchen ?? "",
      noOfBathroom: s.noOfBathroom ?? "",
      noOfFamilyMembers: s.noOfFamilyMembers ?? "",
      existingCookingFuel: s.existingCookingFuel ?? "",
      latitude: s.latitude ?? "",
      longitude: s.longitude ?? "",
      nearestLandmark: s.nearestLandmark ?? "",
      kycDocument1: s.kycDocument1 ?? "",
      kycDocument1Number: s.kycDocument1Number ?? "",
      kycDocument2: s.kycDocument2 ?? "",
      kycDocument2Number: s.kycDocument2Number ?? "",
      kycDocument3: s.kycDocument3 ?? "",
      kycDocument3Number: s.kycDocument3Number ?? "",
      eBillingModel: s.eBillingModel ?? "",
      bankNameOfBank: s.bankNameOfBank ?? "",
      bankAccountNumber: s.bankAccountNumber ?? "",
      bankIfscCode: s.bankIfscCode ?? "",
      bankAddress: s.bankAddress ?? "",
      initialDepositeStatus: s.initialDepositeStatus ?? "",
      noInitialDepositStatusReason: s.noInitialDepositStatusReason ?? "",
      schemeType: s.schemeType ?? "",
      schemeTypeAmount: s.schemeTypeAmount ?? "",
      modeOfDeposite: s.modeOfDeposite ?? "",
      chequeNumber: s.chequeNumber ?? "",
      chequeDepositDate: s.chequeDepositDate ?? "",
      payementBankName: s.payementBankName ?? "",
      chequeBankAccount: s.chequeBankAccount ?? "",
      chequeMicrAccount: s.chequeMicrAccount ?? "",
      housePhoto: s.housePhoto ?? "",
      ownerConsentText: s.ownerConsentText ?? "",
      reasonForHold: s.reasonForHold ?? "",
      idFrontPath1: s.idFrontPath1 ?? "",
      idBackPath1: s.idBackPath1 ?? "",
      addFrontPath2: s.addFrontPath2 ?? "",
      addBackPath2: s.addBackPath2 ?? "",
      nocFrontPath3: s.nocFrontPath3 ?? "",
      nocBackPath3: s.nocBackPath3 ?? "",
      uploadCustomerPhoto: s.uploadCustomerPhoto ?? "",
      uploadHousePhoto: s.uploadHousePhoto ?? "",
      customerConsent: s.customerConsent ?? "",
      ownerConsent: s.ownerConsent ?? "",
      canceledChequePhoto: s.canceledChequePhoto ?? "",
      chequePhoto: s.chequePhoto ?? "",
      customerConsentPhoto: s.customerConsentPhoto ?? "",
      reasonRegistration: s.reasonRegistration ?? "",
      wardNumber: s.wardNumber ?? "",
      premiseType: s.premiseType ?? "",
      floorNumber: s.floorNumber ?? "",
      dob: s.dob ?? "",
      doorNumber: s.doorNumber ?? "",
    );
  }

  static String maskAadhaar(String input) {
    final digits = input.replaceAll(RegExp(r'\D'), '');
    if (digits.length <= 4) return digits;
    return '**** **** ${digits.substring(digits.length - 4)}';
  }
}