import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:flutter/material.dart';
import 'package:pbg_app/Utils/common_widgets/res/app_config.dart';

class RegistrationFormHelper {
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
    required File chequePath,
    required File canceledCheque,
  }) async {
    try {
      if (registrationType == "") {
        Utils.errorSnackBar(
            msg: "The Registration field is required.", context: context);
        return null;
      } else if (chargeId == "") {
        Utils.errorSnackBar(
            msg: 'The Charge Area field is required.', context: context);
        return null;
      } else if (areaId == "") {
        Utils.errorSnackBar(
            msg: 'The Area field is required.', context: context);
        return null;
      } else if (mobileNumber.isEmpty) {
        Utils.errorSnackBar(
            msg: "THe Mobile Number field is required.", context: context);
        return null;
      } else if (firstName.isEmpty) {
        Utils.errorSnackBar(
            msg: "The First Name field is required.", context: context);
        return null;
      } else if (lastName.isEmpty) {
        Utils.errorSnackBar(
            msg: "The Last Name field is required.", context: context);
        return null;
      } else if (registrationType == "1") {
        if (guardianType == "") {
          Utils.errorSnackBar(
              msg: "The Guardian Type field is required.", context: context);
          return null;
        } else if (guardianName.isEmpty) {
          Utils.errorSnackBar(
              msg: "The Guardian Name field is required.", context: context);
          return null;
        } else if (propertyCategoryId == "") {
          Utils.errorSnackBar(
              msg: "The Property Category field is required.",
              context: context);
          return null;
        } else if (propertyClassId == "") {
          Utils.errorSnackBar(
              msg: "The Property Class Id field is required.",
              context: context);
          return null;
        }
      }
      if (houseNumber.isEmpty) {
        Utils.errorSnackBar(
            msg: "The House Number field is required.", context: context);
        return null;
      } else if (colonySocietyApartment.isEmpty) {
        Utils.errorSnackBar(
            msg: "The Colony/Society/Apartment field is required.",
            context: context);
        return null;
      } else if (streetName.isEmpty) {
        Utils.errorSnackBar(
            msg: "The Lane/Street Name field is required.", context: context);
        return null;
      } else if (districtId == "") {
        Utils.errorSnackBar(
            msg: "The District field is required.", context: context);
        return null;
      } else if (pinCode.isEmpty) {
        Utils.errorSnackBar(
            msg: "The Pin Code field is required. ", context: context);
        return null;
      } else if (latitude.isEmpty && longitude.isEmpty) {
        Utils.errorSnackBar(
            msg:
                "Location access denied. Please enable location services and grant location permissions in app settings to proceed.",
            context: context);
        return null;
      } else if (noOfKitchen.isEmpty) {
        Utils.errorSnackBar(
            msg: "The No. of Kitchen field is required.", context: context);
        return null;
      } else if (noOfBathroom.isEmpty) {
        Utils.errorSnackBar(
            msg: "The No. of Bathroom field is required.", context: context);
        return null;
      } else if (existingCookingFuel == "") {
        Utils.errorSnackBar(
            msg: "The Cooking Fuel field is required.", context: context);
        return null;
      } else if (noOfFamilyMembers.isEmpty) {
        Utils.errorSnackBar(
            msg: "The No. of Family Members field is required.",
            context: context);
        return null;
      } else if (idProof == "") {
        Utils.errorSnackBar(
            msg: "The KYC(Identification Proof) field is required.",
            context: context);
        return null;
      } else if (idProofNo.isEmpty) {
        Utils.errorSnackBar(
            msg: "The KYC(Identification Proof)Number field is required.",
            context: context);
        return null;
      } else if (idFrontPath.path.isEmpty) {
        Utils.errorSnackBar(
            msg: "The Id Proof Front Image field is required.",
            context: context);
        return null;
      } else if (registrationType == "1") {
        if (addProof == "") {
          Utils.errorSnackBar(
              msg: "The KYC (Address Proof) field is required.",
              context: context);
          return null;
        } else if (addProofNo.isEmpty) {
          Utils.errorSnackBar(
              msg: "The KYC (Address Proof)Number field is required.",
              context: context);
          return null;
        } else if (addFrontPath.path.isEmpty) {
          Utils.errorSnackBar(
              msg: "The Address Proof Front Image field is required.",
              context: context);
          return null;
        } else if (ownershipProperty == "") {
          Utils.errorSnackBar(
              msg: "The Ownership Type Property field is required.",
              context: context);
          return null;
        } else if (ownershipProperty == "Rented") {
          if (nocDocPath.path.isEmpty) {
            Utils.errorSnackBar(
                msg: "The NOC Document field is required.", context: context);
            return null;
          }
        } else if (acceptConversionPolicy == "") {
          Utils.errorSnackBar(
              msg: "The Accept Conversion Policy field is required.",
              context: context);
          return null;
        } else if (acceptExtraFittingCost == "") {
          Utils.errorSnackBar(
              msg: "The Accept Extra Fitting Cost field is required.",
              context: context);
          return null;
        } else if (societyAllowedMdpe == "") {
          Utils.errorSnackBar(
              msg: "The Society Allows MDPE field is required.",
              context: context);
          return null;
        } else if (depositStatus == "") {
          Utils.errorSnackBar(
              msg: "The Deposit Status field is required.", context: context);
          return null;
        } else if (schemeType == "") {
          Utils.errorSnackBar(
              msg: "The Scheme Type field is required.", context: context);
          return null;
        }
        if (modeDepositValue == "") {
          Utils.errorSnackBar(
              msg: "The Mode Of Deposit field is required.", context: context);
          return null;
        } else if (modeDepositValue == "1") {
          if (chqNo.isEmpty) {
            Utils.errorSnackBar(
                msg: "The Cheque Number field is required.", context: context);
            return null;
          } else if (chqDate.isEmpty) {
            Utils.errorSnackBar(
                msg: "The Cheque date field is required.", context: context);
            return null;
          } else if (chqBank.isEmpty || chqBank == "") {
            Utils.errorSnackBar(
                msg: "The Cheque Bank Name field is required.",
                context: context);
            return null;
          } else if (chequeAccountNo.isEmpty) {
            Utils.errorSnackBar(
                msg: "The Cheque Bank Account Number field is required.",
                context: context);
            return null;
          } else if (chequeMICRNo.isEmpty) {
            Utils.errorSnackBar(
                msg: "The Cheque MICR Code field is required.",
                context: context);
            return null;
          } else if (chequePath.path.isEmpty) {
            Utils.errorSnackBar(
                msg: "The Cheque Image field is required.", context: context);
            return null;
          }
        }
      }
      String? schema = await AppConfig.instanceInit()?.loginData.user!.schema!;
      String? dmaUserId = await AppConfig.instanceInit()?.loginData.user!.id!;
      String? dmaUserName = await AppConfig.instanceInit()?.loginData.user!.name!;
      SaveRegistrationFormModel custRegSyncStore = SaveRegistrationFormModel(
        schema: schema,
        dmaUserId: dmaUserId,
        dmaUserName: dmaUserName,
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
        idBackPath1: idBackPath.path,
        addBackPath2: addBackPath.path,
        nocBackPath3: nocDocPath.path,
        idFrontPath1: idFrontPath.path,
        addFrontPath2: addFrontPath.path,
        nocFrontPath3: nocDocPath.path,
        uploadHousePhoto: housePath.path,
        uploadCustomerPhoto: customerPath.path,
        customerConsent: customerConsent.path,
        ownerConsent: ownerConsent.path,
        canceledChequePhoto: canceledCheque.path,
        chequePhoto: chequePath.path,
        reasonRegistration: reasonRegistration,
      );
      return custRegSyncStore;
    } catch (e) {
      log("textFieldValidationCheck-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
  }

  static Future<void> addCustRegSyncLocalDB({
    required bool isUpdate,
    required int index,
    required BuildContext context,
    required SaveRegistrationFormModel custRegSyncStore,
  }) async {
    try {
      final hiveBox = await HiveDataBase.registrationFormBox;
      if (hiveBox == null) {
        Utils.errorSnackBar(msg: "Local database not available", context: context);
        return;
      }
      SaveRegistrationFormModel entry = SaveRegistrationFormModel(
        dmaUserName: custRegSyncStore.dmaUserName ?? "",
        dmaUserId: custRegSyncStore.dmaUserId ?? "",
        schema: custRegSyncStore.schema ?? "",
        registrationType: custRegSyncStore.registrationType ?? "",
        acceptConversionPolicy: custRegSyncStore.acceptConversionPolicy ?? "",
        acceptExtraFittingCost: custRegSyncStore.acceptExtraFittingCost ?? "",
        societyAllowedMdpe: custRegSyncStore.societyAllowedMdpe ?? "",
        chargeArea: custRegSyncStore.chargeArea ?? "",
        areaId: custRegSyncStore.areaId ?? "",
        mobileNumber: custRegSyncStore.mobileNumber ?? "",
        firstName: custRegSyncStore.firstName ?? "",
        middleName: custRegSyncStore.middleName ?? "",
        lastName: custRegSyncStore.lastName ?? "",
        guardianType: custRegSyncStore.guardianType ?? "",
        guardianName: custRegSyncStore.guardianName ?? "",
        emailId: custRegSyncStore.emailId ?? "",
        propertyCategoryId: custRegSyncStore.propertyCategoryId ?? "",
        propertyClassId: custRegSyncStore.propertyClassId ?? "",
        buildingNumber: custRegSyncStore.buildingNumber ?? "",
        houseNumber: custRegSyncStore.houseNumber ?? "",
        colonySocietyApartment: custRegSyncStore.colonySocietyApartment ?? "",
        streetName: custRegSyncStore.streetName ?? "",
        town: custRegSyncStore.town ?? "",
        districtId: custRegSyncStore.districtId ?? "",
        pinCode: custRegSyncStore.pinCode ?? "",
        residentStatus: custRegSyncStore.residentStatus ?? "",
        noOfKitchen: custRegSyncStore.noOfKitchen ?? "",
        noOfBathroom: custRegSyncStore.noOfBathroom ?? "",
        noOfFamilyMembers: custRegSyncStore.noOfFamilyMembers ?? "",
        existingCookingFuel: custRegSyncStore.existingCookingFuel ?? "",
        latitude: custRegSyncStore.latitude ?? "",
        longitude: custRegSyncStore.longitude ?? "",
        nearestLandmark: custRegSyncStore.nearestLandmark ?? "",
        kycDocument1: custRegSyncStore.kycDocument1 ?? "",
        kycDocument1Number: custRegSyncStore.kycDocument1Number ?? "",
        kycDocument2: custRegSyncStore.kycDocument2 ?? "",
        kycDocument2Number: custRegSyncStore.kycDocument2Number ?? "",
        kycDocument3: custRegSyncStore.kycDocument3 ?? "",
        kycDocument3Number: custRegSyncStore.kycDocument3Number ?? "",
        eBillingModel: custRegSyncStore.eBillingModel ?? "",
        bankNameOfBank: custRegSyncStore.bankNameOfBank ?? "",
        bankAccountNumber: custRegSyncStore.bankAccountNumber ?? "",
        bankIfscCode: custRegSyncStore.bankIfscCode ?? "",
        bankAddress: custRegSyncStore.bankAddress ?? "",
        initialDepositeStatus: custRegSyncStore.initialDepositeStatus ?? "",
        schemeType: custRegSyncStore.schemeType ?? "",
        schemeTypeAmount: custRegSyncStore.schemeTypeAmount ?? "",
        modeOfDeposite: custRegSyncStore.modeOfDeposite ?? "",
        chequeNumber: custRegSyncStore.chequeNumber ?? "",
        chequeDepositDate: custRegSyncStore.chequeDepositDate ?? "",
        payementBankName: custRegSyncStore.payementBankName ?? "",
        chequeBankAccount: custRegSyncStore.chequeBankAccount ?? "",
        noInitialDepositStatusReason: custRegSyncStore.noInitialDepositStatusReason ?? "",
        alternateMobile: custRegSyncStore.alternateMobile ?? "",
        chequeMicrAccount: custRegSyncStore.chequeMicrAccount ?? "",
        housePhoto: custRegSyncStore.housePhoto ?? "",
        ownerConsentText: custRegSyncStore.ownerConsentText ?? "",
        reasonForHold: custRegSyncStore.reasonForHold ?? "",
        idFrontPath1: custRegSyncStore.idFrontPath1 ?? "",
        idBackPath1: custRegSyncStore.idBackPath1 ?? "",
        addFrontPath2: custRegSyncStore.addFrontPath2 ?? "",
        addBackPath2: custRegSyncStore.addBackPath2 ?? "",
        nocFrontPath3: custRegSyncStore.nocFrontPath3 ?? "",
        nocBackPath3: custRegSyncStore.nocBackPath3 ?? "",
        uploadCustomerPhoto: custRegSyncStore.uploadCustomerPhoto ?? "",
        uploadHousePhoto: custRegSyncStore.uploadHousePhoto ?? "",
        customerConsent: custRegSyncStore.customerConsent ?? "",
        ownerConsent: custRegSyncStore.ownerConsent ?? "",
        canceledChequePhoto: custRegSyncStore.canceledChequePhoto ?? "",
        chequePhoto: custRegSyncStore.chequePhoto ?? "",
        customerConsentPhoto: custRegSyncStore.customerConsentPhoto ?? "",
        reasonRegistration: custRegSyncStore.reasonRegistration ?? "",
      );
      if (isUpdate) {
        await hiveBox.putAt(index, entry);
        Utils.successSnackBar(msg: 'Record Updated Successfully', context: context);
      } else {
        if (hiveBox.length < 15) {
          log("custRegSyncAdd${entry}");
          await hiveBox.add(entry);
          Utils.successSnackBar(
              msg: "Data Saved Successfully", context: context);
        } else {
          Utils.errorSnackBar(
              msg: 'Please upload previous records before adding more.', context: context);
        }
      }
    } catch (e) {
      Utils.errorSnackBar(msg: e.toString(), context: context);
      log("addCustRegSyncLocalDB Error: ${e.toString()}");
    }
  }

}
