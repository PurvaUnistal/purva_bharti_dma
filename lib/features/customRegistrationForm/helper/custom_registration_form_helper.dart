import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:flutter/material.dart';
import 'package:pbg_app/features/customRegistrationForm/domain/model/save_customer_registration_model.dart';

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
   // required String residentStatus,
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
      if (registrationType.isEmpty && registrationType == "null") {
        CustomToast.showToast("Select Registration Type");
        return null;
      }
      if (chargeId.isEmpty && chargeId == 'null') {
        CustomToast.showToast('Please select charge area type');
        return null;
      }
      if (areaId.isEmpty && areaId == 'null') {
        CustomToast.showToast('Please select area type');
        return null;
      }
      if (mobileNumber.isEmpty) {
        CustomToast.showToast("Please enter mobile number");
        return null;
      }
      if (firstName.isEmpty && firstName == "") {
        CustomToast.showToast("Please enter first name");
        return null;
      }
      if (lastName.isEmpty && lastName == "") {
        CustomToast.showToast("Please enter last name");
        return null;
      }
      if (guardianType.isEmpty && guardianType == "null") {
        CustomToast.showToast("Please enter guardian type");
        return null;
      }
      if (guardianName.isEmpty) {
        CustomToast.showToast("Please enter guardian name");
        return null;
      }
      if (propertyCategoryId.isEmpty || propertyCategoryId == "null") {
        CustomToast.showToast("Please select Property Category");
        return null;
      }
      if (propertyClassId.isEmpty || propertyClassId == "null") {
        CustomToast.showToast("Please select property class id");
        return null;
      }
      if (buildingNumber.isEmpty) {
        CustomToast.showToast("Please enter the building number");
        return null;
      }
      if (houseNumber.isEmpty) {
        CustomToast.showToast("Please enter the house number");
        return null;
      }
      if (colonySocietyApartment.isEmpty) {
        CustomToast.showToast("Please enter the colony/society/apartment");
        return null;
      }
      if (streetName.isEmpty) {
        CustomToast.showToast("Please enter the street name");
        return null;
      }
      if (town.isEmpty) {
        CustomToast.showToast("Please enter the town");
        return null;
      }
      if (districtId.isEmpty || districtId == "null") {
        CustomToast.showToast("Please select the district");
        return null;
      }
      if (pinCode.isEmpty) {
        CustomToast.showToast("Please enter the pin code");
        return null;
      }
      if (noOfKitchen.isEmpty) {
        CustomToast.showToast("Please enter no of kitchen");
        return null;
      }
      if (noOfBathroom.isEmpty) {
        CustomToast.showToast("Please enter no of bathroom");
        return null;
      }
      if (existingCookingFuel.isEmpty && existingCookingFuel == "null") {
        CustomToast.showToast("Please select the cooking fuel");
        return null;
      }
      if (noOfFamilyMembers.isEmpty) {
        CustomToast.showToast("Please enter no of family members");
        return null;
      }
      if (idProof.isEmpty && idProof == "null") {
        CustomToast.showToast("Please select the address proof no.");
        return null;
      }
      if (idProofNo.isEmpty) {
        CustomToast.showToast("Please enter the id proof no.");
        return null;
      }
      if (idFrontPath.isEmpty) {
        CustomToast.showToast("Please select front image");
        return null;
      }
      if (addProof.isEmpty || addProof == "null") {
        CustomToast.showToast("Please select KYC (Address Proof)");
        return null;
      }
      if (addProofNo.isEmpty) {
        CustomToast.showToast("Please select KYC (Address Proof) Number");
        return null;
      }
      if (addFrontPath.isEmpty) {
        CustomToast.showToast("Please select Address Proof Front");
        return null;
      }
      if (ownershipProperty.isEmpty && ownershipProperty == "null") {
        CustomToast.showToast("Please select Ownership type property");
        return null;
      }
      if (ownershipProperty== "Rented") {
        if(nocDocPath.isEmpty){
          CustomToast.showToast("Please select NOC Document");
          return null;
        }
        return true;
      }
      if (acceptConversionPolicy.isEmpty && acceptConversionPolicy == "null") {
        CustomToast.showToast("Please select Accept Conversion Policy");
        return null;
      }
      if (acceptExtraFittingCost.isEmpty && acceptExtraFittingCost == "null") {
        CustomToast.showToast("Please select Accept Extra Fitting CostValue");
        return null;
      }
      if (societyAllowedMdpe.isEmpty && societyAllowedMdpe == "null") {
        CustomToast.showToast("Please select society allows MDPE");
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
        CustomToast.showToast("Please select Scheme Type");
        return null;
      }
      if (modeDeposit == "Cheque") {
        if (chqNo.isEmpty) {
          CustomToast.showToast("Please enter Cheque Number");
          return null;
        }
        if (chqDate.isEmpty) {
          CustomToast.showToast("Please enter cheque date");
          return null;
        }
        if (chqBank.isEmpty || chqBank == "null") {
          CustomToast.showToast("Please select payment bank name");
          return null;
        }
        if (chequeAccountNo.isEmpty) {
          CustomToast.showToast("Please enter bank account number");
          return null;
        }
        if (chequeMICRNo.isEmpty) {
          CustomToast.showToast("Please enter cheque micr code");
          return null;
        }
        if (chequePath.isEmpty) {
          CustomToast.showToast("Please select Cheque Image");
          return null;
        }
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? schema = prefs.getString(GlobalConstants.schema);
      String? dmaUserId = prefs.getString(GlobalConstants.id);
      String? dmaUserName = prefs.getString(GlobalConstants.name);

      SaveCusRegData saveCusRegData = SaveCusRegData(
        schema: schema,
        dmaUserId: dmaUserId,
        dmaUserName: dmaUserName,
        interested: reasonRegistration,
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
        residentStatus: registrationType,
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
        backside3: "",
        documentUploads1: "",
        documentUploads2: "",
        documentUploads3: "",
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

  static Future<dynamic> AddCustomerFormInLocalDatabase({required BuildContext context, required SaveCusRegData saveCusRegData}) async {
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
      var mmm = await HiveDataBase.leadBoxCustomerRegistration!.values.toList().length;
      if (mmm <= 10) {
        print("mmm-->${mmm.toString().length}");
        return await HiveDataBase.leadBoxCustomerRegistration!.add(_custRegiDataModel);
        //  return await leadSaveInServer(context: context);
      } else {
        CustomToast.showToast('Error !!!! \n Please Uploade Previous record');
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
