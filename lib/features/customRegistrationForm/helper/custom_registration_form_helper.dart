import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:flutter/material.dart';
import 'package:pbg_app/common/HiveDatabase/hive_database.dart';


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

      SaveCusRegData saveCusRegData = SaveCusRegData(
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
        bankNameOfBank: bankNameOfBank,
        bankAccountNumber: bankAccountNumber,
        bankIfscCode: bankIfscCode,
        bankAddress: bankAddress,
        initialDepositeStatus: depositStatus,
        noInitialDepositStatusReason: reasonDeposit,
        depositType: depositType,
        depositTypeAmount: depositAmt,
        modeOfDeposite: modeDeposit,
        chequeNumber: chqNo,
        chequeDepositDate: chqDate,
        payementBankName: chqBank,
        chequeBankAccount: chequeAccountNo,
        chequeMicrNo: chequeMICRNo,
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
      return saveCusRegData;
    } catch (e) {
      print(e.toString());
      CustomToast.showToast(e.toString());
      return true;
    }
  }

  static Future<dynamic> addUpdateCustomerFormInLocalDatabase({
    required BuildContext context, required SaveCusRegData saveCusRegData, required bool isUpdate,}) async {
    try {
      SaveCustomerRegistrationOfflineModel _custRegiDataModel = SaveCustomerRegistrationOfflineModel(
        dmaUserName: saveCusRegData.dmaUserName.toString(),
        dmaUserId: saveCusRegData.dmaUserId.toString(),
        schema: saveCusRegData.schema.toString(),
        interested: saveCusRegData.interested.toString(),
        acceptConversionPolicy: saveCusRegData.acceptConversionPolicy.toString(),
        acceptExtraFittingCost: saveCusRegData.acceptExtraFittingCost.toString(),
        societyAllowedMdpe: saveCusRegData.societyAllowedMdpe.toString(),
        chargeArea: saveCusRegData.chargeId.toString(),
        areaId: saveCusRegData.areaId.toString(),
        mobileNumber: saveCusRegData.mobileNumber.toString(),
        firstName: saveCusRegData.firstName.toString(),
        middleName: saveCusRegData.middleName.toString(),
        lastName: saveCusRegData.lastName.toString(),
        guardianType: saveCusRegData.guardianType.toString(),
        guardianName: saveCusRegData.guardianName.toString(),
        emailId: saveCusRegData.emailId.toString(),
        propertyCategoryId: saveCusRegData.propertyCategoryId.toString(),
        propertyClassId: saveCusRegData.propertyClassId.toString(),
        buildingNumber: saveCusRegData.buildingNumber.toString(),
        houseNumber: saveCusRegData.houseNumber.toString(),
        colonySocietyApartment: saveCusRegData.colonySocietyApartment.toString(),
        streetName: saveCusRegData.streetName.toString(),
        town: saveCusRegData.town.toString(),
        districtId: saveCusRegData.districtId.toString(),
        pinCode: saveCusRegData.pinCode.toString(),
        residentStatus: saveCusRegData.residentStatus.toString(),
        noOfKitchen: saveCusRegData.noOfKitchen.toString(),
        noOfBathroom: saveCusRegData.noOfBathroom.toString(),
        noOfFamilyMembers: saveCusRegData.noOfFamilyMembers.toString(),
        existingCookingFuel: saveCusRegData.existingCookingFuel.toString(),
        latitude: saveCusRegData.latitude.toString(),
        longitude: saveCusRegData.longitude.toString(),
        nearestLandmark: saveCusRegData.nearestLandmark.toString(),
        kycDocument1: saveCusRegData.kycDocument1.toString(),
        kycDocument1Number: saveCusRegData.kycDocument1Number.toString(),
        kycDocument2: saveCusRegData.kycDocument2.toString(),
        kycDocument2Number: saveCusRegData.kycDocument2Number.toString(),
        kycDocument3: saveCusRegData.kycDocument3.toString(),
        kycDocument3Number: saveCusRegData.kycDocument3Number.toString(),
        eBillingModel: saveCusRegData.eBillingModel.toString(),
        bankNameOfBank: saveCusRegData.bankNameOfBank.toString(),
        bankAccountNumber: saveCusRegData.bankAccountNumber.toString(),
        bankIfscCode: saveCusRegData.bankIfscCode.toString(),
        bankAddress: saveCusRegData.bankAddress.toString(),
        initialDepositeStatus: saveCusRegData.initialDepositeStatus.toString(),
        depositeType: saveCusRegData.depositType.toString(),
        depositTypeAmount: saveCusRegData.depositTypeAmount.toString(),
        modeOfDeposite: saveCusRegData.modeOfDeposite.toString(),
        chequeNumber: saveCusRegData.chequeNumber.toString(),
        chequeDepositDate: saveCusRegData.chequeDepositDate.toString(),
        payementBankName: saveCusRegData.payementBankName.toString(),
        chequeBankAccount: saveCusRegData.chequeBankAccount.toString(),
        chequeMicrAccount: saveCusRegData.chequeMicrNo.toString(),
        documentUploadsPhoto1: saveCusRegData.documentUploads1.toString(),
        documentUploadsPhoto2: saveCusRegData.documentUploads2.toString(),
        documentUploadsPhoto3: saveCusRegData.documentUploads3.toString(),
        backSidePhoto1: saveCusRegData.backside1.toString(),
        backSidePhoto2: saveCusRegData.backside2.toString(),
        backSidePhoto3: saveCusRegData.backside3.toString(),
        uploadCustomerPhoto: saveCusRegData.uploadCustomerPhoto.toString(),
        uploadHousePhoto: saveCusRegData.uploadHousePhoto.toString(),
        customerConsentPhoto: saveCusRegData.customerConsent.toString(),
        ownerConsent: saveCusRegData.ownerConsent.toString(),
        canceledChequePhoto: saveCusRegData.canceledCheque.toString(),
        chequePhoto: saveCusRegData.chequePhoto.toString(),
        reasonForHold: saveCusRegData.nearestLandmark.toString(),
        noInitialDepositStatusReason: saveCusRegData.noInitialDepositStatusReason.toString(),
        modeDepositValue: saveCusRegData.modeOfDeposite,
        ownerConsentText: "",
        isDepositCheq: false,
      );
      var mmm = await HiveDataBase.customerRegBox!.values.toList().length;
      if(isUpdate == true){
        await HiveDataBase.customerRegBox!.put(mmm , _custRegiDataModel);
      } else{
        print("mmm-->${mmm}");
        if (mmm <= 15) {
          print("mmmLength-->${mmm.toString().length}");
          Utils.successSnackBar("Great Success! Record Save", context);
          Navigator.pushReplacementNamed(context, RoutesName.viewSyncRecordPage);
          return await HiveDataBase.customerRegBox!.add(_custRegiDataModel);
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

  static Future<dynamic> updateCustomerFormInLocalDatabase({required BuildContext context, required SaveCusRegData saveCusRegData}) async {
    try {
      SaveCustomerRegistrationOfflineModel _custRegiDataModel = SaveCustomerRegistrationOfflineModel(
        dmaUserName: saveCusRegData.dmaUserName.toString(),
        dmaUserId: saveCusRegData.dmaUserId.toString(),
        schema: saveCusRegData.schema.toString(),
        interested: saveCusRegData.interested.toString(),
        acceptConversionPolicy: saveCusRegData.acceptConversionPolicy.toString(),
        acceptExtraFittingCost: saveCusRegData.acceptExtraFittingCost.toString(),
        societyAllowedMdpe: saveCusRegData.societyAllowedMdpe.toString(),
        chargeArea: saveCusRegData.chargeId.toString(),
        areaId: saveCusRegData.areaId.toString(),
        mobileNumber: saveCusRegData.mobileNumber.toString(),
        firstName: saveCusRegData.firstName.toString(),
        middleName: saveCusRegData.middleName.toString(),
        lastName: saveCusRegData.lastName.toString(),
        guardianType: saveCusRegData.guardianType.toString(),
        guardianName: saveCusRegData.guardianName.toString(),
        emailId: saveCusRegData.emailId.toString(),
        propertyCategoryId: saveCusRegData.propertyCategoryId.toString(),
        propertyClassId: saveCusRegData.propertyClassId.toString(),
        buildingNumber: saveCusRegData.buildingNumber.toString(),
        houseNumber: saveCusRegData.houseNumber.toString(),
        colonySocietyApartment: saveCusRegData.colonySocietyApartment.toString(),
        streetName: saveCusRegData.streetName.toString(),
        town: saveCusRegData.town.toString(),
        districtId: saveCusRegData.districtId.toString(),
        pinCode: saveCusRegData.pinCode.toString(),
        residentStatus: saveCusRegData.residentStatus.toString(),
        noOfKitchen: saveCusRegData.noOfKitchen.toString(),
        noOfBathroom: saveCusRegData.noOfBathroom.toString(),
        noOfFamilyMembers: saveCusRegData.noOfFamilyMembers.toString(),
        existingCookingFuel: saveCusRegData.existingCookingFuel.toString(),
        latitude: saveCusRegData.latitude.toString(),
        longitude: saveCusRegData.longitude.toString(),
        nearestLandmark: saveCusRegData.nearestLandmark.toString(),
        kycDocument1: saveCusRegData.kycDocument1.toString(),
        kycDocument1Number: saveCusRegData.kycDocument1Number.toString(),
        kycDocument2: saveCusRegData.kycDocument2.toString(),
        kycDocument2Number: saveCusRegData.kycDocument2Number.toString(),
        kycDocument3: saveCusRegData.kycDocument3.toString(),
        kycDocument3Number: saveCusRegData.kycDocument3Number.toString(),
        eBillingModel: saveCusRegData.eBillingModel.toString(),
        bankNameOfBank: saveCusRegData.bankNameOfBank.toString(),
        bankAccountNumber: saveCusRegData.bankAccountNumber.toString(),
        bankIfscCode: saveCusRegData.bankIfscCode.toString(),
        bankAddress: saveCusRegData.bankAddress.toString(),
        initialDepositeStatus: saveCusRegData.initialDepositeStatus.toString(),
        depositeType: saveCusRegData.depositType.toString(),
        depositTypeAmount: saveCusRegData.depositTypeAmount.toString(),
        modeOfDeposite: saveCusRegData.modeOfDeposite.toString(),
        chequeNumber: saveCusRegData.chequeNumber.toString(),
        chequeDepositDate: saveCusRegData.chequeDepositDate.toString(),
        payementBankName: saveCusRegData.payementBankName.toString(),
        chequeBankAccount: saveCusRegData.chequeBankAccount.toString(),
        chequeMicrAccount: saveCusRegData.chequeMicrNo.toString(),
        documentUploadsPhoto1: saveCusRegData.documentUploads1.toString(),
        documentUploadsPhoto2: saveCusRegData.documentUploads2.toString(),
        documentUploadsPhoto3: saveCusRegData.documentUploads3.toString(),
        backSidePhoto1: saveCusRegData.backside1.toString(),
        backSidePhoto2: saveCusRegData.backside2.toString(),
        backSidePhoto3: saveCusRegData.backside3.toString(),
        uploadCustomerPhoto: saveCusRegData.uploadCustomerPhoto.toString(),
        uploadHousePhoto: saveCusRegData.uploadHousePhoto.toString(),
        customerConsentPhoto: saveCusRegData.customerConsent.toString(),
        ownerConsent: saveCusRegData.ownerConsent.toString(),
        canceledChequePhoto: saveCusRegData.canceledCheque.toString(),
        chequePhoto: saveCusRegData.chequePhoto.toString(),
        reasonForHold: saveCusRegData.nearestLandmark.toString(),
        noInitialDepositStatusReason: saveCusRegData.noInitialDepositStatusReason.toString(),
        modeDepositValue: saveCusRegData.modeOfDeposite,
        ownerConsentText: "",
        isDepositCheq: false,
      );
      print("HEllo");
      var mmm = await HiveDataBase.customerRegBox!.values.toList().length;
      print("mmm-->${mmm}");
      if (HiveDataBase.customerRegBox!.values.isNotEmpty) {
        print("mmmLength-->${mmm.toString().length}");
        Utils.successSnackBar("Successfully Update Record", context);
        Navigator.pushReplacementNamed(context, RoutesName.viewSyncRecordPage);
        return await HiveDataBase.customerRegBox!.put(mmm, _custRegiDataModel);
      } else {
        Utils.errorSnackBar('Error !!! \nPlease Upload Previous record', context);
        return null;
      }
    } catch (e) {
      CustomToast.showToast(e.toString());
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
