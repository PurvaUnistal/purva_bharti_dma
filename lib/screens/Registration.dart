import 'package:flutter/material.dart';
import 'package:hpcl_app/screens/custom_input_form_screen.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import '../ExportFile/export_file.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  String customerRegLabel = '',
      customerKycLabel = '',
      customerPhotoLabel = '',
      customerConsentLabel = '';
  String customerDepositLabel = '';
  String step1Label = '', step2Label = '', step3Label = '', step4Label = '';
  String step5Label = '';
  bool gettingLabel = true;
  bool isInternet = false;
  bool showProgress = false;
  bool license = false;
  BuildContext ctx;
  bool canProceed = true;
  bool isOffline = false;
  bool dialogIsVisible = false;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  DateTime formattedDate;
  bool _isMobileType = false;
  bool _isBothType = false;
  bool _isWifiTypea = false;

  static const APP_STORE_URL = 'https://apps.apple.com/us/app/appname/idAPP-ID';
  static const PLAY_STORE_URL =
      'https://play.google.com/store/apps/details?id=APP-ID';

  Future<void> fetchLabals() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String strUrl = GlobalConstants.getLabels;
    final response = await http.get(
      Uri.parse(strUrl),
    );
    HpclLabals album = HpclLabals.fromJson(json.decode(response.body));
    prefs.setString(GlobalConstants.AllLEBELS, response.body);
    Steps steps = album.steps;
    prefs.setString(GlobalConstants.mobileNoLabel, steps.mobile);
    prefs.setString(GlobalConstants.firstNameLabel, steps.firstname);
    prefs.setString(GlobalConstants.lastNameLabel, steps.lastname);
    prefs.setString(GlobalConstants.middleNameLabel, steps.middlename);
    prefs.setString(GlobalConstants.btnSubmit, steps.button);
    customerRegLabel = steps.reg;
    customerKycLabel = steps.kyc;
    customerPhotoLabel = steps.photo;
    customerConsentLabel = steps.consent;
    customerDepositLabel = steps.deposit;
    step1Label = steps.step1;
    step2Label = steps.step2;
    step3Label = steps.step3;
    step4Label = steps.step4;
    step5Label = steps.step5;
    print(response.body);
    if (!mounted) return;
    setState(() {
      gettingLabel = false;
    });
  }

  checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      print('not connected');
      setState(() {
        isInternet = true;
      });
      _showMyDialog(
          context, 'Internet', 'Please Check Your Internet Connection!');
    }
  }

  ServerApi serverApi;
  List<ChargeAreaModel> listChargeArea;

  @override
  void initState() {
    super.initState();
    _multipleRequstPermission();
    serverApi = ServerApi();
    _download(context);
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(
              titleAppBar: "HPCL DMA",
              actions: <Widget>[
                Text(nameUser.toString(), style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                IconButton(
                  icon: Icon(
                    Icons.settings_power,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _exitApp(context);
                    },
                )
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _buildBox(
                            color:
                            _isMobileType ? Colors.green : Colors.red,
                            textTitle: "MOBILE DATA"),
                        _buildBox(
                            color: _isWifiTypea ? Colors.green : Colors.red,
                            textTitle: "WI-FI"),
                        _buildBox(
                          color: _isBothType ? Colors.green : Colors.red,
                          textTitle: "UPDATE",
                          onTap: () async {
                            print("_isMobileType$_isMobileType");
                            if (_isWifiTypea.toString().contains("true")) {
                             await _download(context);
                             CustomToast.showToast("Loading Successfully...");
                            } else {
                              CustomToast.showToast("ERROR!!!!!\n INTERNET CONNECTION");
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    _buildCardButton(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Version : 1.1,",
                      style: TextStyle(
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "GA : $schema,",
                      style: TextStyle(
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Date : 11-08-2023",
                      style: TextStyle(
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildBox({Color color, String textTitle, Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 10,
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(textTitle,
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  get _itemList {
    List<Widget> list = [];
    list.add(
        listItem(
        title: "Customer Registration Form",
        icon: Icons.picture_in_picture,
        onTap: () async {
       //   await _download(context);
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => CustomInputForm(isUpdate: false, position: 0, studentModel: null)));
        }
        )
    );
    list.add(listItem(
        title: "View and Sync Records",
        icon: Icons.receipt,
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => CustomerRecord()))));
    return list;
  }

  listItem({icon, title, Function onTap}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 90,
        child: Card(
          elevation: 8,
          child: InkWell(
            onTap: onTap,
            child: Row(
              children: <Widget>[
                icon != null
                    ? Container(
                  padding: EdgeInsets.all(11),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.red)),
                  child: new Icon(
                    icon,
                  ),
                  alignment: Alignment.centerLeft,
                )
                    : Container(),
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _multipleRequstPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,Permission.storage, Permission.camera,
    ].request();
    if(statuses[Permission.location].isGranted){
      print("Location permission is isGranted.");
    }
    if(statuses[Permission.camera].isGranted){
      print("Camera permission is isGranted.");
    }
    if(statuses[Permission.storage].isGranted){
      print("Camera permission is isGranted.");
    }
    return true;
  }


  final List<String> titleList = <String>[
    'Customer Registration Form',
    'View and Sync Records'
  ];
  final List<IconData> iconList = <IconData>[
    Icons.picture_in_picture,
    Icons.receipt
  ];



  Widget _buildCardButton() {
    return Card(
      shape: Border(left: BorderSide(color: Colors.blue.shade900, width: 15)),
      elevation: 5,
      shadowColor: Colors.lightBlueAccent,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: _itemList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return _itemList[index];
            }),
      ),
    );
  }

  Future<bool> _exitApp(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Do you want to logout this application?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _getLoggedOut();
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                print("you choose no");
                Navigator.of(context).pop(false);
              },
              child: Text('No'),
            ),
          ],
        );
      },
    ) ??
        false;
  }

  Future<bool> _getLoggedOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
          (Route<dynamic> route) => false,
    );
    return null;
  }

  Future<void> _showMyDialog(
      BuildContext mContext, String title, String _msg) async {
    return showDialog<void>(
      context: mContext,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(_msg),
                //Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title == 'Internet'
                ? TextButton(
              child: Text('Refresh'),
              onPressed: () {
                Navigator.of(context).pop();
                //  checkInternet();

                checkWifi();
              },
            )
                : Container(),
          ],
        );
      },
    );
  }

  _download(BuildContext context) async {
    await getSharedPrefer();
    fetchLabals();
    fetchArea();
    fetchChargeAreaList();
    interestedDorpdownList();
    _getPropertyCategory();
    _getPropertyClass();
    _getSocietyAllow();
    _getResidentStatus();
    _getExistingCookingFuel();
    _getGuardianType();
    _getIdProofArray();
    _getAddressProofArray();
    _getKycProofArray();
    _getBank();
    _getBillingModeList();
    _getAcceptConversionPolicyList();
    _getAcceptExtraFittingCostList();
    _getMdeOfDeposite();
    _getInitialDepositeStatusList();
    _getInitialDepositeScheme();
    getAllDistrictApi();
  }

  String schema, token, nameUser;

  getSharedPrefer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      schema = prefs.getString(GlobalConstants.schema);
      nameUser = prefs.getString(GlobalConstants.name);
      token = prefs.getString(GlobalConstants.token);
      print("schema------------->" + schema);
    });
  }

  Future<void> fetchArea() async {
    String url = GlobalConstants.getAllArea + "?schema=" + schema;
    var res = ApiProvider.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.area,
    );
    return res;
  }

  Future<void> fetchChargeAreaList() async {
    String url = GlobalConstants.getChargeAreaList + "?schema=" + schema;
    var res = ApiProvider.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.chargeAreaName,
    );
    return res;
  }

  Future<void> interestedDorpdownList() async {
    String url = GlobalConstants.getNoInterested;
    var res = ApiProvider.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.Interested,
    );
    return res;
  }

  Future<void> _getPropertyCategory() async {
    String url = GlobalConstants.getPropertyCategory + "?schema=" + schema;
    var res = ApiProvider.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.PropertyCategory,
    );
    return res;
  }

  Future<void> _getPropertyClass() async {
    String url = GlobalConstants.getProClasssCategory + "?schema=" + schema;
    var res = ApiProvider.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.propertyclass,
    );
    return res;
  }

  Future<void> _getSocietyAllow() async {
    String url = GlobalConstants.getSocietyAllow;
    var res = ApiProvider.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.sociaty_allow,
    );
    return res;
  }

  Future<void> _getResidentStatus() async {
    String url = GlobalConstants.getResidentStatus;
    var res = ApiProvider.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.ResidentStatus,
    );
    return res;
  }

  Future<void> _getExistingCookingFuel() async {
    String url = GlobalConstants.getExistingCookingFuel;
    var res = ApiProvider.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.CookingFuel,
    );
    return res;
  }

  Future<void> _getGuardianType() async {
    String url = GlobalConstants.getGuardianType;
    var res = ApiProvider.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.GuardianType,
    );
    return res;
  }

  Future<void> _getIdProofArray() async {
    String url = GlobalConstants.getIdentityProof;
    var res = ApiProvider.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.IdentityProof,
    );
    return res;
  }

  Future<void> _getAddressProofArray() async {
    String url = GlobalConstants.getOwnershipProof;
    var res = ApiProvider.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.OwnershipProof,
    );
    return res;
  }

  Future<void> _getKycProofArray() async {
    String url = GlobalConstants.getKycDoc;
    var res = ApiProvider.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.KycDoc,
    );
    return res;
  }

  Future<void> _getBank() async {
    String url = GlobalConstants.getAllBanks;
    var res = ApiProvider.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.AllBanks,
    );
    return res;
  }

  Future<void> _getBillingModeList() async {
    String url = GlobalConstants.getEbilling;
    var res = ApiProvider.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.Ebilling,
    );
    return res;
  }

  Future<void> _getAcceptConversionPolicyList() async {
    String url = GlobalConstants.getAcceptConversionPolicy;
    var res = ApiProvider.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.ConversionPolicy,
    );
    return res;
  }

  Future<void> _getAcceptExtraFittingCostList() async {
    String url = GlobalConstants.getAcceptExtraFittingCost;
    var res = ApiProvider.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.ExtraFittingCost,
    );
    return res;
  }

  Future<void> _getMdeOfDeposite() async {
    String url = GlobalConstants.getMdeOfDeposite;
    var res = ApiProvider.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.MdeOfDeposite,
    );
    return res;
  }

  Future<void> _getInitialDepositeStatusList() async {
    String url = GlobalConstants.getInitialDepositeStatus;
    var res = ApiProvider.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.DepositeStatus,
    );
    return res;
  }

  Future<void> getAllDistrictApi() async {
    String url = GlobalConstants.getAllDistrict + "?schema=" + schema;
    var res = ApiProvider.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.AllDistrict,
    );
    return res;
  }

  Future<void> _getInitialDepositeScheme() async {
    String url = GlobalConstants.getSchemeType + "?schema=" + schema;
    var res = ApiProvider.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.SchemeType,
    );
    return res;
  }

  void checkWifi() {
    NetworkCheck networkCheck = new NetworkCheck();
    networkCheck.checkInternet(fetchPrefrence);
  }

  fetchPrefrence(bool isNetworkPresent) {
    if (isNetworkPresent) {
      fetchLabals();
    } else {
      _showMyDialog(
          context, 'Internet', 'Please Check Wi-fi Internet Connection!');
    }
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        if (!mounted) return;
        setState(() {
          isOffline = false;
          dialogIsVisible = false;
          _isBothType = true;
          _isWifiTypea = true;
        });
        break;
      case ConnectivityResult.mobile:
        if (!mounted) return;
        setState(() {
          isOffline = true;
          dialogIsVisible = false;
          _isMobileType = true;
          _isWifiTypea = true;
        });
        break;
      case ConnectivityResult.wifi:
        if (!mounted) return;
        setState(() {
          isOffline = false;
          dialogIsVisible = false;
          _isBothType = true;
          _isWifiTypea = true;
        });
        break;
      case ConnectivityResult.mobile:
        if (!mounted) return;
        setState(() {
          isOffline = true;
          dialogIsVisible = false;
          _isMobileType = true;
          _isWifiTypea = true;
        });
        break;
      case ConnectivityResult.none:
        if (!mounted) return;
        setState(() {
          isOffline = true;
          _isMobileType = false;
          _isBothType = false;
          _isWifiTypea = false;
        });
        break;
      default:
        if (!mounted) return;
        setState(() => isOffline = true);
        break;
    }
  }

  void buildAlertDialog(String message) {
    SchedulerBinding.instance.addPostFrameCallback((_) => setState(() {
      if (isOffline && !dialogIsVisible) {
        dialogIsVisible = true;
        showDialog(
            barrierDismissible: false,
            context: ctx,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.0),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.portable_wifi_off,
                      color: Colors.redAccent,
                      size: 36.0,
                    ),
                    canProceed
                        ? Text(
                      "Check your internet connection before proceeding.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12.0),
                    )
                        : Text(
                      "Please! proceed by connecting to a internet connection",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.0, color: Colors.red),
                    ),
                  ],
                ),
                actions: <Widget>[
                  ButtonWidget(
                    textButton:"CLOSE THE APP",
                    onPressed: () {
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                    },
                  ),
                  ButtonWidget(
                    textButton:"CLOSE THE APP",
                    onPressed: () {
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                    },
                  ),
                  ButtonWidget(
                    textButton:"PROCEED",
                    onPressed: () {
                      if (isOffline) {
                        setState(() {
                          canProceed = false;
                        });
                      } else {
                        Navigator.pop(ctx);
                        //your code
                      }
                    },
                  ),
                ],
              );
            });
      }
    }));
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    if (!mounted) {
      return;
    }

    _updateConnectionStatus(result);
  }
}




class ApiProvider {
  static Future<dynamic> getData({var urlEndPoint, var setApiData}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(GlobalConstants.token);
    try {
      String url = urlEndPoint;
      log(url);
      final response = await get(
        Uri.parse(url.toString()),
        headers: {
          "authorization": token,
        },
      );
      log(response.body);
      if (response.statusCode == 200) {
        prefs.setString(setApiData, response.body);
        return jsonDecode(response.body);
      }
    } catch (e) {
      if (e is SocketException) {
        log("SocketException : ${e.toString()}");
        //  CustomToast.showToast(e.toString());
      } else if (e is TimeoutException) {
        log("TimeoutException : ${e.toString()}");
        // CustomToast.showToast(e.toString());
      } else {
        log("Unhandled exception : ${e.toString()}");
        // CustomToast.showToast(e.toString());
      }
    }
    return null;
  }
}
