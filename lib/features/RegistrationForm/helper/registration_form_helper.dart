import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:flutter/material.dart';

class RegistrationFormHelper {

  static Future<dynamic> textFieldValidationCheck({
    required BuildContext context,
    String? registrationType,
    String? reasonRegistration,
    String? chargeId,
    String? areaId,
    String? mobileNumber,
    String? altMobileNo,
    String? firstName,
    String? middleName,
    String? lastName,
    String? guardianType,
    String? guardianName,
    String? emailId,
    String? propertyCategoryId,
    String? propertyClassId,
    String? buildingNumber,
    String? houseNumber,
    String? colonySocietyApartment,
    String? streetName,
    String? town,
    String? districtId,
    String? nearestLandmark,
    String? pinCode,
    String? latitude,
    String? longitude,
    String? residentStatus,
    String? noOfKitchen,
    String? noOfBathroom,
    String? existingCookingFuel,
    String? noOfFamilyMembers,
    String? idProof,
    String? idProofNo,
    File? idFrontPath,
    File? idBackPath,
    String? addProof,
    String? addProofNo,
    File? addFrontPath,
    File? addBackPath,
    String? ownershipProperty,
    File? ownerConsent,
    File? customerConsent,
    String? eBillingModel,
    String? bankNameOfBank,
    String? bankAccountNumber,
    String? bankIfscCode,
    String? bankAddress,
    File? nocDocPath,
    File? customerPath,
    File? housePath,
    String? acceptConversionPolicy,
    String? acceptExtraFittingCost,
    String? societyAllowedMdpe,
    String? depositStatus,
    String? reasonDeposit,
    String? depositType,
    String? depositAmt,
    String? modeDeposit,
    String? chqNo,
    String? chqDate,
    String? chqBank,
    String? chequeAccountNo,
    String? chequeMICRNo,
    File? chequePath,
    File? canceledCheque,
  }) async {
    try {
      if (registrationType == "") {
        Utils.errorSnackBar(msg: "The Registration field is required.", context: context);
        return null;
      } else if (chargeId == "") {
        Utils.errorSnackBar(msg: 'The Charge Area field is required.', context: context);
        return null;
      } else if (areaId == "") {
        Utils.errorSnackBar(msg: 'The Area field is required.', context: context);
        return null;
      } else if (mobileNumber!.isEmpty) {
        Utils.errorSnackBar(msg: "THe Mobile Number field is required.", context: context);
        return null;
      } else if (firstName!.isEmpty) {
        Utils.errorSnackBar(msg: "The First Name field is required.", context: context);
        return null;
      } else if (lastName!.isEmpty) {
        Utils.errorSnackBar(msg: "The Last Name field is required.", context: context);
        return null;
      } else if(registrationType == "Registration For LMC"){
        if (guardianType == "") {
          Utils.errorSnackBar(msg: "The Guardian Type field is required.", context: context);
          return null;
        } else if (guardianName!.isEmpty) {
          Utils.errorSnackBar(msg: "The Guardian Name field is required.", context: context);
          return null;
        } else if (propertyCategoryId == "") {
          Utils.errorSnackBar(msg: "The Property Category field is required.", context: context);
          return null;
        } else if (propertyClassId == "") {
          Utils.errorSnackBar(msg:"The Property Class Id field is required.", context: context);
          return null;
        }
      }
      if (houseNumber!.isEmpty) {
        Utils.errorSnackBar(msg: "The House Number field is required.", context: context);
        return null;
      } else if (colonySocietyApartment!.isEmpty) {
        Utils.errorSnackBar(msg: "The Colony/Society/Apartment field is required.", context: context);
        return null;
      } else if (streetName!.isEmpty) {
        Utils.errorSnackBar(msg: "The Lane/Street Name field is required.", context: context);
        return null;
      } else if (districtId == "") {
        Utils.errorSnackBar(msg: "The District field is required.", context: context);
        return null;
      } else if (pinCode!.isEmpty) {
        Utils.errorSnackBar(msg: "The Pin Code field is required. ", context: context);
        return null;
      } else if (noOfKitchen!.isEmpty) {
        Utils.errorSnackBar(msg: "The No. of Kitchen field is required.", context: context);
        return null;
      } else if (noOfBathroom!.isEmpty) {
        Utils.errorSnackBar(msg: "The No. of Bathroom field is required.", context: context);
        return null;
      } else if (existingCookingFuel == "") {
        Utils.errorSnackBar(msg: "The Cooking Fuel field is required.", context: context);
        return null;
      } else if (noOfFamilyMembers!.isEmpty) {
        Utils.errorSnackBar(msg: "The No. of Family Members field is required.", context: context);
        return null;
      } else if (idProof == "") {
        Utils.errorSnackBar(msg: "The KYC(Identification Proof) field is required.", context: context);
        return null;
      } else if (idProofNo!.isEmpty) {
        Utils.errorSnackBar(msg: "The KYC(Identification Proof)Number field is required.", context: context);
        return null;
      } else if (idFrontPath!.path.isEmpty) {
        Utils.errorSnackBar(msg: "The Id Proof Front Image field is required.", context: context);
        return null;
      } else if(registrationType == "Registration For LMC"){
        if (addProof == "") {
          Utils.errorSnackBar(msg: "The KYC (Address Proof) field is required.", context: context);
          return null;
        } else if (addProofNo!.isEmpty) {
          Utils.errorSnackBar(msg: "The KYC (Address Proof)Number field is required.", context: context);
          return null;
        } else if (addFrontPath!.path.isEmpty) {
          Utils.errorSnackBar(msg: "The Address Proof Front Image field is required.", context: context);
          return null;
        } else if (ownershipProperty == "") {
          Utils.errorSnackBar(msg: "The Ownership Type Property field is required.", context: context);
          return null;
        } else if (ownershipProperty== "Rented") {
          if(nocDocPath!.path.isEmpty){
            Utils.errorSnackBar(msg: "The NOC Document field is required.", context: context);
            return null;
          }
        } else  if (acceptConversionPolicy == "") {
          Utils.errorSnackBar(msg: "The Accept Conversion Policy field is required.", context: context);
          return null;
        } else if (acceptExtraFittingCost == "") {
          Utils.errorSnackBar(msg: "The Accept Extra Fitting Cost field is required.", context: context);
          return null;
        } else if (societyAllowedMdpe == "") {
          Utils.errorSnackBar(msg: "The Society Allows MDPE field is required.", context: context);
          return null;
        } else if (depositStatus == "") {
          Utils.errorSnackBar(msg: "The Deposit Status field is required.", context: context);
          return null;
        } else if (depositType == "") {
          Utils.errorSnackBar(msg: "The Scheme Type field is required.", context: context);
          return null;
        }
        if (modeDeposit == "") {
          Utils.errorSnackBar(msg: "The Mode Of Deposit field is required.", context: context);
          return null;
        } else if (modeDeposit == "Cheque") {
          if (chqNo!.isEmpty) {
            Utils.errorSnackBar(msg: "The Cheque Number field is required.", context: context);
            return null;
          } else if (chqDate!.isEmpty) {
            Utils.errorSnackBar(msg: "The Cheque date field is required.", context: context);
            return null;
          } else if (chqBank!.isEmpty || chqBank == "") {
            Utils.errorSnackBar(msg: "The Cheque Bank Name field is required.", context: context);
            return null;
          } else  if (chequeAccountNo!.isEmpty) {
            Utils.errorSnackBar(msg: "The Cheque Bank Account Number field is required.", context: context);
            return null;
          } else if (chequeMICRNo!.isEmpty) {
            Utils.errorSnackBar(msg: "The Cheque MICR Code field is required.", context: context);
            return null;
          } else if (chequePath!.path.isEmpty) {
            Utils.errorSnackBar(msg: "The Cheque Image field is required.", context: context);
            return null;
          }
        }
      }
      String schema = await SharedPref.getString(key: PrefsValue.schema);
      String dmaUserId = await SharedPref.getString(key: PrefsValue.userId);
      String dmaUserName = await SharedPref.getString(key: PrefsValue.userName);
      SaveRegistrationFormModel custRegSyncStore = SaveRegistrationFormModel(
        schema: schema,
        dmaUserId: dmaUserId,
        dmaUserName: dmaUserName,
        interested: registrationType,
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
        depositeType: depositType,
        depositTypeAmount: depositAmt,
        modeDepositValue: modeDeposit,
        chequeNumber: chqNo,
        chequeDepositDate: chqDate,
        payementBankName: chqBank,
        chequeBankAccount: chequeAccountNo,
        micr: chequeMICRNo,
        backSidePhoto1: idBackPath!.path,
        backSidePhoto2: addBackPath!.path,
        backSidePhoto3: nocDocPath!.path,
        documentUploadsPhoto1: idFrontPath.path,
        documentUploadsPhoto2: addFrontPath!.path,
        documentUploadsPhoto3: nocDocPath.path,
        uploadHousePhoto: housePath!.path,
        uploadCustomerPhoto: customerPath!.path,
        customerConsent: customerConsent!.path,
        ownerConsent: ownerConsent!.path,
        canceledChequePhoto: canceledCheque!.path,
        chequePhoto: chequePath!.path,
      );
      return custRegSyncStore;
    } catch (e) {
      log("textFieldValidationCheck-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
  }

  static Future<dynamic> addCustRegSyncLocalDB({
    required BuildContext context, required SaveRegistrationFormModel custRegSyncStore, required bool isUpdate,}) async {
    try {
      SaveRegistrationFormModel custRegSyncAdd = SaveRegistrationFormModel(
        dmaUserName: custRegSyncStore.dmaUserName.toString(),
        dmaUserId: custRegSyncStore.dmaUserId.toString(),
        schema: custRegSyncStore.schema.toString(),
        interested: custRegSyncStore.interested == null ? "" : custRegSyncStore.interested,
        acceptConversionPolicy: custRegSyncStore.acceptConversionPolicy == null ? "":custRegSyncStore.acceptConversionPolicy,
        acceptExtraFittingCost: custRegSyncStore.acceptExtraFittingCost == null ? "":custRegSyncStore.acceptExtraFittingCost,
        societyAllowedMdpe: custRegSyncStore.societyAllowedMdpe == null ? "":custRegSyncStore.societyAllowedMdpe,
        chargeArea: custRegSyncStore.chargeArea == null ? "":custRegSyncStore.chargeArea,
        areaId: custRegSyncStore.areaId == null ? "": custRegSyncStore.areaId,
        mobileNumber: custRegSyncStore.mobileNumber == null ? "" :custRegSyncStore.mobileNumber,
        firstName: custRegSyncStore.firstName == null ? "" :custRegSyncStore.firstName,
        middleName: custRegSyncStore.middleName == null ? "" :custRegSyncStore.middleName,
        lastName: custRegSyncStore.lastName == null ? "" :custRegSyncStore.lastName,
        guardianType: custRegSyncStore.guardianType == null ? "" : custRegSyncStore.guardianType,
        guardianName: custRegSyncStore.guardianName == null ? "" : custRegSyncStore.guardianName,
        emailId: custRegSyncStore.emailId == null ? "" : custRegSyncStore.emailId,
        propertyCategoryId: custRegSyncStore.propertyCategoryId == null ? "" : custRegSyncStore.propertyCategoryId,
        propertyClassId: custRegSyncStore.propertyClassId == null ? "" : custRegSyncStore.propertyClassId,
        buildingNumber: custRegSyncStore.buildingNumber == null ? "" : custRegSyncStore.buildingNumber,
        houseNumber: custRegSyncStore.houseNumber == null ? "" : custRegSyncStore.houseNumber,
        colonySocietyApartment: custRegSyncStore.colonySocietyApartment == null ? "" : custRegSyncStore.colonySocietyApartment,
        streetName: custRegSyncStore.streetName == null ? "" : custRegSyncStore.streetName,
        town: custRegSyncStore.town == null ? "" : custRegSyncStore.town,
        districtId: custRegSyncStore.districtId == null ? "" : custRegSyncStore.districtId,
        pinCode: custRegSyncStore.pinCode == null ? "" : custRegSyncStore.pinCode,
        residentStatus: custRegSyncStore.residentStatus  == null ? "" : custRegSyncStore.residentStatus,
        noOfKitchen: custRegSyncStore.noOfKitchen == null ? "" : custRegSyncStore.noOfKitchen,
        noOfBathroom: custRegSyncStore.noOfBathroom == null ? "" : custRegSyncStore.noOfBathroom,
        noOfFamilyMembers: custRegSyncStore.noOfFamilyMembers == null ? "" : custRegSyncStore.noOfFamilyMembers,
        existingCookingFuel: custRegSyncStore.existingCookingFuel == null ? "" : custRegSyncStore.existingCookingFuel,
        latitude: custRegSyncStore.latitude == null ? "" : custRegSyncStore.latitude,
        longitude: custRegSyncStore.longitude == null ? "" : custRegSyncStore.longitude,
        nearestLandmark: custRegSyncStore.nearestLandmark == null ? "" : custRegSyncStore.nearestLandmark,
        kycDocument1: custRegSyncStore.kycDocument1 == null ? "": custRegSyncStore.kycDocument1,
        kycDocument1Number: custRegSyncStore.kycDocument1Number == null ? "" : custRegSyncStore.kycDocument1Number,
        kycDocument2: custRegSyncStore.kycDocument2 == null ? "": custRegSyncStore.kycDocument2,
        kycDocument2Number: custRegSyncStore.kycDocument2Number == null ? "": custRegSyncStore.kycDocument2Number,
        kycDocument3: custRegSyncStore.kycDocument3 == null ? "" : custRegSyncStore.kycDocument3,
        kycDocument3Number: custRegSyncStore.kycDocument3Number== null ? "" : custRegSyncStore.kycDocument3Number,
        eBillingModel: custRegSyncStore.eBillingModel == null ? "" : custRegSyncStore.eBillingModel,
        bankNameOfBank: custRegSyncStore.bankNameOfBank== null ? "" : custRegSyncStore.bankNameOfBank,
        bankAccountNumber: custRegSyncStore.bankAccountNumber == null ? "" : custRegSyncStore.bankAccountNumber,
        bankIfscCode: custRegSyncStore.bankIfscCode == null ? "" : custRegSyncStore.bankIfscCode,
        bankAddress: custRegSyncStore.bankAddress == null ? "" : custRegSyncStore.bankAddress,
        initialDepositeStatus:  custRegSyncStore.initialDepositeStatus == null ? "" : custRegSyncStore.initialDepositeStatus,
        depositeType:  custRegSyncStore.depositeType == null ? "" : custRegSyncStore.depositeType,
        depositTypeAmount: custRegSyncStore.depositTypeAmount == null ? "" : custRegSyncStore.depositTypeAmount,
        modeDepositValue:  custRegSyncStore.modeDepositValue== null ? "" : custRegSyncStore.modeDepositValue,
        chequeNumber:custRegSyncStore.chequeNumber == null ? "" : custRegSyncStore.chequeNumber,
        chequeDepositDate: custRegSyncStore.chequeDepositDate == null ? "" : custRegSyncStore.chequeDepositDate,
        payementBankName: custRegSyncStore.payementBankName == null ? "" : custRegSyncStore.payementBankName,
        chequeBankAccount: custRegSyncStore.chequeBankAccount == null ? "" : custRegSyncStore.chequeBankAccount,
        micr: custRegSyncStore.micr == null ? "" : custRegSyncStore.micr,
        documentUploadsPhoto1:custRegSyncStore.documentUploadsPhoto1 == null ? "" : custRegSyncStore.documentUploadsPhoto1,
        documentUploadsPhoto2: custRegSyncStore.documentUploadsPhoto2 == null ? "" : custRegSyncStore.documentUploadsPhoto2,
        documentUploadsPhoto3:custRegSyncStore.documentUploadsPhoto3 == null ? "" : custRegSyncStore.documentUploadsPhoto3,
        backSidePhoto1: custRegSyncStore.backSidePhoto1 == null ? "" : custRegSyncStore.backSidePhoto1,
        backSidePhoto2: custRegSyncStore.backSidePhoto2 == null ? "" : custRegSyncStore.backSidePhoto2,
        backSidePhoto3: custRegSyncStore.backSidePhoto3 == null ? "" : custRegSyncStore.backSidePhoto3,
        uploadCustomerPhoto:  custRegSyncStore.uploadCustomerPhoto == null ? "" : custRegSyncStore.uploadCustomerPhoto,
        uploadHousePhoto:custRegSyncStore.uploadHousePhoto == null ? "" : custRegSyncStore.uploadHousePhoto,
        customerConsent:custRegSyncStore.customerConsent == null ? "" : custRegSyncStore.customerConsent,
        ownerConsent:custRegSyncStore.ownerConsent == null ? "" :  custRegSyncStore.ownerConsent,
        canceledChequePhoto: custRegSyncStore.canceledChequePhoto == null ? "" : custRegSyncStore.canceledChequePhoto,
        chequePhoto: custRegSyncStore.chequePhoto == null ? "" : custRegSyncStore.chequePhoto,
        noInitialDepositStatusReason: custRegSyncStore.noInitialDepositStatusReason == null ? "" : custRegSyncStore.noInitialDepositStatusReason,
        isDepositCheq: false,
        alternateMobile:custRegSyncStore.alternateMobile == null ? "" : custRegSyncStore.alternateMobile,
        chequeMicrAccount: custRegSyncStore.chequeMicrAccount == null ? "" : custRegSyncStore.chequeMicrAccount,
        customerConsentPhoto:custRegSyncStore.customerConsentPhoto == null ? "" : custRegSyncStore.customerConsentPhoto,
        housePhoto: custRegSyncStore.housePhoto == null ? "" : custRegSyncStore.housePhoto,
        modeOfDeposite:custRegSyncStore.modeOfDeposite == null ? "" : custRegSyncStore.modeOfDeposite,
        ownerConsentText:custRegSyncStore.ownerConsentText == null ? "" : custRegSyncStore.ownerConsentText,
        reasonForHold:custRegSyncStore.reasonForHold == null ? "" : custRegSyncStore.reasonForHold,
      );
      var mmm = await HiveDataBase.registrationFormBox!.values.toList().length;
      if(isUpdate == true){
        await HiveDataBase.registrationFormBox!.putAt(mmm , custRegSyncAdd);
        Utils.successSnackBar(msg:"Data Update Successfully",  context: context);
        Navigator.pushReplacementNamed(context, RoutesName.viewSyncRecord);
      } else{
        log("mmm-->${mmm}");
        if (mmm <= 15) {
          print("mmmLength-->${mmm.toString().length}");
           await HiveDataBase.registrationFormBox!.add(custRegSyncAdd);
          Utils.successSnackBar(msg:"Data Save Successfully",  context: context);
          Navigator.pushReplacementNamed(context, RoutesName.viewSyncRecord);
        } else {
          Utils.errorSnackBar(msg:'Error !!! \nPlease Upload Previous records', context : context);
          return null;
        }
      }
    } catch (e) {
      Utils.errorSnackBar(msg: e.toString(), context: context);
      log("addCustRegSyncLocalDB-->${e.toString()}");
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
