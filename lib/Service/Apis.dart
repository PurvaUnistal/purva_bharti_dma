import 'package:flutter/material.dart';
import 'package:pbg_app/Utils/common_widgets/res/environment_config.dart';
import 'package:pbg_app/Utils/common_widgets/res/singleton.dart';

class AppUrl {
 // static get baseUrl = 'http://142.79.231.30:9097/';
 // static get baseUrl = 'https://nmpplstations1.smartgasnet.com/';
  // static get baseUrl = 'http://pbgpl.smartgasnet.com/';
  // static get baseUrl = 'https://pbgplc.smartgasnet.com/';
  // static get baseUrl = 'https://pbgpluat.smartgasnet.com/';

  static BuildContext? context = Singleton.instanceInit()?.context;

  static final String baseUrl =
      EnvironmentConfig.of(context!)!.generalUrlBaseFlavour;

  static get auth  => "auth";
  static get getLabel  => "getLabel";
  static get notInterested  => "getConstant?key=notIntrested";
  static get initialDepositStatus => "getConstant?key=initialDepositeStatus";
  static get modeOfDeposit  => "getConstant?key=modeOfDeposite";
  static get acceptExtraFittingCost => "getConstant?key=acceptExtraFittingCost";
  static get acceptConversionPolicy => "getConstant?key=acceptConversionPolicy";
  static get getAllDistrict  => "getAllDistrict?schema=";
  static get eBilling  => "getConstant?key=ebilling";
  static get kycDoc  => "getConstant?key=kycDoc";
  static get ownershipProof  => "getConstant?key=ownershipProof";
  static get identityProof  => "getConstant?key=identityProof";
  static get guardianType  => "getConstant?key=guardian_type";
  static get existingCookingFuel => "getConstant?key=existingCookingFuel";
  static get residentStatus  => "getConstant?key=residentStatus";
  static get societyAllow  => "getConstant?key=societyAllow";
  static get getPropertyClass  => "getPropertyClass?schema=";
  static get getPropertyCategory => "getPropertyCategory?schema=";
  static get getChargeAreaList  => "getChargeAreaList?schema=";
  static get getAllArea  => "getAllArea?schema=";
  static get getAllDepositOffline => "getAllDepositOffline?schema=";
  static get saveCustomerRegistration => "saveCustomerRegistration";
  static get getConsentByPhone  => "getConsentByPhone";
  static get saveCustomerConsent => "saveCustomerConsent";
  static get saveDmaRegistrationDocsStep2 => "saveDmaRegistrationDocsStep2";
  static get saveDmaRegistrationDocs => "saveDmaRegistrationDocs";
  static get saveDmaRegistrationDocsOffline => "saveDmaRegistrationDocsOffline";
  static get saveDmaRegistrationDocsStep2Offline => "saveDmaRegistrationDocsStep2Offline";
  static get saveCustomerConsentOffline  => "storeConsentOffline";
  static get saveSecurityDepositOffline => "saveSecurityDepositOffline";
  static get getAllDeposit =>  "getAllDepositOffline";
  static get saveSecurityDeposit  => "saveSecurityDeposit";
  static get getAllBanks => "getAllBanks";
  static get saveCustomerRegistrationOffline => "saveCustomerRegistrationOffline";
}
