import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pbg_app/features/customRegistrationForm/domain/model/save_customer_registration_offline_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_accept_conversion_policy_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_accept_extra_fitting_cost_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_all_area_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_all_deposit_offline_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_all_district_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_charge_area_list_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_ebilling_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_existing_cooking_fuel_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_guardian_type_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_identity_proof_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_initial_deposit_status_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_kyc_doc_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_label_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_mode_of_deposit_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_not_interested_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_ownership_proof_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_property_category_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_property_class_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_resident_status_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_society_allow_model.dart';

import 'hive_box_name.dart';

class HiveDataBase {
  static Box<GetAcceptConversionPolicyModel>? acceptConversionPolicyBox;
  static Box<GetAcceptExtraFittingCostModel>? acceptExtraFittingCostBox;
  static Box<GetAllAreaModel>? allAreaBox;
  static Box<GetAllDepositOfflineModel>? allDepositOfflineBox;
  static Box<GetAllDistrictModel>? allDistrictBox;
  static Box<GetChargeAreaListModel>? chargeAreaListBox;
  static Box<GetEBillingModel>? eBillingBox;
  static Box<GetExistingCookingFuelModel>? cookingFuelBox;
  static Box<GetGuardianTypeModel>? guardianTypeBox;
  static Box<GetIdentityProofModel>? idProofBox;
  static Box<GetInitialDepositStatusModel>? initDepositStatusBox;
  static Box<GetKycDocModel>? kycDocBox;
  static Box<GetLabelModel>? allLabelBox;
  static Box<Consent>? consentBox;
  static Box<Deposit>? depositBox;
  static Box<Inspection>? inspectionBox;
  static Box<Kyc>? kycBox;
  static Box<Lmc>? lmcBox;
  static Box<Photo>? photoBox;
  static Box<Registration>? registrationBox;
  static Box<Steps>? stepsBox;
  static Box<GetModeOfDepositModel>? modeOfDepositBox;
  static Box<GetNotInterestedModel>? notInterestedBox;
  static Box<GetOwnershipProofModel>? ownershipProofBox;
  static Box<GetPropertyCategoryModel>? proCateBox;
  static Box<GetPropertyClassModel>? proClassBox;
  static Box<GetResidentStatusModel>? resStatusBox;
  static Box<GetSocietyAllowModel>? societyAllowBox;
  static Box<SaveCustomerRegistrationOfflineModel>? customerRegBox;


  Future<void> init() async {
    Directory tempDir = await getApplicationDocumentsDirectory();
    Directory filesDir = Directory(tempDir.path)..createSync(recursive: true);
    Hive.init(filesDir.path);

    Hive.registerAdapter(GetAcceptConversionPolicyModelAdapter());
    Hive.registerAdapter(GetAcceptExtraFittingCostModelAdapter());
    Hive.registerAdapter(GetAllAreaModelAdapter());
    Hive.registerAdapter(GetAllDepositOfflineModelAdapter());
    Hive.registerAdapter(GetAllDistrictModelAdapter());
    Hive.registerAdapter(GetChargeAreaListModelAdapter());
    Hive.registerAdapter(GetEBillingModelAdapter());
    Hive.registerAdapter(GetExistingCookingFuelModelAdapter());
    Hive.registerAdapter(GetGuardianTypeModelAdapter());
    Hive.registerAdapter(GetIdentityProofModelAdapter());
    Hive.registerAdapter(GetInitialDepositStatusModelAdapter());
    Hive.registerAdapter(GetKycDocModelAdapter());
    Hive.registerAdapter(GetLabelModelAdapter());
    Hive.registerAdapter(ConsentAdapter());
    Hive.registerAdapter(DepositAdapter());
    Hive.registerAdapter(InspectionAdapter());
    Hive.registerAdapter(KycAdapter());
    Hive.registerAdapter(LmcAdapter());
    Hive.registerAdapter(PhotoAdapter());
    Hive.registerAdapter(RegistrationAdapter());
    Hive.registerAdapter(StepsAdapter());
    Hive.registerAdapter(GetModeOfDepositModelAdapter());
    Hive.registerAdapter(GetNotInterestedModelAdapter());
    Hive.registerAdapter(GetOwnershipProofModelAdapter());
    Hive.registerAdapter(GetPropertyCategoryModelAdapter());
    Hive.registerAdapter(GetPropertyClassModelAdapter());
    Hive.registerAdapter(GetResidentStatusModelAdapter());
    Hive.registerAdapter(GetSocietyAllowModelAdapter());
    Hive.registerAdapter(SaveCustomerRegistrationOfflineModelAdapter());

    acceptConversionPolicyBox = await Hive.openBox<GetAcceptConversionPolicyModel>(HiveBoxName.AcceptConversionPolicyBox);
    acceptExtraFittingCostBox = await Hive.openBox<GetAcceptExtraFittingCostModel>(HiveBoxName.AcceptExtraFittingCostBox);
    allAreaBox = await Hive.openBox<GetAllAreaModel>(HiveBoxName.AllAreaBox);
    allDepositOfflineBox = await Hive.openBox<GetAllDepositOfflineModel>(HiveBoxName.AllDepositOfflineBox);
    allDistrictBox = await Hive.openBox<GetAllDistrictModel>(HiveBoxName.AllDistrictBox);
    chargeAreaListBox = await Hive.openBox<GetChargeAreaListModel>(HiveBoxName.ChargeAreaListBox);
    eBillingBox = await Hive.openBox<GetEBillingModel>(HiveBoxName.EBillingBox);
    cookingFuelBox = await Hive.openBox<GetExistingCookingFuelModel>(HiveBoxName.CookingFuelBox);
    guardianTypeBox = await Hive.openBox<GetGuardianTypeModel>(HiveBoxName.GuardianTypeBox);
    idProofBox = await Hive.openBox<GetIdentityProofModel>(HiveBoxName.IdProofBox);
    initDepositStatusBox = await Hive.openBox<GetInitialDepositStatusModel>(HiveBoxName.InitDepositStatusBox);
    kycBox = await Hive.openBox<Kyc>(HiveBoxName.KycDocBox);
    allLabelBox = await Hive.openBox<GetLabelModel>(HiveBoxName.AllLabelBox);
    modeOfDepositBox = await Hive.openBox<GetModeOfDepositModel>(HiveBoxName.ModeOfDepositBox);
    notInterestedBox = await Hive.openBox<GetNotInterestedModel>(HiveBoxName.NotInterestedBox);
    ownershipProofBox = await Hive.openBox<GetOwnershipProofModel>(HiveBoxName.OwnershipProofBox);
    proCateBox = await Hive.openBox<GetPropertyCategoryModel>(HiveBoxName.ProCateBox);
    proClassBox = await Hive.openBox<GetPropertyClassModel>(HiveBoxName.ProClassBox);
    resStatusBox = await Hive.openBox<GetResidentStatusModel>(HiveBoxName.ResStatusBox);
    societyAllowBox = await Hive.openBox<GetSocietyAllowModel>(HiveBoxName.SocietyAllowBox);
    customerRegBox = await Hive.openBox<SaveCustomerRegistrationOfflineModel>(HiveBoxName.CustomerRegBox);

  }
}
