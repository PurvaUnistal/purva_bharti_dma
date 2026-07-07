import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:flutter/material.dart';
import 'package:pbg_app/Utils/common_widgets/res/app_config.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_connection_type_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_name_title_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_property_type_model.dart';

class RegistrationFormHelper {
  static bool _blank(String? v) => v == null || v.trim().isEmpty;

  static bool _fail(BuildContext context, String field) {
    Utils.errorSnackBar(msg: "The $field field is required.", context: context);
    return true;
  }

  /// Validates the form and, if valid, returns a [SaveRegistrationFormModel].
  /// Returns null (and shows a snackbar) on the first validation failure.
  ///
  /// Mandatory-field rules (per BRD change request):
  ///   MANDATORY     : Registration type, Grid (charge area), Area, Mobile,
  ///                   First Name, Ward Number, House Number, District,
  ///                   Pin Code, Location, KYC1 + number + front image,
  ///                   Meter Type, Deposit Status, Scheme Type
  ///   NON-MANDATORY : Title, Last Name, DOB, Guardian Name, Floor Number,
  ///                   Building Number, Colony/Society/Apartment,
  ///                   Lane/Street Name, Town
  ///
  /// Client rules:
  ///  - AGCL   : registration type from [regFrom]; Mode of Deposit + cheque
  ///             section NOT validated (dropdown hidden). Ownership proof
  ///             comes from [addressProof].
  ///  - others : registration type from [registrationType]; Mode of Deposit
  ///             validated, cheque fields when mode == Cheque.
  static Future<SaveRegistrationFormModel?> textFieldValidationCheck({
    required BuildContext context,
    required bool isAGCL,
    required String reasonRegistration,
    required String applicationNumber,
    required String mobile,
    required String altMobile,
    required String first,
    required String middle,
    required String last,
    required String dob,
    required String guardianName,
    required String emailId,
    required String buildingNumber,
    required String floorNumber,
    required String houseNumber,
    required String colony,
    required String street,
    required String town,
    required String wardNumber,
    required String premiseType,
    required String pinCode,
    required String numberKitchen,
    required String numberBathroom,
    required String familyMember,
    required String nearestLandmark,
    required String kyc1Number,
    required String kyc2Number,
    required String kyc3Number,
    required String custBankAccNumber,
    required String custIfscCode,
    required String custBankAdd,
    required String reasonDepositSts,
    required String schemeAmount,
    required String chequeNo,
    required String chequeDate,
    required String chequeAccountNo,
    required String chequeMicrNo,
    required String lat,
    required String long,
    required String custBankName,
    required String paymentBankName,
    required GetChargeAreaListModel chargeArea,
    required GetAllAreaModel area,
    required GetPropertyCategoryModel propertyCategory,
    required GetPropertyClassModel propertyClass,
    required GetNameTitleModel nameTitle,
    required ConnectionTypeModel regFrom,
    required ConnectionTypeModel meterType,
    required GetAllDistrictModel allDistrict,
    required GetAllDepositOfflineModel schemeType,
    required GetNotInterestedModel registrationType,
    required GetAcceptConversionPolicyModel conversionPolicy,
    required GetAcceptExtraFittingCostModel extraFitting,
    required GetSocietyAllowModel societyAllow,
    required GetGuardianTypeModel guardianType,
    required GetResidentStatusModel residentStatus,
    required PropertyTypeModel houseHoldType,
    required GetExistingCookingFuelModel existingCookingFuel,
    required GetIdentityProofModel kycDoc1,
    required GetOwnershipProofModel kycDoc2,
    required GetOwnershipProofModel addressProof,
    required GetKycDocModel kycDoc3,
    required GetEBillingModel preferredBill,
    required GetInitialDepositStatusModel initialDepositStatus,
    required GetModeOfDepositModel modeDeposit,
    required BankNameListModel bankName,
    required File customerConsent,
    required File canceledCheque,
    required File idFrontPath,
    required File idBackPath,
    required File addFrontPath,
    required File addBackPath,
    required File nocDocPath,
    required File nocFrontPath,
    required File nocBackPath,
    required File uploadCustomerPath,
    required File uploadHousePath,
    required File ownerConsentPath,
    required File customerConsentPath,
    required File cancelChequePath,
    required File chequePath,
  }) async {
    try {
      // ---------- resolve registration type per client ----------
      final String regTypeKey = isAGCL
          ? (regFrom.key?.toString() ?? "")
          : (registrationType.key?.toString() ?? "");
      final String regTypeValue = isAGCL
          ? (regFrom.name?.toString() ?? "")
          : (registrationType.value?.toString() ?? "");

      final bool requiresFullDetails = regTypeValue != "Future Registration";

      // ---------- basic details ----------
      if (_blank(regTypeKey)) {
        if (_fail(context, isAGCL ? "Registration From" : "Registration")) {
          return null;
        }
      }
      // Charge Area is labelled "Grid" per BRD.
      if (_blank(chargeArea.gid?.toString())) {
        if (_fail(context, "Grid")) return null;
      }
      if (_blank(area.gid?.toString())) {
        if (_fail(context, "Area")) return null;
      }
      if (_blank(mobile)) {
        if (_fail(context, "Mobile Number")) return null;
      }
      if (mobile.trim().length != 10) {
        Utils.errorSnackBar(
            msg: "Please enter a valid 10 digit Mobile Number.",
            context: context);
        return null;
      }
      // Title -> NON-MANDATORY (check removed)
      // DOB   -> NON-MANDATORY (check removed)
      if (_blank(first)) {
        if (_fail(context, "First Name")) return null;
      }
      // Last Name -> NON-MANDATORY (check removed)

      // ---------- guardian / property (skipped for Future Registration) ----------
      if (requiresFullDetails) {
        if (_blank(guardianType.key?.toString())) {
          if (_fail(context, "Guardian Type")) return null;
        }
        // Guardian Name -> NON-MANDATORY (check removed)
      }
      // Property dropdowns show for AGCL always, others only for LMC.
      final bool showsPropertyDropdowns =
          isAGCL || regTypeValue == "Registration For LMC";
      if (showsPropertyDropdowns) {
        if (_blank(propertyCategory.id?.toString())) {
          if (_fail(context, "Property Category")) return null;
        }
        if (_blank(propertyClass.id?.toString())) {
          if (_fail(context, "Property Class")) return null;
        }
      }

      // ---------- address ----------
      // Floor Number    -> NON-MANDATORY
      // Building Number -> NON-MANDATORY
      if (_blank(houseNumber)) {
        if (_fail(context, "House Number")) return null;
      }
      // Colony/Society/Apartment -> NON-MANDATORY (check removed)
      // Lane/Street Name         -> NON-MANDATORY (check removed)
      // Town                     -> NON-MANDATORY
      if (_blank(allDistrict.id?.toString())) {
        if (_fail(context, "District")) return null;
      }
      // Ward Number -> MANDATORY (new)
      if (_blank(wardNumber)) {
        if (_fail(context, "Ward Number")) return null;
      }
      if (_blank(pinCode)) {
        if (_fail(context, "Pin Code")) return null;
      }
      if (pinCode.trim().length != 6) {
        Utils.errorSnackBar(
            msg: "Please enter a valid 6 digit Pin Code.", context: context);
        return null;
      }
      if (_blank(lat) || _blank(long)) {
        Utils.errorSnackBar(
            msg:
            "Location access denied. Please enable location services and grant location permissions in app settings to proceed.",
            context: context);
        return null;
      }

      // ---------- household (hidden for Future Registration) ----------
      if (requiresFullDetails) {
        if (_blank(numberKitchen)) {
          if (_fail(context, "No. of Kitchen")) return null;
        }
        if (_blank(numberBathroom)) {
          if (_fail(context, "No. of Bathroom")) return null;
        }
        if (_blank(existingCookingFuel.key?.toString())) {
          if (_fail(context, "Cooking Fuel")) return null;
        }
        if (_blank(familyMember)) {
          if (_fail(context, "No. of Family Members")) return null;
        }
      }

      // ---------- KYC: identity proof (always required) ----------
      if (_blank(kycDoc1.key?.toString())) {
        if (_fail(context, "KYC (Identification Proof)")) return null;
      }
      if (_blank(kyc1Number)) {
        if (_fail(context, "KYC (Identification Proof) Number")) return null;
      }
      if (idFrontPath.path.isEmpty) {
        if (_fail(context, "Id Proof Front Image")) return null;
      }

      // ---------- full-detail KYC / policy / deposit ----------
      if (requiresFullDetails) {
        // Address Proof - Required only for non-AGCL clients
        if (!isAGCL) {
          if (_blank(kycDoc2.key?.toString())) {
            if (_fail(context, "KYC (Address Proof)")) return null;
          }

          if (_blank(kyc2Number)) {
            if (_fail(context, "KYC (Address Proof) Number")) return null;
          }

          if (addFrontPath.path.isEmpty) {
            if (_fail(context, "Address Proof Front Image")) return null;
          }
        }

        // Ownership proof: AGCL uses addressProof dropdown, others kycDoc3.
        if (isAGCL) {
          if (_blank(addressProof.key?.toString())) {
            if (_fail(context, "Ownership Proof")) return null;
          }
        } else {
          if (_blank(kycDoc3.key?.toString())) {
            if (_fail(context, "Ownership Type Property")) return null;
          }
        }

        // NOC document only when property is Rented.
        final String ownership = kycDoc3.value?.toString() ?? "";
        if (ownership == "Rented" && nocDocPath.path.isEmpty) {
          if (_fail(context, "NOC Document")) return null;
        }

        // policies
        if (_blank(conversionPolicy.key?.toString())) {
          if (_fail(context, "Accept Conversion Policy")) return null;
        }
        if (_blank(extraFitting.key?.toString())) {
          if (_fail(context, "Accept Extra Fitting Cost")) return null;
        }
        if (_blank(societyAllow.key?.toString())) {
          if (_fail(context, "Society Allows MDPE")) return null;
        }

        // deposit section
        // Meter Type -> MANDATORY (was previously allowing empty submit)
        if (_blank(meterType.key?.toString())) {
          if (_fail(context, "Meter Type")) return null;
        }
        if (_blank(initialDepositStatus.key?.toString())) {
          if (_fail(context, "Deposit Status")) return null;
        }
        // Scheme Type -> MANDATORY (was previously allowing empty submit)
        if (_blank(schemeType.depositTypesId?.toString())) {
          if (_fail(context, "Scheme Type")) return null;
        }

        // Mode of Deposit hidden for AGCL -> validate only for others.
        if (!isAGCL) {
          final String depositModeKey = modeDeposit.key?.toString() ?? "";
          final String depositModeValue = modeDeposit.value?.toString() ?? "";
          if (_blank(depositModeKey)) {
            if (_fail(context, "Mode Of Deposit")) return null;
          }
          if (depositModeValue == "Cheque") {
            if (_blank(chequeNo)) {
              if (_fail(context, "Cheque Number")) return null;
            }
            if (_blank(chequeDate)) {
              if (_fail(context, "Cheque Date")) return null;
            }
            if (_blank(paymentBankName)) {
              if (_fail(context, "Cheque Bank Name")) return null;
            }
            if (_blank(chequeAccountNo)) {
              if (_fail(context, "Cheque Bank Account Number")) return null;
            }
            if (_blank(chequeMicrNo)) {
              if (_fail(context, "Cheque MICR Code")) return null;
            }
            if (chequePath.path.isEmpty) {
              if (_fail(context, "Cheque Image")) return null;
            }
          }
        }
      }

      // ---------- all good: build the model ----------
      final String? schema = AppConfig.instanceInit()?.loginData.user?.schema;
      final String? dmaUserId = AppConfig.instanceInit()?.loginData.user?.id;
      final String? dmaUserName =
          AppConfig.instanceInit()?.loginData.user?.name;

      return SaveRegistrationFormModel(
        schema: schema,
        dmaUserId: dmaUserId,
        dmaUserName: dmaUserName,
        registrationType: regTypeKey,
        regFromVal: regFrom.key?.toString() ?? "",
        acceptConversionPolicy: conversionPolicy.key?.toString() ?? "",
        acceptExtraFittingCost: extraFitting.key?.toString() ?? "",
        societyAllowedMdpe: societyAllow.key?.toString() ?? "",
        areaId: area.gid?.toString() ?? "",
        chargeArea: chargeArea.gid?.toString() ?? "",
        mobileNumber: mobile,
        alternateMobile: altMobile,
        firstName: first,
        middleName: middle,
        lastName: last,
        guardianType: guardianType.key?.toString() ?? "",
        guardianName: guardianName,
        emailId: emailId,
        propertyCategoryId: propertyCategory.id?.toString() ?? "",
        propertyClassId: propertyClass.id?.toString() ?? "",
        buildingNumber: buildingNumber,
        floorNumber: floorNumber,
        houseNumber: houseNumber,
        colonySocietyApartment: colony,
        streetName: street,
        town: town,
        districtId: allDistrict.id?.toString() ?? "",
        pinCode: pinCode,
        residentStatus: residentStatus.key?.toString() ?? "",
        noOfKitchen: numberKitchen,
        noOfBathroom: numberBathroom,
        existingCookingFuel: existingCookingFuel.key?.toString() ?? "",
        noOfFamilyMembers: familyMember,
        latitude: lat,
        longitude: long,
        nearestLandmark: nearestLandmark,
        kycDocument1: kycDoc1.key?.toString() ?? "",
        kycDocument1Number: kyc1Number,
        kycDocument2: kycDoc2.key?.toString() ?? "",
        kycDocument2Number: kyc2Number,
        kycDocument3: isAGCL
            ? (addressProof.key?.toString() ?? "")
            : (kycDoc3.key?.toString() ?? ""),
        kycDocument3Number: kyc3Number,
        eBillingModel: preferredBill.key?.toString() ?? "",
        bankNameOfBank: custBankName,
        bankAccountNumber: custBankAccNumber,
        bankIfscCode: custIfscCode,
        bankAddress: custBankAdd,
        initialDepositeStatus: initialDepositStatus.key?.toString() ?? "",
        noInitialDepositStatusReason: reasonDepositSts,
        schemeType: schemeType.depositTypesId?.toString() ?? "",
        schemeTypeAmount: schemeAmount,
        modeOfDeposite: modeDeposit.key?.toString() ?? "",
        chequeNumber: chequeNo,
        chequeDepositDate: chequeDate,
        payementBankName: paymentBankName,
        chequeBankAccount: chequeAccountNo,
        chequeMicrAccount: chequeMicrNo,
        idFrontPath1: idFrontPath.path,
        idBackPath1: idBackPath.path,
        addFrontPath2: addFrontPath.path,
        addBackPath2: addBackPath.path,
        nocFrontPath3: nocFrontPath.path,
        nocBackPath3: nocBackPath.path,
        uploadHousePhoto: uploadHousePath.path,
        uploadCustomerPhoto: uploadCustomerPath.path,
        customerConsent: customerConsent.path,
        ownerConsent: ownerConsentPath.path,
        canceledChequePhoto: canceledCheque.path,
        chequePhoto: chequePath.path,
        reasonRegistration: reasonRegistration,
        applicationNumber: applicationNumber,
        nameTitle: nameTitle.id?.toString() ?? "",
        dob: dob,
        wardNumber: wardNumber,
        premiseType: premiseType,
        reasonDeposit: reasonDepositSts,
        houseHoldType: houseHoldType.id?.toString() ?? "",
        meterType: meterType.key?.toString() ?? "",
        nocDocPath: nocDocPath.path,
      );
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
        Utils.errorSnackBar(
            msg: "Local database not available", context: context);
        return;
      }
      if (isUpdate) {
        await hiveBox.putAt(index, custRegSyncStore);
        Utils.successSnackBar(
            msg: 'Record Updated Successfully', context: context);
      } else {
        if (hiveBox.length < 15) {
          await hiveBox.add(custRegSyncStore);
          Utils.successSnackBar(
              msg: "Data Saved Successfully", context: context);
        } else {
          Utils.errorSnackBar(
              msg: 'Please upload previous records before adding more.',
              context: context);
        }
      }
    } catch (e) {
      Utils.errorSnackBar(msg: e.toString(), context: context);
      log("addCustRegSyncLocalDB Error: ${e.toString()}");
    }
  }
}