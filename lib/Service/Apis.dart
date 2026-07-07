import 'package:flutter/material.dart';
import 'package:pbg_app/Utils/common_widgets/res/environment_config.dart';
import 'package:pbg_app/Utils/common_widgets/res/singleton.dart';

class AppUrl {

  static BuildContext? context = Singleton.instanceInit()?.context;

  static final String baseUrl =
      EnvironmentConfig.of(context!)!.generalUrlBaseFlavour;

  static get auth  => "auth";
  static get getLabel  => "getLabel";
  static get getConstant  => "getConstant";

  static get getAllDistrict  => "getAllDistrict";
  static get getPropertyClass  => "getPropertyClass";
  static get getPngrbCustomerData  => "getPngrbCustomerDataAPi";
  static get getTitle  => "getTitle";
  static get getDmaRegForm  => "getDmaRegForm";
  static get getMeterType  => "getMeterType";
  static get getHouseHoldType  => "getHouseHoldType";
  static get getPropertyCategory => "getPropertyCategory";
  static get getChargeAreaList  => "getChargeAreaList";
  static get getAllArea  => "getAllArea";
  static get getAllDepositOffline => "getAllDepositOffline";
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
