import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/models/GetAllDistrictModel.dart';
import 'package:pbg_app/screens/BookingRegistrationForm/presentation/page/booking_registration_form.dart';
import 'package:pbg_app/screens/custom_input_form/presentation/page/custom_input_form_screen.dart';
import 'package:pbg_app/utils/common_widgets/message_box_two_button_pop.dart';
import 'package:permission_handler/permission_handler.dart';

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

  checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        log('connected');
      }
    } on SocketException catch (_) {
      log('not connected');
      setState(() {
        isInternet = true;
      });
      _showMyDialog(
          context, 'Internet', 'Please Check Your Internet Connection!');
    }
  }

  @override
  void initState() {
    super.initState();
    _multipleRequstPermission();
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
              titleAppBar: "PBG DMA",
              leading: Center(
                child: Text(
                  nameUser.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.settings_power,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _exitApp();
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
                            color: _isMobileType ? Colors.green : Colors.red,
                            textTitle: "MOBILE DATA"),
                        _buildBox(
                            color: _isWifiTypea ? Colors.green : Colors.red,
                            textTitle: "WI-FI"),
                        _buildBox(
                          color: _isBothType ? Colors.green : Colors.red,
                          textTitle: "UPDATE",
                          onTap: () async {
                            log("_isMobileType$_isBothType");
                            if (_isBothType.toString().contains("true")) {
                              await _download(context);
                              CustomToast.showToast("Loading Successfully...");
                            } else {
                              CustomToast.showToast(
                                  "ERROR!!!!!\n INTERNET CONNECTION");
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
                      "Version : 1.4,",
                      style: TextStyle(
                          color: Colors.green.shade800,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "GA : $schema,",
                      style: TextStyle(
                          color: Colors.green.shade800,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Date : 13-02-2024",
                      style: TextStyle(
                          color: Colors.green.shade800,
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
    list.add(listItem(
        title: "DPNG Registration Form",
        icon: Icons.picture_in_picture,
        onTap: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CustomInputForm(
                      isUpdate: false, position: 0, studentModel: null)));
        }));
    list.add(listItem(
        title: "View and Sync Records",
        icon: Icons.receipt,
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SaveCustomerRegistrationPage()))));
    /*list.add(listItem(
        title: "DPNG Booking Registration Form",
        icon: Icons.book,
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookingRegistrationFormView()))));*/
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
      Permission.location,
      Permission.camera,
      Permission.photos,
      Permission.storage,
    ].request();
    if (statuses[Permission.location].isGranted ||
        statuses[Permission.camera].isGranted ||
        statuses[Permission.photos].isGranted ||
        statuses[Permission.storage].isGranted) {
      log("All permission are isGranted");
    } else {
      openAppSettings();
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
      shape: Border(left: BorderSide(color: Colors.green.shade800, width: 15)),
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

  Future<bool> _exitApp() async {
    return (await showDialog(
        context: context,
        builder: (BuildContext mContext) => MessageBoxTwoButtonPopWidget(
            message: "Do you want to logout this App?",
            okButtonText: "Yes",
            onPressed: (){
              _getLoggedOut();
            }
        ))
    ) ?? false;
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
    interestedList();
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
    getAllTestDistrictApi();
    getAllDistrictApi();
  }

  SharedPreferences prefs;
  String schema, token, nameUser;

  getSharedPrefer() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      schema = prefs.getString(GlobalConstants.schema);
      nameUser = prefs.getString(GlobalConstants.name);
      token = prefs.getString(GlobalConstants.token);
      log("schema------------->" + schema);
    });
  }

  Future<void> fetchLabals() async {
    String url = GlobalConstants.getLabels;
    var res = await ApiIntegration.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.AllLEBELS,
    );
    return res;
  }

  Future<void> fetchArea() async {
    String url = GlobalConstants.getAllArea + "?schema=" + schema;
    var res = await ApiIntegration.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.area,
    );
    return res;
  }

  Future<void> fetchChargeAreaList() async {
    String url = GlobalConstants.getChargeAreaList + "?schema=" + schema;
    var res = await ApiIntegration.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.chargeAreaName,
    );
    return res;
  }

  Future<void> interestedList() async {
    String url = GlobalConstants.getNoInterested;
    var res = await ApiIntegration.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.Interested,
    );
    return res;
  }

  Future<void> _getPropertyCategory() async {
    String url = GlobalConstants.getPropertyCategory + "?schema=" + schema;
    var res = await ApiIntegration.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.PropertyCategory,
    );
    return res;
  }

  Future<void> _getPropertyClass() async {
    String url = GlobalConstants.getProClasssCategory + "?schema=" + schema;
    var res = await ApiIntegration.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.propertyclass,
    );
    return res;
  }

  Future<void> _getSocietyAllow() async {
    String url = GlobalConstants.getSocietyAllow;
    var res = await ApiIntegration.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.sociaty_allow,
    );
    return res;
  }

  Future<void> _getResidentStatus() async {
    String url = GlobalConstants.getResidentStatus;
    var res = await ApiIntegration.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.ResidentStatus,
    );
    print("residentStatus-->${res}");
    return res;
  }

  Future<void> _getExistingCookingFuel() async {
    String url = GlobalConstants.getExistingCookingFuel;
    var res = await ApiIntegration.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.CookingFuel,
    );
    return res;
  }

  Future<void> _getGuardianType() async {
    String url = GlobalConstants.getGuardianType;
    var res = await ApiIntegration.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.GuardianType,
    );
    return res;
  }

  Future<void> _getIdProofArray() async {
    String url = GlobalConstants.getIdentityProof;
    var res = await ApiIntegration.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.IdentityProof,
    );
    return res;
  }

  Future<void> _getAddressProofArray() async {
    String url = GlobalConstants.getOwnershipProof;
    var res = await ApiIntegration.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.OwnershipProof,
    );
    return res;
  }

  Future<void> _getKycProofArray() async {
    String url = GlobalConstants.getKycDoc;
    var res = await ApiIntegration.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.KycDoc,
    );
    return res;
  }

  Future<void> _getBank() async {
    String url = GlobalConstants.getAllBanks;
    var res = await ApiIntegration.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.AllBanks,
    );
    return res;
  }

  Future<void> _getBillingModeList() async {
    String url = GlobalConstants.getEbilling;
    var res = await ApiIntegration.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.Ebilling,
    );
    return res;
  }

  Future<void> _getAcceptConversionPolicyList() async {
    String url = GlobalConstants.getAcceptConversionPolicy;
    var res = await ApiIntegration.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.ConversionPolicy,
    );
    return res;
  }

  Future<void> _getAcceptExtraFittingCostList() async {
    String url = GlobalConstants.getAcceptExtraFittingCost;
    var res = await ApiIntegration.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.ExtraFittingCost,
    );
    return res;
  }

  Future<void> _getMdeOfDeposite() async {
    String url = GlobalConstants.getMdeOfDeposite;
    var res = await ApiIntegration.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.MdeOfDeposite,
    );
    return res;
  }

  Future<void> _getInitialDepositeStatusList() async {
    String url = GlobalConstants.getInitialDepositeStatus;
    var res = await ApiIntegration.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.DepositeStatus,
    );
    return res;
  }

  Future<List<GetAllDistrictModel>> getAllTestDistrictApi() async {
    String url = GlobalConstants.getAllDistrict + "?schema=" + schema;
    try {
      final res = await ApiIntegration.getTestData(
        endPoint: url,
      );
      if (res != null) {
        prefs.setString(SPrefsKey.getAllDistrict, res);
        return getAllDistrictModelFromJson(res);
        //  return List<GetAllDistrictModel>.from(json.map((x) => GetAllDistrictModel.fromJson(x)));
      }
    } catch (e) {
      print("GetAllDistrictModel-->${e.toString()}");
    }
    return null;
  }

  Future<void> getAllDistrictApi() async {
    String url = GlobalConstants.getAllDistrict + "?schema=" + schema;
    var res = await ApiIntegration.getData(
      urlEndPoint: url,
      setApiData: GlobalConstants.AllDistrict,
    );
    return res;
  }

  Future<void> _getInitialDepositeScheme() async {
    String url = GlobalConstants.getSchemeType + "?schema=" + schema;
    var res = await ApiIntegration.getData(
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
          _isBothType = true;
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
          _isBothType = true;
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
                        textButton: "CLOSE THE APP",
                        onPressed: () {
                          SystemChannels.platform
                              .invokeMethod('SystemNavigator.pop');
                        },
                      ),
                      ButtonWidget(
                        textButton: "CLOSE THE APP",
                        onPressed: () {
                          SystemChannels.platform
                              .invokeMethod('SystemNavigator.pop');
                        },
                      ),
                      ButtonWidget(
                        textButton: "PROCEED",
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
      log(e.toString());
    }

    if (!mounted) {
      return;
    }

    _updateConnectionStatus(result);
  }
}
