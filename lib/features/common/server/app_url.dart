class AppUrl {
  static String baseUrl = 'http://142.79.231.30:8099/';
 // static String baseUrl = 'http://pbgpl.smartgasnet.com/';
 // static String baseUrl = "https://citygas.hpcl.co.in/";
  static String auth = "${baseUrl}api/auth";
  static String getLabel = "${baseUrl}api/getLabel";
  static String notInterested = "${baseUrl}api/getConstant?key=notIntrested";
  static String initialDepositStatus =
      "${baseUrl}api/getConstant?key=initialDepositeStatus";
  static String modeOfDeposit = "${baseUrl}api/getConstant?key=modeOfDeposite";
  static String acceptExtraFittingCost =
      "${baseUrl}api/getConstant?key=acceptExtraFittingCost";
  static String acceptConversionPolicy =
      "${baseUrl}api/getConstant?key=acceptConversionPolicy";
  static String getAllDistrict = "${baseUrl}api/getAllDistrict?schema=";
  static String eBilling = "${baseUrl}api/getConstant?key=ebilling";
  static String kycDoc = "${baseUrl}api/getConstant?key=kycDoc";
  static String ownershipProof = "${baseUrl}api/getConstant?key=ownershipProof";
  static String identityProof = "${baseUrl}api/getConstant?key=identityProof";
  static String guardianType = "${baseUrl}api/getConstant?key=guardian_type";
  static String existingCookingFuel =
      "${baseUrl}api/getConstant?key=existingCookingFuel";
  static String residentStatus = "${baseUrl}api/getConstant?key=residentStatus";
  static String societyAllow = "${baseUrl}api/getConstant?key=societyAllow";
  static String getPropertyClass = "${baseUrl}api/getPropertyClass?schema=";
  static String getPropertyCategory =
      "${baseUrl}api/getPropertyCategory?schema=";
  static String getChargeAreaList = "${baseUrl}api/getChargeAreaList?schema=";
  static String getAllArea = "${baseUrl}api/getAllArea?schema=";
  static String getAllDepositOffline =
      "${baseUrl}api/getAllDepositOffline?schema=";
  static String saveCustomerRegistration =
      "${baseUrl}api/saveCustomerRegistration";
  static String getConsentByPhone = "${baseUrl}api/getConsentByPhone";
  static String saveCustomerConsent = "api/saveCustomerConsent";
  static String saveDmaRegistrationDocsStep2 =
      "${baseUrl}api/saveDmaRegistrationDocsStep2";
  static String saveDmaRegistrationDocs =
      "${baseUrl}api/saveDmaRegistrationDocs";
  static String saveDmaRegistrationDocsOffline =
      "${baseUrl}api/saveDmaRegistrationDocsOffline";
  static String saveDmaRegistrationDocsStep2Offline =
      "${baseUrl}api/saveDmaRegistrationDocsStep2Offline";
  static String saveCustomerConsentOffline =
      "${baseUrl}api/storeConsentOffline";
  static String saveSecurityDepositOffline =
      "${baseUrl}api/saveSecurityDepositOffline";
  static String getAllDeposit = baseUrl + "${baseUrl}api/getAllDepositOffline";
  static String saveSecurityDeposit = "${baseUrl}api/saveSecurityDeposit";
  static String getAllBanks = '$baseUrl' + "api/getAllBanks";
}
