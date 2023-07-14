
import 'dart:io';
import 'package:hpcl_app/utils/common_widgets/custom_toast.dart';

class CustomerFormHelper{
   static bool textFieldValidationCheck({
      String acceptConversionPolicyValueId,
      String acceptExtraFittingCostValueId,
      String chargeAreaType,
      String areaTypeId,
      String mobileNoController,
      String firstNameController,
      String lastNameController,
      String guardianNameController,
      // String emailIdController,
      String propertyTypeId,
      String propertyClassId,
      String houseNumberController,
      String localityController,
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
      String addressProofNo,
      String idProofNo,
      File idFrontImage,
      File idBackImage,
      File consentImage,
      String customerBankName,
      String customerAccNo,
      String customerIfscCode,
      String customerBankAdd,
      String modeOfDeposit,
      String chequeNo,
      String chequeDate,
      String bankName,
      String bankAccNo,
      String depositAmount,
      String micrCode,
      File chequePhoto,
   }){
      try{
         if (acceptConversionPolicyValueId != "1"){
            CustomToast.showToast("Please select Accept Conversion Policy");
            return false;
         } else if (acceptExtraFittingCostValueId != "1"){
            CustomToast.showToast("Please select Accept Extra Fitting CostValue");
            return false;
         }
         else if(chargeAreaType == "0"){
            CustomToast.showToast('Please select charge area type');
            return false;
         } else if(areaTypeId == "0"){
            CustomToast.showToast('Please select area type');
            return false;
         }else if(mobileNoController == ""){
            CustomToast.showToast("Please enter mobile number");
            return false;
         } else if(firstNameController == ""){
            CustomToast.showToast("Please enter first name");
            return false;
         } else if (lastNameController == ""){
            CustomToast.showToast("Please enter last name");
            return false;
         } else if (guardianNameController == ""){
            CustomToast.showToast("Please enter guardian name");
            return false;
         } else if (propertyTypeId == "0"){
            CustomToast.showToast("Please select Property Category");
            return false;
         } else if (propertyClassId == "0"){
            CustomToast.showToast("Please select property class id");
            return false;
         } else if (houseNumberController == ""){
            CustomToast.showToast("Please enter the house number");
            return false;
         } else if (localityController == ""){
            CustomToast.showToast("Please enter the colony/society/apartment");
            return false;
         } else if (streetNameController == ""){
            CustomToast.showToast("Please enter the street name");
            return false;
         } else if (district == "0"){
            CustomToast.showToast("Please select the district");
            return false;
         } else if (pinCodeController == ""){
            CustomToast.showToast("Please enter the pin code");
            return false;
         } else if (noOfKitchen == ""){
            CustomToast.showToast("Please enter no of kitchen");
            return false;
         } else if (noOfBathroom == ""){
            CustomToast.showToast("Please enter no of bathroom");
            return false;
         } else if (cookInFuelValue == "0"){
            CustomToast.showToast("Please select the cooking fuel");
            return false;
         } else if (noOfFamilyMembers == ""){
            CustomToast.showToast("Please enter no of family members");
            return false;
         }  else if(titleLocation == ""){
            CustomToast.showToast("Please press get location");
            return false;
         }  else if (addressProofNo == "0"){
            CustomToast.showToast("Please select the address proof no.");
            return false;
         } else if (idProofNo == ""){
            CustomToast.showToast("Please enter the id proof no.");
            return false;
         } else if (!(idFrontImage != null && idFrontImage.path != null)){
            CustomToast.showToast("Please select address proof front image");
            return false;
         } else if (!(idBackImage != null && idBackImage.path != null)){
            CustomToast.showToast("Please select address proof back image");
            return false;
         } else if (!(consentImage != null && consentImage.path != null)){
            CustomToast.showToast("Please select consent photo");
            return false;
         } else if(customerBankName == null){
            CustomToast.showToast("Please select customer bank account name");
            return false;
         } else if(customerAccNo == ""){
            CustomToast.showToast("Please enter customer account number");
            return false;
         } else if (customerIfscCode == ""){
            CustomToast.showToast("Please enter the customer IFSC code");
            return false;
         } else if (customerBankAdd == ""){
            CustomToast.showToast("Please enter the customer back address");
            return false;
         } else if (depositAmount == ""){
            CustomToast.showToast("Please select deposit Type");
            return false;
         }   else if (mdpeValue.isEmpty || mdpeValue == null){
            CustomToast.showToast("Please select society allows MDPE");
            return null;
         } else if (residentStatusValue == null){
            CustomToast.showToast("Select resident status");
            return null;
         } else if (modeOfDeposit == "1"){
            if(chequeNo == ""){
               CustomToast.showToast("Please enter the cheque number");
               return false;
            } else if(chequeDate == ""){
               CustomToast.showToast("Please enter the cheque date");
               return false;
            } else if(customerBankName == null){
               CustomToast.showToast("Please select back name");
               return false;
            } else if(bankAccNo == ""){
               CustomToast.showToast("Please enter bank account number");
               return false;
            } else if(micrCode == ""){
               CustomToast.showToast("Please enter the micr code");
               return false;
            } else if (!(chequePhoto != null && chequePhoto.path != null)){
               CustomToast.showToast("Please select cheque image");
               return false;
            }
            //  return false;
         }
         return true;
      } catch(e){
         print(e.toString());
         CustomToast.showToast(e.toString());
         return null;
      }
   }


   static  textValidation({String ares}){
      try{
         if(ares == "0"){
            CustomToast.showToast("defgbf");
            return null;
         }
         return textValidation;
      }catch(e){
         print(e.toString());
         CustomToast.showToast(e.toString());
         return null;
      }

   }
}