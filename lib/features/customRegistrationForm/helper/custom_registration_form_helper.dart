import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:flutter/material.dart';
import 'package:pbg_app/common/HiveDatabase/hive_database.dart';
import 'package:pbg_app/features/viewAndSyncRecords/domain/Model/CustRegSyncModel.dart';


class CustomRegistrationFormHelper {

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
    String? residentStatus,
    required String noOfKitchen,
    required String noOfBathroom,
    required String existingCookingFuel,
    required String noOfFamilyMembers,
    required String idProof,
    required String idProofNo,
    required String idFrontPath,
    required String idBackPath,
    required String addProof,
    required String addProofNo,
    required String addFrontPath,
    required String addBackPath,
    required String ownershipProperty,
    String? ownerConsent,
    String? eBillingModel,
    String? bankNameOfBank,
    String? bankAccountNumber,
    String? bankIfscCode,
    String? bankAddress,
    required String nocDocPath,
    required String customerPath,
    required String housePath,
    required String acceptConversionPolicy,
    required String acceptExtraFittingCost,
    required String societyAllowedMdpe,
    required String depositStatus,
    required String reasonDeposit,
    required String depositType,
    required String depositAmt,
    required String modeDeposit,
    required String chqNo,
    required String chqDate,
    required String chqBank,
    required String chequeAccountNo,
    required String chequeMICRNo,
    required String chequePath,
  }) async {
    try {
      if (registrationType.isEmpty || registrationType == "null") {
        CustomToast.showToast("Select Registration Type");
        return null;
      }
      if (chargeId.isEmpty || chargeId == 'null') {
        CustomToast.showToast('Please select Charge Area Type');
        return null;
      }
      if (areaId.isEmpty || areaId == 'null') {
        CustomToast.showToast('Please select Area Type');
        return null;
      }
      if (mobileNumber.isEmpty) {
        CustomToast.showToast("Please enter Mobile Number");
        return null;
      }
      if (firstName.isEmpty || firstName == "") {
        CustomToast.showToast("Please enter First Name");
        return null;
      }
      if (lastName.isEmpty || lastName == "") {
        CustomToast.showToast("Please enter Last Name");
        return null;
      }
      if(registrationType == "Registration For LMC"){
        if (guardianType.isEmpty || guardianType == "null") {
          CustomToast.showToast("Please enter Guardian Type");
          return null;
        }
        if (guardianName.isEmpty) {
          CustomToast.showToast("Please enter Guardian Name");
          return null;
        }
      }
      if (propertyCategoryId.isEmpty || propertyCategoryId == "null") {
        CustomToast.showToast("Please select Property Category");
        return null;
      }
      if (propertyClassId.isEmpty || propertyClassId == "null") {
        CustomToast.showToast("Please select Property Class Id");
        return null;
      }
      /*  if (buildingNumber.isEmpty) {
        CustomToast.showToast("Please enter the building number");
        return null;
      }*/
      if (houseNumber.isEmpty) {
        CustomToast.showToast("Please enter the House Number");
        return null;
      }
      if (colonySocietyApartment.isEmpty) {
        CustomToast.showToast("Please enter the Colony/Society/Apartment");
        return null;
      }
      if (streetName.isEmpty) {
        CustomToast.showToast("Please enter the Lane/Street Name");
        return null;
      }
      /*if (town.isEmpty) {
        CustomToast.showToast("Please enter the town");
        return null;
      }*/
      if (districtId.isEmpty || districtId == "null") {
        CustomToast.showToast("Please select the District");
        return null;
      }
      if (pinCode.isEmpty) {
        CustomToast.showToast("Please enter the pin code");
        return null;
      }
      if (noOfKitchen.isEmpty) {
        CustomToast.showToast("Please enter No. of Kitchen");
        return null;
      }
      if (noOfBathroom.isEmpty) {
        CustomToast.showToast("Please enter No. of Bathroom");
        return null;
      }
      if (existingCookingFuel.isEmpty || existingCookingFuel == "null") {
        CustomToast.showToast("Please select the Cooking Fuel");
        return null;
      }
      if (noOfFamilyMembers.isEmpty) {
        CustomToast.showToast("Please enter No. of Family Members");
        return null;
      }
      if (idProof.isEmpty || idProof == "null") {
        CustomToast.showToast("Please select the Id Proof");
        return null;
      }
      if (idProofNo.isEmpty) {
        CustomToast.showToast("Please enter the Id Proof Number");
        return null;
      }
      if (idFrontPath.isEmpty) {
        CustomToast.showToast("Please select Id Proof Front Image");
        return null;
      }
      if(registrationType == "Registration For LMC"){
        if (addProof.isEmpty || addProof == "null") {
          CustomToast.showToast("Please select KYC (Address Proof)");
          return null;
        }
        if (addProofNo.isEmpty) {
          CustomToast.showToast("Please select KYC (Address Proof) Number");
          return null;
        }
        if (addFrontPath.isEmpty) {
          CustomToast.showToast("Please select Address Proof Front Image");
          return null;
        }
        if (ownershipProperty.isEmpty || ownershipProperty == "null") {
          CustomToast.showToast("Please select Ownership Type Property");
          return null;
        }
        if (ownershipProperty== "Rented") {
          if(nocDocPath.isEmpty){
            CustomToast.showToast("Please select NOC Document");
            return null;
          }
        }
        if (acceptConversionPolicy.isEmpty || acceptConversionPolicy == "null") {
          CustomToast.showToast("Please select Accept Conversion Policy");
          return null;
        }
        if (acceptExtraFittingCost.isEmpty || acceptExtraFittingCost == "null") {
          CustomToast.showToast("Please select Accept Extra Fitting CostValue");
          return null;
        }
        if (societyAllowedMdpe.isEmpty || societyAllowedMdpe == "null") {
          CustomToast.showToast("Please select Society Allows MDPE");
          return null;
        }
        if (depositStatus.isEmpty || depositStatus == "null") {
          CustomToast.showToast("Please select Deposit Status");
          return null;
        }
        if (depositType.isEmpty || depositType == "null") {
          CustomToast.showToast("Please select Scheme Type");
          return null;
        }
        if (modeDeposit.isEmpty || modeDeposit == "null") {
          CustomToast.showToast("Please select Mode Of Deposit");
          return null;
        }
        if (modeDeposit == "Cheque") {
          if (chqNo.isEmpty) {
            CustomToast.showToast("Please enter Cheque Number");
            return null;
          }
          if (chqDate.isEmpty) {
            CustomToast.showToast("Please select Cheque date");
            return null;
          }
          if (chqBank.isEmpty || chqBank == "null") {
            CustomToast.showToast("Please select Cheque Bank Name");
            return null;
          }
          if (chequeAccountNo.isEmpty) {
            CustomToast.showToast("Please enter Cheque Bank Account Number");
            return null;
          }
          if (chequeMICRNo.isEmpty) {
            CustomToast.showToast("Please enter Cheque MICR Code");
            return null;
          }
          if (chequePath.isEmpty) {
            CustomToast.showToast("Please select Cheque Image");
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
        customerConsent: "",
        ownerConsent: "",
        canceledCheque: "",
        chequePhoto: chequePath,
      );
      return custRegSyncStore;
    } catch (e) {
      print(e.toString());
      CustomToast.showToast(e.toString());
      return true;
    }
  }

  static Future<dynamic> addCustRegSyncLocalDB({
    required BuildContext context, required CustRegSync custRegSyncStore, required bool isUpdate,}) async {
    try {
      CustRegSync custRegSyncAdd = CustRegSync(
        dmaUserName: custRegSyncStore.dmaUserName.toString(),
        dmaUserId: custRegSyncStore.dmaUserId.toString(),
        schema: custRegSyncStore.schema.toString(),
        interested: custRegSyncStore.interested.toString(),
        acceptConversionPolicy: custRegSyncStore.acceptConversionPolicy.toString(),
        acceptExtraFittingCost: custRegSyncStore.acceptExtraFittingCost.toString(),
        societyAllowedMdpe: custRegSyncStore.societyAllowedMdpe.toString(),
        chargeId: custRegSyncStore.chargeId.toString(),
        areaId: custRegSyncStore.areaId.toString(),
        mobileNumber: custRegSyncStore.mobileNumber.toString(),
        firstName: custRegSyncStore.firstName.toString(),
        middleName: custRegSyncStore.middleName.toString(),
        lastName: custRegSyncStore.lastName.toString(),
        guardianType: custRegSyncStore.guardianType.toString(),
        guardianName: custRegSyncStore.guardianName.toString(),
        emailId: custRegSyncStore.emailId.toString(),
        propertyCategoryId: custRegSyncStore.propertyCategoryId.toString(),
        propertyClassId: custRegSyncStore.propertyClassId.toString(),
        buildingNumber: custRegSyncStore.buildingNumber.toString(),
        houseNumber: custRegSyncStore.houseNumber.toString(),
        colonySocietyApartment: custRegSyncStore.colonySocietyApartment.toString(),
        streetName: custRegSyncStore.streetName.toString(),
        town: custRegSyncStore.town.toString(),
        districtId: custRegSyncStore.districtId.toString(),
        pinCode: custRegSyncStore.pinCode.toString(),
        residentStatus: custRegSyncStore.residentStatus.toString(),
        noOfKitchen: custRegSyncStore.noOfKitchen.toString(),
        noOfBathroom: custRegSyncStore.noOfBathroom.toString(),
        noOfFamilyMembers: custRegSyncStore.noOfFamilyMembers.toString(),
        existingCookingFuel: custRegSyncStore.existingCookingFuel.toString(),
        latitude: custRegSyncStore.latitude.toString(),
        longitude: custRegSyncStore.longitude.toString(),
        nearestLandmark: custRegSyncStore.nearestLandmark.toString(),
        kycDocument1: custRegSyncStore.kycDocument1.toString(),
        kycDocument1Number: custRegSyncStore.kycDocument1Number.toString(),
        kycDocument2: custRegSyncStore.kycDocument2.toString(),
        kycDocument2Number: custRegSyncStore.kycDocument2Number.toString(),
        kycDocument3: custRegSyncStore.kycDocument3.toString(),
        kycDocument3Number: custRegSyncStore.kycDocument3Number.toString(),
        eBillingModel: custRegSyncStore.eBillingModel.toString(),
        nameOfBank: custRegSyncStore.nameOfBank.toString(),
        bankAccountNumber: custRegSyncStore.bankAccountNumber.toString(),
        bankIfscCode: custRegSyncStore.bankIfscCode.toString(),
        bankAddress: custRegSyncStore.bankAddress.toString(),
        initialDepositStatus: custRegSyncStore.initialDepositStatus.toString(),
        depositType: custRegSyncStore.depositType.toString(),
        initialAmount: custRegSyncStore.initialAmount.toString(),
        modeOfDeposit: custRegSyncStore.modeOfDeposit.toString(),
        chequeNumber: custRegSyncStore.chequeNumber.toString(),
        chequeDepositDate: custRegSyncStore.chequeDepositDate.toString(),
        paymentBankName: custRegSyncStore.paymentBankName.toString(),
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
          Utils.successSnackBar("Great Success! Record Save", context);
          Navigator.pushReplacementNamed(context, RoutesName.viewSyncRecordPage);
          return await HiveDataBase.custRegSyncBox!.add(custRegSyncAdd);
        } else {
          Utils.errorSnackBar('Error !!! \nPlease Upload Previous records', context);
          return null;
        }
      }
    } catch (e) {
      CustomToast.showToast(e.toString());
      return null;
    }
  }

 /* static Future<dynamic> updateCustomerFormInLocalDatabase({
    required BuildContext context,required CustRegSync custRegSyncStore,}) async {
    try {
      CustRegSync custRegSyncAdd = CustRegSync(
        dmaUserName: custRegSyncStore.dmaUserName.toString(),
        dmaUserId: custRegSyncStore.dmaUserId.toString(),
        schema: custRegSyncStore.schema.toString(),
        interested: custRegSyncStore.interested.toString(),
        acceptConversionPolicy: custRegSyncStore.acceptConversionPolicy.toString(),
        acceptExtraFittingCost: custRegSyncStore.acceptExtraFittingCost.toString(),
        societyAllowedMdpe: custRegSyncStore.societyAllowedMdpe.toString(),
        chargeId: custRegSyncStore.chargeId.toString(),
        areaId: custRegSyncStore.areaId.toString(),
        mobileNumber: custRegSyncStore.mobileNumber.toString(),
        firstName: custRegSyncStore.firstName.toString(),
        middleName: custRegSyncStore.middleName.toString(),
        lastName: custRegSyncStore.lastName.toString(),
        guardianType: custRegSyncStore.guardianType.toString(),
        guardianName: custRegSyncStore.guardianName.toString(),
        emailId: custRegSyncStore.emailId.toString(),
        propertyCategoryId: custRegSyncStore.propertyCategoryId.toString(),
        propertyClassId: custRegSyncStore.propertyClassId.toString(),
        buildingNumber: custRegSyncStore.buildingNumber.toString(),
        houseNumber: custRegSyncStore.houseNumber.toString(),
        colonySocietyApartment: custRegSyncStore.colonySocietyApartment.toString(),
        streetName: custRegSyncStore.streetName.toString(),
        town: custRegSyncStore.town.toString(),
        districtId: custRegSyncStore.districtId.toString(),
        pinCode: custRegSyncStore.pinCode.toString(),
        residentStatus: custRegSyncStore.residentStatus.toString(),
        noOfKitchen: custRegSyncStore.noOfKitchen.toString(),
        noOfBathroom: custRegSyncStore.noOfBathroom.toString(),
        noOfFamilyMembers: custRegSyncStore.noOfFamilyMembers.toString(),
        existingCookingFuel: custRegSyncStore.existingCookingFuel.toString(),
        latitude: custRegSyncStore.latitude.toString(),
        longitude: custRegSyncStore.longitude.toString(),
        nearestLandmark: custRegSyncStore.nearestLandmark.toString(),
        kycDocument1: custRegSyncStore.kycDocument1.toString(),
        kycDocument1Number: custRegSyncStore.kycDocument1Number.toString(),
        kycDocument2: custRegSyncStore.kycDocument2.toString(),
        kycDocument2Number: custRegSyncStore.kycDocument2Number.toString(),
        kycDocument3: custRegSyncStore.kycDocument3.toString(),
        kycDocument3Number: custRegSyncStore.kycDocument3Number.toString(),
        eBillingModel: custRegSyncStore.eBillingModel.toString(),
        nameOfBank: custRegSyncStore.nameOfBank.toString(),
        bankAccountNumber: custRegSyncStore.bankAccountNumber.toString(),
        bankIfscCode: custRegSyncStore.bankIfscCode.toString(),
        bankAddress: custRegSyncStore.bankAddress.toString(),
        initialDepositStatus: custRegSyncStore.initialDepositStatus.toString(),
        depositType: custRegSyncStore.depositType.toString(),
        initialAmount: custRegSyncStore.initialAmount.toString(),
        modeOfDeposit: custRegSyncStore.modeOfDeposit.toString(),
        chequeNumber: custRegSyncStore.chequeNumber.toString(),
        chequeDepositDate: custRegSyncStore.chequeDepositDate.toString(),
        paymentBankName: custRegSyncStore.paymentBankName.toString(),
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
      print("HEllo");
      var mmm = await HiveDataBase.custRegSyncBox!.values.toList().length;
      print("mmm-->${mmm}");
      if (HiveDataBase.custRegSyncBox!.values.isNotEmpty) {
        print("mmmLength-->${mmm.toString().length}");
        Utils.successSnackBar("Successfully Update Record", context);
        Navigator.pushReplacementNamed(context, RoutesName.viewSyncRecordPage);
        return await HiveDataBase.custRegSyncBox!.put(mmm, custRegSyncAdd);
      } else {
        Utils.errorSnackBar('Error !!! \nPlease Upload Previous record', context);
        return null;
      }
    } catch (e) {
      CustomToast.showToast(e.toString());
      return null;
    }
  }*/


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
