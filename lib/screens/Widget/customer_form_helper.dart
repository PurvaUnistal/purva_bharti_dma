import 'dart:io';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/utils/common_widgets/custom_toast.dart';

class CustomerFormHelper {
  static bool textFieldValidationCheck({
    String isInterestedId,
    String reasonNotInterested,
    String acceptConversionPolicyValueId,
    String acceptExtraFittingCostValueId,
    String chargeAreaType,
    String areaTypeId,
    String mobileNoController,
    String firstNameController,
    String lastNameController,
    String guardianNameController,
     String emailIdController,
    String propertyTypeId,
    String propertyClassId,
    String buildingNumberController,
    String houseNumberController,
    String colonySocietyApartmentController,
    String streetNameController,
    String townController,
    String district,
    String pinCodeController,
    String mdpeValue,
    String residentStatusValue,
    String noOfKitchen,
    String noOfBathroom,
    String cookInFuelValue,
    String titleLocation,
    String noOfFamilyMembers,
    String selectIdentification,
    String identificationProofNo,
    String idFrontImage,
    String idBackImage,
    String selectAddressProof,
    String addressProofNumber,
    String addressProofFront,
    String addressProofBack,
    String selectOwnershipType,
    String nocImage,
    String consentImage,
    String customerConsentImage,
    String customerBankName,
    String customerAccNo,
    String customerIfscCode,
    String customerBankAdd,
    String modeOfDeposit,
    String chequeNo,
    String chequeDate,
    String payementBankName,
    String bankAccNo,
    String depositType,
    String micrCode,
    String chequePhoto,
  }) {
    try {
      if (acceptConversionPolicyValueId.isEmpty) {
        CustomToast.showToast("Please select Accept Conversion Policy");
        return false;
      }
      if (acceptExtraFittingCostValueId.isEmpty) {
        CustomToast.showToast("Please select Accept Extra Fitting CostValue");
        return false;
      }
      if (isInterestedId == "") {
        CustomToast.showToast("Please select Interested Id");
        return false;
      }
      if (chargeAreaType == "0" ||
          chargeAreaType == null ||
          chargeAreaType.isEmpty) {
        CustomToast.showToast('Please select charge area type');
        return false;
      }
      if (areaTypeId == "0") {
        CustomToast.showToast('Please select area type');
        return false;
      }
      if (mobileNoController == "") {
        CustomToast.showToast("Please enter mobile number");
        return false;
      }
      if (firstNameController == "") {
        CustomToast.showToast("Please enter first name");
        return false;
      }
      if (lastNameController == "") {
        CustomToast.showToast("Please enter last name");
        return false;
      }
      if (isInterestedId == "1") {
        if (guardianNameController == "") {
          CustomToast.showToast("Please enter guardian name");
          return false;
        }
      }
       if (propertyTypeId == "0") {
        CustomToast.showToast("Please select Property Category");
        return false;
      }
      if (propertyClassId == "0") {
        CustomToast.showToast("Please select property class id");
        return false;
      }
   /*   if (buildingNumberController == "") {
        CustomToast.showToast("Please enter the building number");
        return false;
      }*/
      if (houseNumberController == "") {
        CustomToast.showToast("Please enter the house number");
        return false;
      }
      if (colonySocietyApartmentController == "") {
        CustomToast.showToast("Please enter the colony/society/apartment");
        return false;
      }
      if (streetNameController == "") {
        CustomToast.showToast("Please enter the street name");
        return false;
      }
      if (district == "0") {
        CustomToast.showToast("Please select the district");
        return false;
      }
      if (pinCodeController == "") {
        CustomToast.showToast("Please enter the pin code");
        return false;
      }
      if (noOfKitchen == "") {
        CustomToast.showToast("Please enter no of kitchen");
        return false;
      }
      if (noOfBathroom == "") {
        CustomToast.showToast("Please enter no of bathroom");
        return false;
      }
      if (cookInFuelValue == "0") {
        CustomToast.showToast("Please select the cooking fuel");
        return false;
      }
      if (noOfFamilyMembers == "") {
        CustomToast.showToast("Please enter no of family members");
        return false;
      }
      if (titleLocation == "") {
        CustomToast.showToast("Please press get location");
        return false;
      }
      if (selectIdentification.isEmpty) {
        CustomToast.showToast("Select the Identification Proof ");
        return false;
      }
      if (identificationProofNo == "") {
        CustomToast.showToast("Enter the Identification Proof No.");
        return false;
      }
      if (idFrontImage == null ||
          idFrontImage.isEmpty ||
          idFrontImage == "") {
        CustomToast.showToast("Upload Identification Front Image");
        return false;
      }
      /*if (idBackImage == null || idBackImage.isEmpty || idBackImage == "") {
          CustomToast.showToast("Please select back image");
          return false;
        }*/
      if(isInterestedId == "1"){
        if (selectAddressProof.isEmpty) {
          CustomToast.showToast("Select the Address Proof ");
          return false;
        }
        if (addressProofNumber == "") {
          CustomToast.showToast("Enter the Address Proof No.");
          return false;
        }
        if (addressProofFront == null ||
            addressProofFront.isEmpty ||
            addressProofFront == "") {
          CustomToast.showToast("Upload Address Proof Front Image");
          return false;
        }
        if (selectOwnershipType == "") {
          CustomToast.showToast("Select the Ownership Type");
          return false;
        }
        if (customerConsentImage == null ||
            customerConsentImage.isEmpty ||
            customerConsentImage == "") {
          CustomToast.showToast("Upload Customer Consent Image");
          return false;
        }
        if(selectOwnershipType == "2"){
          if (nocImage == null ||
              nocImage.isEmpty ||
              nocImage == "") {
            CustomToast.showToast("Upload NOC Image");
            return false;
          }
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
        if (depositType == "") {
          CustomToast.showToast("Please select deposit Type");
          return null;
        }
        if (mdpeValue.isEmpty || mdpeValue == null) {
          CustomToast.showToast("Please select society allows MDPE");
          return null;
        }
        if (residentStatusValue == null) {
          CustomToast.showToast("Select resident status");
          return null;
        }
        if (modeOfDeposit == "" ||
            modeOfDeposit == null ||
            modeOfDeposit.isEmpty) {
          CustomToast.showToast("Please select mode of deposite");
          return false;
        } else if (modeOfDeposit == "1") {
          if (chequeNo == "") {
            CustomToast.showToast("Please enter cheque number");
            return false;
          }
          if (chequeDate == "") {
            CustomToast.showToast("Please enter cheque date");
            return false;
          }
          if (payementBankName == null || payementBankName == "") {
            CustomToast.showToast("Please select payement bank name");
            return false;
          }
          if (bankAccNo == "") {
            CustomToast.showToast("Please enter bank account number");
            return false;
          }
          if (micrCode == "") {
            CustomToast.showToast("Please enter cheque micr code");
            return false;
          }
          if (chequePhoto == null || chequePhoto.isEmpty || chequePhoto == "") {
            CustomToast.showToast("Please select cheque image");
            return false;
          }
        }
      }

      return true;
    } catch (e) {
      log(e.toString());
      CustomToast.showToast(e.toString());
      return null;
    }
  }

  static textValidation({String ares}) {
    try {
      if (ares == "0") {
        CustomToast.showToast("defgbf");
        return null;
      }
      return textValidation;
    } catch (e) {
      log(e.toString());
      CustomToast.showToast(e.toString());
      return null;
    }
  }
}
