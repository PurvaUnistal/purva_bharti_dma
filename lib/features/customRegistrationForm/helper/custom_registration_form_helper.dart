import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:flutter/material.dart';
import 'package:pbg_app/common/HiveDatabase/hive_database.dart';
import 'package:pbg_app/features/viewAndSyncRecords/domain/Model/CustRegSyncModel.dart';


class CustomRegistrationFormHelper {

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
    String? idFrontPath,
    String? idBackPath,
    String? addProof,
    String? addProofNo,
    String? addFrontPath,
    String? addBackPath,
    String? ownershipProperty,
    String? ownerConsent,
    String? customerConsent,
    String? eBillingModel,
    String? bankNameOfBank,
    String? bankAccountNumber,
    String? bankIfscCode,
    String? bankAddress,
    String? nocDocPath,
    String? customerPath,
    String? housePath,
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
    String? chequePath,
    String? canceledCheque,
  }) async {
    try {
      if (registrationType == "null") {
        Utils.errorSnackBar(msg: "Select Registration Type", context: context);
        return null;
      }
      if (chargeId == 'null') {
        Utils.errorSnackBar(msg: 'Please select Charge Area Type', context: context);
        return null;
      }
      if (areaId == 'null') {
        Utils.errorSnackBar(msg: 'Please select Area Type', context: context);
        return null;
      }
      if (mobileNumber!.isEmpty) {
        Utils.errorSnackBar(msg: "Please enter Mobile Number", context: context);
        return null;
      }
      if (firstName!.isEmpty) {
        Utils.errorSnackBar(msg: "Please enter First Name", context: context);
        return null;
      }
      if (lastName!.isEmpty) {
        Utils.errorSnackBar(msg: "Please enter Last Name", context: context);
        return null;
      }
      if(registrationType == "Registration For LMC"){
        if (guardianType == "null") {
          Utils.errorSnackBar(msg: "Please enter Guardian Type", context: context);
          return null;
        }
        if (guardianName!.isEmpty) {
          Utils.errorSnackBar(msg: "Please enter Guardian Name", context: context);
          return null;
        }
      }
      if (propertyCategoryId == "null") {
        Utils.errorSnackBar(msg: "Please select Property Category", context: context);
        return null;
      }
      if (propertyClassId == "null") {
        Utils.errorSnackBar(msg:"Please select Property Class Id", context: context);
        return null;
      }
      /*  if (buildingNumber.isEmpty) {
        Utils.errorSnackBar(msg: "Please enter the building number", context: context);
        return null;
      }*/
      if (houseNumber!.isEmpty) {
        Utils.errorSnackBar(msg: "Please enter the House Number", context: context);
        return null;
      }
      if (colonySocietyApartment!.isEmpty) {
        Utils.errorSnackBar(msg: "Please enter the Colony/Society/Apartment", context: context);
        return null;
      }
      if (streetName!.isEmpty) {
        Utils.errorSnackBar(msg: "Please enter the Lane/Street Name", context: context);
        return null;
      }
      /*if (town.isEmpty) {
        Utils.errorSnackBar("Please enter the town", context: context);
        return null;
      }*/
      if (districtId == "null") {
        Utils.errorSnackBar(msg: "Please select the District", context: context);
        return null;
      }
      if (pinCode!.isEmpty) {
        Utils.errorSnackBar(msg: "Please enter the pin code", context: context);
        return null;
      }
      if (noOfKitchen!.isEmpty) {
        Utils.errorSnackBar(msg: "Please enter No. of Kitchen", context: context);
        return null;
      }
      if (noOfBathroom!.isEmpty) {
        Utils.errorSnackBar(msg: "Please enter No. of Bathroom", context: context);
        return null;
      }
      if (existingCookingFuel == "null") {
        Utils.errorSnackBar(msg: "Please select the Cooking Fuel", context: context);
        return null;
      }
      if (noOfFamilyMembers!.isEmpty) {
        Utils.errorSnackBar(msg: "Please enter No. of Family Members", context: context);
        return null;
      }
      if (idProof == "null") {
        Utils.errorSnackBar(msg: "Please select the Id Proof", context: context);
        return null;
      }
      if (idProofNo!.isEmpty) {
        Utils.errorSnackBar(msg: "Please enter the Id Proof Number", context: context);
        return null;
      }
      if (idFrontPath!.isEmpty) {
        Utils.errorSnackBar(msg: "Please select Id Proof Front Image", context: context);
        return null;
      }
      if(registrationType == "Registration For LMC"){
        if (addProof == "null") {
          Utils.errorSnackBar(msg: "Please select KYC (Address Proof)", context: context);
          return null;
        }
        if (addProofNo!.isEmpty) {
          Utils.errorSnackBar(msg: "Please select KYC (Address Proof) Number", context: context);
          return null;
        }
        if (addFrontPath!.isEmpty) {
          Utils.errorSnackBar(msg: "Please select Address Proof Front Image", context: context);
          return null;
        }
        if (ownershipProperty == "null") {
          Utils.errorSnackBar(msg: "Please select Ownership Type Property", context: context);
          return null;
        }
        if (ownershipProperty== "Rented") {
          if(nocDocPath!.isEmpty){
            Utils.errorSnackBar(msg: "Please select NOC Document", context: context);
            return null;
          }
        }
        if (acceptConversionPolicy == "null") {
          Utils.errorSnackBar(msg: "Please select Accept Conversion Policy", context: context);
          return null;
        }
        if (acceptExtraFittingCost == "null") {
          Utils.errorSnackBar(msg: "Please select Accept Extra Fitting CostValue", context: context);
          return null;
        }
        if (societyAllowedMdpe == "null") {
          Utils.errorSnackBar(msg: "Please select Society Allows MDPE", context: context);
          return null;
        }
        if (depositStatus == "null") {
          Utils.errorSnackBar(msg: "Please select Deposit Status", context: context);
          return null;
        }
        if (depositType == "null") {
          Utils.errorSnackBar(msg: "Please select Scheme Type", context: context);
          return null;
        }
        if (modeDeposit == "null") {
          Utils.errorSnackBar(msg: "Please select Mode Of Deposit", context: context);
          return null;
        }
        if (modeDeposit == "Cheque") {
          if (chqNo!.isEmpty) {
            Utils.errorSnackBar(msg: "Please enter Cheque Number", context: context);
            return null;
          }
          if (chqDate!.isEmpty) {
            Utils.errorSnackBar(msg: "Please select Cheque date", context: context);
            return null;
          }
          if (chqBank!.isEmpty || chqBank == "null") {
            Utils.errorSnackBar(msg: "Please select Cheque Bank Name", context: context);
            return null;
          }
          if (chequeAccountNo!.isEmpty) {
            Utils.errorSnackBar(msg: "Please enter Cheque Bank Account Number", context: context);
            return null;
          }
          if (chequeMICRNo!.isEmpty) {
            Utils.errorSnackBar(msg: "Please enter Cheque MICR Code", context: context);
            return null;
          }
          if (chequePath!.isEmpty) {
            Utils.errorSnackBar(msg: "Please select Cheque Image", context: context);
            return null;
          }
        }
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? schema = prefs.getString(PrefsValue.schema);
      String? dmaUserId = prefs.getString(PrefsValue.userId);
      String? dmaUserName = prefs.getString(PrefsValue.userName);
      CustRegSync custRegSyncStore = CustRegSync(
        schema: schema,
        dmaUserId: dmaUserId,
        dmaUserName: dmaUserName,
        interested: registrationType,
        acceptConversionPolicy: acceptConversionPolicy,
        acceptExtraFittingCost: acceptExtraFittingCost,
        societyAllowedMdpe: societyAllowedMdpe,
        areaId: areaId,
        chargeId: chargeId,
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
        nameOfBank: bankNameOfBank,
        bankAccountNumber: bankAccountNumber,
        bankIfscCode: bankIfscCode,
        bankAddress: bankAddress,
        initialDepositStatus: depositStatus,
        noInitialDepositStatusReason: reasonDeposit,
        depositType: depositType,
        initialAmount: depositAmt,
        modeOfDeposit: modeDeposit,
        chequeNumber: chqNo,
        chequeDepositDate: chqDate,
        paymentBankName: chqBank,
        chequeBankAccount: chequeAccountNo,
        micr: chequeMICRNo,
        backside1: idBackPath,
        backside2: addBackPath,
        backside3: nocDocPath,
        documentUploads1: idFrontPath,
        documentUploads2: addFrontPath,
        documentUploads3: nocDocPath,
        uploadHousePhoto: housePath,
        uploadCustomerPhoto: customerPath,
        customerConsent: customerConsent,
        ownerConsent: ownerConsent,
        canceledCheque: canceledCheque,
        chequePhoto: chequePath,
      );
      return custRegSyncStore;
    } catch (e) {
      print(e.toString());
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return true;
    }
  }

  static Future<dynamic> addCustRegSyncLocalDB({
    required BuildContext context, required CustRegSync custRegSyncStore, required bool isUpdate,}) async {
    try {
      CustRegSync custRegSyncAdd = CustRegSync(
        dmaUserName: custRegSyncStore.dmaUserName.toString() ?? "",
        dmaUserId: custRegSyncStore.dmaUserId.toString() ?? "",
        schema: custRegSyncStore.schema.toString() ?? "",
        interested: custRegSyncStore.interested.toString() ?? "",
        acceptConversionPolicy: custRegSyncStore.acceptConversionPolicy == null ? "":custRegSyncStore.acceptConversionPolicy.toString(),
        acceptExtraFittingCost: custRegSyncStore.acceptExtraFittingCost == null ? "":custRegSyncStore.acceptExtraFittingCost.toString(),
        societyAllowedMdpe: custRegSyncStore.societyAllowedMdpe == null ? "":custRegSyncStore.societyAllowedMdpe.toString(),
        chargeId: custRegSyncStore.chargeId == null ? "":custRegSyncStore.chargeId.toString(),
        areaId: custRegSyncStore.areaId == null ? "":custRegSyncStore.areaId.toString(),
        mobileNumber: custRegSyncStore.mobileNumber.toString(),
        firstName: custRegSyncStore.firstName.toString(),
        middleName: custRegSyncStore.middleName.toString(),
        lastName: custRegSyncStore.lastName.toString(),
        guardianType: custRegSyncStore.guardianType == null ? "":custRegSyncStore.guardianType.toString(),
        guardianName: custRegSyncStore.guardianName.toString(),
        emailId: custRegSyncStore.emailId.toString(),
        propertyCategoryId: custRegSyncStore.propertyCategoryId == null ? "":custRegSyncStore.propertyCategoryId.toString(),
        propertyClassId: custRegSyncStore.propertyClassId == null ? "":custRegSyncStore.propertyClassId.toString(),
        buildingNumber: custRegSyncStore.buildingNumber.toString(),
        houseNumber: custRegSyncStore.houseNumber.toString(),
        colonySocietyApartment: custRegSyncStore.colonySocietyApartment.toString(),
        streetName: custRegSyncStore.streetName.toString(),
        town: custRegSyncStore.town.toString(),
        districtId: custRegSyncStore.districtId == null ? "":custRegSyncStore.districtId.toString(),
        pinCode: custRegSyncStore.pinCode.toString(),
        residentStatus: custRegSyncStore.residentStatus.toString(),
        noOfKitchen: custRegSyncStore.noOfKitchen.toString(),
        noOfBathroom: custRegSyncStore.noOfBathroom.toString(),
        noOfFamilyMembers: custRegSyncStore.noOfFamilyMembers.toString(),
        existingCookingFuel: custRegSyncStore.existingCookingFuel.toString(),
        latitude: custRegSyncStore.latitude.toString(),
        longitude: custRegSyncStore.longitude.toString(),
        nearestLandmark: custRegSyncStore.nearestLandmark.toString(),
        kycDocument1: custRegSyncStore.kycDocument1 == null ? "":custRegSyncStore.kycDocument1.toString(),
        kycDocument1Number: custRegSyncStore.kycDocument1Number.toString(),
        kycDocument2: custRegSyncStore.kycDocument2 == null ? "":custRegSyncStore.kycDocument2.toString(),
        kycDocument2Number: custRegSyncStore.kycDocument2Number.toString(),
        kycDocument3: custRegSyncStore.kycDocument3 == null ? "":custRegSyncStore.kycDocument3.toString(),
        kycDocument3Number: custRegSyncStore.kycDocument3Number.toString(),
        eBillingModel: custRegSyncStore.eBillingModel.toString(),
        nameOfBank: custRegSyncStore.nameOfBank== null ? "":custRegSyncStore.nameOfBank.toString(),
        bankAccountNumber: custRegSyncStore.bankAccountNumber.toString(),
        bankIfscCode: custRegSyncStore.bankIfscCode.toString(),
        bankAddress: custRegSyncStore.bankAddress.toString(),
        initialDepositStatus:  custRegSyncStore.initialDepositStatus == null ? "":custRegSyncStore.initialDepositStatus.toString(),
        depositType:  custRegSyncStore.depositType == null ? "":custRegSyncStore.depositType.toString(),
        initialAmount: custRegSyncStore.initialAmount.toString(),
        modeOfDeposit:  custRegSyncStore.modeOfDeposit== null ? "":custRegSyncStore.modeOfDeposit.toString(),
        chequeNumber: custRegSyncStore.chequeNumber.toString(),
        chequeDepositDate: custRegSyncStore.chequeDepositDate.toString(),
        paymentBankName: custRegSyncStore.paymentBankName == null ? "":custRegSyncStore.paymentBankName.toString(),
        chequeBankAccount: custRegSyncStore.chequeBankAccount.toString(),
        micr: custRegSyncStore.micr.toString(),
        documentUploads1: custRegSyncStore.documentUploads1.toString(),
        documentUploads2: custRegSyncStore.documentUploads2.toString(),
        documentUploads3: custRegSyncStore.documentUploads3.toString(),
        backside1: custRegSyncStore.backside1.toString(),
        backside2: custRegSyncStore.backside2.toString(),
        backside3: custRegSyncStore.backside3.toString(),
        uploadCustomerPhoto: custRegSyncStore.uploadCustomerPhoto.toString(),
        uploadHousePhoto: custRegSyncStore.uploadHousePhoto.toString(),
        customerConsent: custRegSyncStore.customerConsent.toString(),
        ownerConsent: custRegSyncStore.ownerConsent.toString(),
        canceledCheque: custRegSyncStore.canceledCheque.toString(),
        chequePhoto: custRegSyncStore.chequePhoto.toString(),
        noInitialDepositStatusReason: custRegSyncStore.noInitialDepositStatusReason.toString(),
        isDepositChq: false,
      );
      var mmm = await HiveDataBase.custRegSyncBox!.values.toList().length;
      if(isUpdate == true){
        await HiveDataBase.custRegSyncBox!.put(mmm , custRegSyncAdd);
      } else{
        print("mmm-->${mmm}");
        if (mmm <= 15) {
          print("mmmLength-->${mmm.toString().length}");
          Utils.successSnackBar(msg:"Great Success! Record Save",  context: context);
          Navigator.pushReplacementNamed(context, RoutesName.viewSyncRecordPage);
          return await HiveDataBase.custRegSyncBox!.add(custRegSyncAdd);
        } else {
          Utils.errorSnackBar(msg:'Error !!! \nPlease Upload Previous records', context : context);
          return null;
        }
      }
    } catch (e) {
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
