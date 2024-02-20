import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:flutter/material.dart';

class CustomRegistrationFormHelper {
  static Future<dynamic> textFieldValidationCheck({
    required BuildContext context,
    required String interested,
    required String acceptConversionPolicy,
    required String acceptExtraFittingCost,
    required String societyAllowedMdpe,
    required String chargeId,
    required String areaId,
    required String mobileNumber,
    required String firstName,
    String? middleName,
    required String lastName,
    required String guardianType,
    required String guardianName,
    String? emailId,
    required String propertyCategoryId,
    required String propertyClassId,
    required String buildingNumber,
    required String houseNumber,
    required String colonySocietyApartment,
    required String streetName,
    required String town,
    required String districtId,
    required String pinCode,
    required String residentStatus,
    required String noOfKitchen,
    required String noOfBathroom,
    required String existingCookingFuel,
    required String noOfFamilyMembers,
    String? latitude,
    String? longitude,
    String? nearestLandmark,
    required String kycDocument1,
    required String kycDocument1Number,
    String? kycDocument2,
    String? kycDocument2Number,
    String? kycDocument3,
    String? kycDocument3Number,
    String? eBillingModel,
    String? bankNameOfBank,
    String? bankAccountNumber,
    String? bankIfscCode,
    String? bankAddress,
    required String initialDepositeStatus,
    String? noInitialDepositStatusReason,
    required String depositType,
    required String depositTypeAmount,
    required String modeOfDeposite,
    String? chequeNumber,
    String? chequeDepositDate,
    String? payementBankName,
    String? chequeBankAccount,
    String? chequeMicrNo,
    required String backside1,
    String? backside2,
    String? backside3,
    required String documentUploads1,
    String? documentUploads2,
    String? documentUploads3,
    String? uploadHousePhoto,
    String? uploadCustomerPhoto,
    String? customerConsent,
    required String ownerConsent,
    String? canceledCheque,
    String? chequePhoto,
  }) async {
    try {
      if (interested.isEmpty || interested == "null") {
        CustomToast.showToast("Select interested");
        return null;
      }
      if (acceptConversionPolicy.isEmpty) {
        CustomToast.showToast("Please select Accept Conversion Policy");
        return null;
      }
      if (acceptExtraFittingCost.isEmpty) {
        CustomToast.showToast("Please select Accept Extra Fitting CostValue");
        return null;
      }
      if (societyAllowedMdpe.isEmpty) {
        CustomToast.showToast("Please select society allows MDPE");
        return null;
      }
      if (chargeId.isEmpty || chargeId == 'null') {
        CustomToast.showToast('Please select charge area type');
        return null;
      }
      if (areaId.isEmpty || areaId == 'null') {
        CustomToast.showToast('Please select area type');
        return null;
      }
      if (mobileNumber.isEmpty) {
        CustomToast.showToast("Please enter mobile number");
        return null;
      }
      if (firstName.isEmpty || firstName == "") {
        CustomToast.showToast("Please enter first name");
        return null;
      }
      if (lastName == "") {
        CustomToast.showToast("Please enter last name");
        return null;
      }
      if (guardianType == "") {
        CustomToast.showToast("Please enter guardian type");
        return null;
      }
      if (guardianName.isEmpty || guardianName == "") {
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
      if (buildingNumber.isEmpty || buildingNumber == "") {
        CustomToast.showToast("Please enter the building number");
        return null;
      }
      if (houseNumber.isEmpty || houseNumber == "") {
        CustomToast.showToast("Please enter the house number");
        return null;
      }
      if (colonySocietyApartment.isEmpty || colonySocietyApartment == "") {
        CustomToast.showToast("Please enter the colony/society/apartment");
        return null;
      }
      if (streetName.isEmpty || streetName == "") {
        CustomToast.showToast("Please enter the street name");
        return null;
      }
      if (town.isEmpty || town == "") {
        CustomToast.showToast("Please enter the town");
        return null;
      }
      if (districtId.isEmpty || districtId == "null") {
        CustomToast.showToast("Please select the district");
        return null;
      }
      if (pinCode.isEmpty || pinCode == "") {
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
      if (existingCookingFuel.isEmpty) {
        CustomToast.showToast("Please select the cooking fuel");
        return null;
      }
      if (noOfFamilyMembers.isEmpty) {
        CustomToast.showToast("Please enter no of family members");
        return null;
      }
      if (kycDocument1 == "0") {
        CustomToast.showToast("Please select the address proof no.");
        return null;
      }
      if (kycDocument1Number == "") {
        CustomToast.showToast("Please enter the id proof no.");
        return null;
      }
      if (documentUploads1.isEmpty || documentUploads1 == "") {
        CustomToast.showToast("Please select front image");
        return null;
      }
      if (backside1.isEmpty || backside1 == "") {
        CustomToast.showToast("Please select back image");
        return null;
      }
      if (ownerConsent.isEmpty || ownerConsent == "") {
        CustomToast.showToast("Please select consent photo");
        return null;
      }
      /* if (customerBankName == null) {
        CustomToast.showToast("Please select customer bank account name");
        return false;
      }
      if (customerAccNo == "") {
        CustomToast.showToast("Please enter customer account number");
        return false;
      }
      if (customerIfscCode == "") {
        CustomToast.showToast("Please enter the customer IFSC code");
        return false;
      }
      if (customerBankAdd == "") {
        CustomToast.showToast("Please enter the customer back address");
        return false;
      }*/
      if (depositType.isEmpty || depositType == "null") {
        CustomToast.showToast("Please select deposit Type");
        return null;
      }
      if (modeOfDeposite.isEmpty || modeOfDeposite == "null") {
        CustomToast.showToast("Please select mode of deposit");
        return null;
      } else if (modeOfDeposite == "Cheque") {
        if (chequeNumber!.isEmpty || chequeNumber == "") {
          CustomToast.showToast("Please enter cheque number");
          return null;
        }
        if (chequeDepositDate!.isEmpty || chequeDepositDate == "") {
          CustomToast.showToast("Please enter cheque date");
          return null;
        }
        if (payementBankName!.isEmpty || payementBankName == "") {
          CustomToast.showToast("Please select payment bank name");
          return null;
        }
        if (chequeBankAccount!.isEmpty || chequeBankAccount == "") {
          CustomToast.showToast("Please enter bank account number");
          return null;
        }
        if (chequeMicrNo!.isEmpty || chequeMicrNo == "") {
          CustomToast.showToast("Please enter cheque micr code");
          return null;
        }
        if (chequePhoto!.isEmpty || chequePhoto == "") {
          CustomToast.showToast("Please select cheque image");
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
        interested: interested,
        acceptConversionPolicy: acceptConversionPolicy,
        acceptExtraFittingCost: acceptExtraFittingCost,
        societyAllowedMdpe: societyAllowedMdpe,
        areaId: areaId,
        chargeId: chargeId,
        mobileNumber: mobileNumber,
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
        kycDocument1: kycDocument1,
        kycDocument1Number: kycDocument1Number,
        kycDocument2: kycDocument2,
        kycDocument2Number: kycDocument2Number,
        kycDocument3: kycDocument3,
        kycDocument3Number: kycDocument3Number,
        eBillingModel: eBillingModel,
        bankNameOfBank: bankNameOfBank,
        bankAccountNumber: bankAccountNumber,
        bankIfscCode: bankIfscCode,
        bankAddress: bankAddress,
        initialDepositeStatus: initialDepositeStatus,
        noInitialDepositStatusReason: noInitialDepositStatusReason,
        depositType: depositType,
        depositTypeAmount: depositTypeAmount,
        modeOfDeposite: modeOfDeposite,
        chequeNumber: chequeNumber,
        chequeDepositDate: chequeDepositDate,
        payementBankName: payementBankName,
        chequeBankAccount: chequeBankAccount,
        chequeMicrNo: chequeMicrNo,
        backside1: backside1,
        backside2: backside2,
        backside3: backside3,
        documentUploads1: documentUploads1,
        documentUploads2: documentUploads2,
        documentUploads3: documentUploads3,
        uploadHousePhoto: uploadHousePhoto,
        uploadCustomerPhoto: uploadCustomerPhoto,
        customerConsent: customerConsent,
        ownerConsent: ownerConsent,
        canceledCheque: canceledCheque,
        chequePhoto: chequePhoto,
      );
      return saveCusRegData;
    } catch (e) {
      print(e.toString());
      CustomToast.showToast(e.toString());
      return null;
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
