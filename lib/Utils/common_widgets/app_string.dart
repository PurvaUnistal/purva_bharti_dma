import 'package:flutter/material.dart';

class AppString{
  static String appName = "Purba Bharati  DMA";
  static String companyNameDesc = "Unistal Private Ltd.";
  static String appLogo = "assets/images/pbg_logo.png";
  static String dashboardView = "Dashboard View";
  static String viewSyncRecord = "View and Sync Records";
  static String customerRegistrationForm = "Customer Registration Form ";
  static String mobile = "Mobile";
  static String wifi = "WI-FI";
  static String update = "Update";
  static String upload = "Upload";

  static final List<String> titleList = <String>['Customer Registration Form', 'View and Sync Records'];
  static final List<IconData> iconList = <IconData>[Icons.picture_in_picture, Icons.receipt];

  static String emailLabel = "Enter User Name";
  static String passwordLabel = "Enter User Password";
  static String emailValidation = "Please enter email ";
  static String passwordValidation = "Please enter password";
  static RegExp emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static String invalidFormat = "Enter Invalid format";
  static String blankSpace = 'Blank space';



  static String locationLat = 'Latitude';
  static String locationLong = 'Longitude';
  static String star = "* ";

  static String registrationType =  'Registration Type';
  static String reasonRegistration =  'Reason Registration';
  static String chargeArea =  'Charge Area';
  static String area =  'Area';
  static String mobileNo =  "Mobile No";
  static String alternateMobileNo = "Alternate Mobile No";
  static String firstName = 'First Name';
  static String middleName = 'Middle Name';
  static String lastName = 'Last Name';
  static String guardianType = 'Guardian Type';
  static String guardianName = 'Guardian Name';
  static String emailAddress = 'Email ID';
  static String propertyCategory = 'Property Category';
  static String propertyClass = 'Property Class';
  static String buildingNumber =  'Building Number';
  static String houseNumber = 'House Number';
  static String colony = 'Colony/Society/Apartment';
  static String streetName = 'Lane/Street Name';
  static String town = 'Town';
  static String district = 'District';
  static String pinCode = 'Pin Code';
  static String noOfKitchen = 'Kitchen No.';
  static String noOfBathroom = 'Bathroom No.';
//  static String fuel = 'Existing Cooking Fuel';
  static String fuel = 'Cooking Fuel';
  static String noOfFamilyMembers = 'Family Members No.';
  static String nearestLandmark = 'Nearest Landmark';
  static String idProof = 'KYC(Identification Proof)';
  static String idProofNo = 'KYC(Identification Proof)Number';
  static String idProofFront = 'Id Proof Front';
  static String idProofBack = 'Id Proof Back';
  static String addProof = 'KYC (Address Proof)';
  static String addProofNo = 'KYC (Address Proof) Number';
  static String addProofFront = 'Address Proof Front';
  static String addProofBack = 'Address Proof Back';
  static String ownershipProperty = 'Select the Ownership type property';
  static String ownershipProofHeading = 'Address/Ownership Proof';
  static String ownershipProofNo = 'Ownership Proof No';
  static String nocDoc = 'NOC Doc Photo';
  static String customerImg = 'Customer Photo';
  static String houseImg = 'House Photo';
  static String cancelChqPhoto = 'Cancelled Cheque';
  static String chqPhoto = 'Cheque Photo';
  static String customerConsentImg = 'Customer Consent';
  static String ownerConsentImg = 'Owner Consent';
  static String residentStatus = 'Resident Status';
  static String billingMode = 'Preferred Billing Mode';
  static String customerBankName = 'Customer Bank Name';
  static String customerAccountNo = 'Customer Bank Account Number';
  static String customerIfscCode = 'Customer IFSC Code';
  static String customerBankAdd = 'Customer Bank Address';

  static String conversionPolicy =  'Conversion Policy';
  static String fittingCost =  'Extra Fitting Cost';
  static String mdpeAllow = 'Society Allow MDPE';
  static String depositStatus = 'Deposit Status';
  static String reasonDeposit = 'Reason Deposit Status';
  static String depositType = 'Scheme Type';
  static String depositAmt = 'Deposit Amount';
  static String modeDeposit = 'Mode Of Deposit';
  static String chqNo = 'Cheque Number';
  static String chqBank = 'Cheque Bank Name';
  static String chqDate = 'Cheque Deposit Date';
  static String chequeAccountNo = 'Cheque Account Number';
  static String chequeMICRNo = 'Cheque MICR Number';


  static String searchBpNp =  "Search BP Number";
  static String search =  "Search...";
  static String reasonInterested = 'Remarks';


  static String details = 'Details';
  static String save = 'Save';
  static String edit = 'Edit';
  static String preview = 'Preview';
  static String submit = 'Submit';

  static bool isMobile = false;
  static bool isFirst = false;
  static bool isLast = false;
  static bool isGuardian = false;
  static bool isHouseNo = false;
  static bool isAddress = false;
  static bool isPinCode = false;
  static bool isBankAccNo = false;
  static bool isMICRCode = false;
  static bool isNoc = false;
  static bool isOwnershipProofNo = false;
  static bool isIdProofNo = false;
  static bool isCustAccNo = false;
  static bool isCustIfscCode = false;
  static bool isCustBankAdd = false;


  static String yes = "Yes";
  static String no = "No";
  static String login = "Login";
  static String logout = "Logout";
  static String sessionExpired = "Session Expired";
  static String logoutMsg = "Are you sure you want to logout?";
}

class ImgAsset{
  static String appLogo = "assets/images/pbg_logo.png";
  static String imageCaptureIcon = "assets/images/ic_image.png";
}


