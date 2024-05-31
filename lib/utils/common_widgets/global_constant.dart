import '../../ExportFile/export_file.dart';

class GlobalConstants {
  bool isLoggedIn = false;

  // static String BaseUrl = 'http://142.79.231.30:8097/';
  static String BaseUrl = 'http://pbgpl.smartgasnet.com/';
  static String Login = BaseUrl + "api/auth";
  static String saveCustomerRegistration =
      BaseUrl + "api/saveCustomerRegistration";
  static String ConsentByPhone = BaseUrl + "api/getConsentByPhone";
  static String saveCustomerConsent = BaseUrl + "api/saveCustomerConsent";
  static String getAllArea = BaseUrl + "api/getAllArea";
  static String getPropertyClass = BaseUrl + "api/getPropertyClass";
  static String saveDmaRegistrationDocsStep2 =
      BaseUrl + "api/saveDmaRegistrationDocsStep2";
  static String saveDmaRegistrationDocs =
      BaseUrl + "api/saveDmaRegistrationDocs";
  static String saveDmaRegistrationDocsOffline =
      BaseUrl + "api/saveDmaRegistrationDocsOffline";
  static String saveDmaRegistrationDocsStep2Offline =
      BaseUrl + "api/saveDmaRegistrationDocsStep2Offline";
  static String saveCustomerConsentOffline =
      BaseUrl + "api/storeConsentOffline";
  static String saveSecurityDepositOffline =
      BaseUrl + "api/saveSecurityDepositOffline";
  static String getAllDeposit = BaseUrl + "api/getAllDepositOffline";
  static String saveSecurityDeposit = BaseUrl + "api/saveSecurityDeposit";

  static const String Billing = "Billing";
  static const String Complaint = "Complaint";
  static const String LMC = "LMC";
  static String shprefName = "LoginCredentialsHPCL";
  static String isUserLogIn = "IsUserLogIn";
  static String username = "username";
  static String password = "password";
  static String token = "token";
  static String id = "id";
  static String role = "role";
  static String schema = "schema";
  static String name = "name";
  static String changePassword = "Change Password";
  static String chargeAreaList = "Charge Area List";

  static String mobileNoLabel = "MobileNumberLabel";
  static String firstNameLabel = "FirstName";
  static String middleNameLabel = "MiddleName";
  static String lastNameLabel = "LastName";

  static var headerData = {
    HttpHeaders.authorizationHeader: "Basic YmFzaWNBdXRoOlVuaXN0YWxAMTk5NA=="
  };
  static String getPropertyCategory = '$BaseUrl' + "api/getPropertyCategory";
  static String getProClasssCategory = '$BaseUrl' + "api/getPropertyClass";
  static String getSocietyAllow =
      '$BaseUrl' + "api/getConstant?key=societyAllow";
  static String getResidentStatus =
      '$BaseUrl' + "api/getConstant?key=residentStatus";
  static String getExistingCookingFuel =
      '$BaseUrl' + "api/getConstant?key=existingCookingFuel";
  static String getGuardianType =
      '$BaseUrl' + "api/getConstant?key=guardian_type";
  static String getIdentityProof =
      '$BaseUrl' + "api/getConstant?key=identityProof";
  static String getOwnershipProof =
      '$BaseUrl' + "api/getConstant?key=ownershipProof";
  static String getKycDoc = '$BaseUrl' + "api/getConstant?key=kycDoc";

  static String getEbilling = '$BaseUrl' + "api/getConstant?key=ebilling";
  static String getAcceptConversionPolicy =
      '$BaseUrl' + "api/getConstant?key=acceptConversionPolicy";
  static String getAcceptExtraFittingCost =
      '$BaseUrl' + "api/getConstant?key=acceptExtraFittingCost";
  static String getSchemeType = '$BaseUrl' + "api/getAllDepositOffline";
  static String getAllDistrict = '$BaseUrl' + "api/getAllDistrict";
  static String getChargeAreaList = '$BaseUrl' + "api/getChargeAreaList";

  static String getInitialDepositeStatus =
      '$BaseUrl' + "api/getConstant?key=initialDepositeStatus";
  static String getMdeOfDeposite =
      '$BaseUrl' + "api/getConstant?key=modeOfDeposite";
  static String getNoInterested =
      '$BaseUrl' + "api/getConstant?key=notIntrested";
  static String getAllBanks = '$BaseUrl' + "api/getAllBanks";
  static String getLabels = '$BaseUrl' + "api/getLabel";

  static String forgot_password = "api/forget-password";
  static String resetPassword = BaseUrl + "resetpassword";

  // off linemodes
  static String alllabels = "AllLebles";
  static String area = "Area";
  static String chargeAreaName = "Charge Area Name";
  static String Interested = "Interested";
  static String PropertyCategory = "PropertyCategory";
  static String propertyclass = "propertyclass";
  static String sociaty_allow = "sociaty_allow";
  static String ResidentStatus = "ResidentStatus";
  static String CookingFuel = "CookingFuel";
  static String GuardianType = "GuardianType";
  static String IdentityProof = "IdentityProof";
  static String OwnershipProof = "OwnershipProof";
  static String KycDoc = "KycDoc";
  static String AllBanks = "AllBanks";
  static String Ebilling = "Ebilling";
  static String ConversionPolicy = "ConversionPolicy";
  static String ExtraFittingCost = "ExtraFittingCost";
  static String MdeOfDeposite = "MdeOfDeposite";
  static String DepositeStatus = "DepositeStatus";
  static String SchemeType = "SchemeType";
  static String AllDistrict = "getAllDistrict";
  static String AllLEBELS = "AllLEBELS";
  static String saveCustomerRegistrationOffline =
      BaseUrl + "api/saveCustomerRegistrationOffline";
  static String getDmaByPhoneNumber = BaseUrl + "api/getDmaByPhoneNumber";
}

class SPrefsKey {
  static String getAllDistrict = "GetAllDistrictModel";
}
