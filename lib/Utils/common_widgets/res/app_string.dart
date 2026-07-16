import 'app_config.dart';
import 'enums.dart';

class AppString{

  static const Map<Client, String> _releaseDates = {
    Client.mahaNagar: "12-03-2026",
    Client.purvaBharti: "11-06-2025",
    Client.hpoil: "13-03-2026",
    Client.vppl: "12-03-2026",
    Client.vrpl: "12-03-2026",
    Client.agcl: "16-07-2026",
  };

  static String get version => "Version : 1.0.0 - DMA-${_releaseDates[AppConfig.instanceInit()!.client] ?? ""}";
  static String companyName = "© Unistal Systems Pvt. Ltd.";
  static String appName = "Purba Bharati  DMA";
  static String companyNameDesc = "Unistal Private Ltd.";
  static String appLogo = "assets/images/pbg_logo.png";
  static String dashboardView = "Dashboard View";
  static String viewSyncRecord = "View and Sync Records";
  static String customerRegistrationForm = "Customer Registration Form ";
  static String mobile = "Mobile";
  static String wifi = "WI-FI";
  static String refresh = "Refresh";
  static String upload = "Upload";


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
  static String registrationFrom =  'Registration From';
  static String reasonRegistration =  'Reason Registration';
  static String applicationNumber =  'Application Number';
  static String chargeArea =  'Charge Area';
  static String area =  'Area';
  static String mobileNo =  "Mobile Number";
  static String alternateMobileNo = "Alternate Number";
  static String titleName = 'Title';
  static String firstName = 'First Name';
  static String middleName = 'Middle Name';
  static String lastName = 'Last Name';
  static String dob = 'DOB';
  static String guardianType = 'Select Guardian';
  static String houseHoldType = 'House Hold Type';
  static String guardianName = 'Guardian Name';
  static String emailAddress = 'Email ID';
  static String propertyCategory = 'Property Category';
  static String propertyClass = 'Property Class';
  static String buildingNumber =  'Building Number';
  static String floorNumber =  'Floor Number';
  static String houseNumber = 'House Number';
  static String colony = 'Colony/Society/Apartment';
  static String streetName = 'Lane/Street Name';
  static String town = 'Town';
  static String district = 'District';
  static String wardNumber= 'Ward Number';
  static String premiseType = 'Premise Type';
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
  static String ownershipProof = 'Ownership Proof';
  static String ownershipProofNo3 = 'KYC (Ownership Proof) Number';
  static String ownershipProofFront = 'Ownership Proof Front';
  static String ownershipProofBack = 'Ownership Proof Back';
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

  static String conversionPolicy = 'Conversion';
  static String fittingCost      = 'Fitting Cost';
  static String mdpeAllow        = 'MDPE Allow';
  static String initDepositStatus = 'Initial Deposit Status';
  static String meterType = 'Meter Type';
  static String reasonDeposit = 'Reason Deposit Status';
  static String schemeType = 'Scheme Type';
  static String schemeAmt = 'Deposit Amount';
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

class AppIcon{

  static logo(){
    return AppConfig.instanceInit()!.client == Client.purvaBharti
        ? AppIcon.pbgplLogo
        :AppConfig.instanceInit()!.client == Client.mahaNagar
        ? AppIcon.mglLogo
        :AppConfig.instanceInit()!.client == Client.hpoil
        ? AppIcon.hpOilLogo
        :AppConfig.instanceInit()!.client == Client.vppl
        ? AppIcon.vpplLogo
        :AppConfig.instanceInit()!.client == Client.vrpl
        ? AppIcon.vrplLogo
        :AppConfig.instanceInit()!.client == Client.agcl
        ? AppIcon.agclLogo
        : AppIcon.unistalLogo;
  }
  static String pbgplLogo = "assets/images/pbgpl_logo.png";
  static String mglLogo = "assets/images/mgl_logo.png";
  static String agclLogo = "assets/images/agcl_banner.png";
  static String oilIndiaLogo = "assets/images/oil_india_logo.png";
  static String vpplLogo = "assets/images/vppl_plcms.png";
  static String vrplLogo = "assets/images/vrpl_plcms.png";
  static String hpOilLogo = "assets/images/hp_oil_logo.png";
  static String unistalLogo = "assets/images/unistal_logo.png";

  static String colourStrip = "assets/images/ic_strip.png";
  static String imageCaptureIcon = "assets/images/ic_image.png";
}


