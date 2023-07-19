import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hpcl_app/utils/common_widgets/custom_app_bar.dart';
import 'package:http/http.dart' as http;
import '../ExportFile/export_file.dart';

class RegistrationForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegistrationFormSate();
  }
}

class RegistrationFormSate extends BaseState<RegistrationForm> {
  String customerRegLabel = '', customerKycLabel = '', customerPhotoLabel = '', customerConsentLabel = '';
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
  bool _checkInBtnStatus = false;
  bool _checkOutBtnStatus = false;
  bool _checkOutBtnboth = false;

  static const APP_STORE_URL = 'https://apps.apple.com/us/app/appname/idAPP-ID';
  static const PLAY_STORE_URL = 'https://play.google.com/store/apps/details?id=APP-ID';

  Future<void> fetchLabals() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String strUrl = GlobalConstants.getLabels;
    final response = await http.get(Uri.parse(strUrl),
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
        // fetchLabals();

      }
    } on SocketException catch (_) {
      print('not connected');
      setState(() {
        isInternet = true;
      });
      _showMyDialog(context, 'Internet', 'Please Check Your Internet Connection!');
    }
  }

  ServerApi serverApi;
  List<ChargeAreaModel> listChargeArea;

  // Future fetchChargeArea() async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var res = await serverApi.apiChargeArea();
  //   setState((){
  //     listChargeArea = res;
  //     prefs.setString(GlobalConstants.chargeAreaList, jsonEncode(res));
  //     print("chargeAreaList-->"+prefs.getString(GlobalConstants.chargeAreaList.toString()));
  //   });
  //   if(res != null){
  //     print("Successes");
  //   } else {
  //     print("Failed");
  //   }
  // }
  @override
  void initState() {
    super.initState();
    serverApi = ServerApi();
    _download(context);
    initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget buildView(BuildContext context) {
    ctx = context;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(
              titleAppBar: GlobalConstants.DMA_Page,
              actions: <Widget>[
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
                          color: _checkInBtnStatus ? Colors.green : Colors.red,
                          textTitle: "MOBILE DATA"
                        ),
                        _buildBox(
                            color: _checkOutBtnboth ? Colors.green : Colors.red,
                            textTitle: "WI-FI"
                        ),
                        _buildBox(
                            color: _checkOutBtnStatus ? Colors.green : Colors.red,
                            textTitle: "UPDATE",
                          onTap: () async {
                            print("_checkInBtnStatus$_checkInBtnStatus");
                            if (_checkOutBtnboth.toString().contains("true")) {
                              _download(context);
                             } else {
                              EasyLoading.showError("ERROR!!!!!\n INTERNET CONNECTION"); //drop down pr jao
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
                    Text("Version : 1,",
                      style: TextStyle(
                      color: Colors.blue.shade900,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    Text("Schema : ${schema},",
                      style: TextStyle(
                    color: Colors.blue.shade900,
                        fontWeight: FontWeight.bold
                    ),),
                    Text("Date : 12-07-2023",
                      style: TextStyle(
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold
                      ),),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildBox({Color color, String textTitle, Function onTap}){
    return InkWell(
      onTap:onTap ,
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
                  fontWeight: FontWeight.bold
              )
          ),
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
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => MainRegisterPageUpdate(isUpdate: false,position: -1 ,studentModel:null)))
    )
    );
    list.add(
        listItem(
            title:"View and Sync Records",
            icon: Icons.receipt,
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerRecord()))
        )
    );
    return list;
  }

  listItem({icon,title, Function onTap}) {
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
                        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.red)),
                        child: new Icon(icon,),
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
  final List<String> titleList = <String>['Customer Registration Form', 'View and Sync Records'];
  final List<IconData> iconList = <IconData>[Icons.picture_in_picture,Icons.receipt];
  Widget _buildCardButton() {
    return Card(
      shape: Border(
          left: BorderSide(color: Colors.blue.shade900, width: 15)
      ),
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
            }
            ),
       /* child: ListView.builder(
            shrinkWrap: true,
            itemCount: _itemList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 90,
                  child: Card(
                    elevation: 8,
                    child: InkWell(
                      onTap: () {
                     //   if (click != null) click.call();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          iconList != null
                              ? Container(
                            padding: EdgeInsets.all(11),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.red)),
                            child: new Icon(
                              iconList as IconData,
                              color: Colors.blue.shade900,
                            ),
                            alignment: Alignment.centerLeft,
                          )
                              : Container(),
                          Text(
                            titleList as String,
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
        ),*/
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

  Future<void> _showMyDialog(BuildContext mContext, String title, String _msg) async {
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

  String schema, token ;
  getSharedPrefer() async {
    SharedPreferences prefs  = await SharedPreferences.getInstance();
    setState(() {
      schema = prefs.getString(GlobalConstants.schema);
      token = prefs.getString(GlobalConstants.token);
      print("schema------------->"+schema);
    });
  }


  Future<void> fetchArea() async {
    String url = GlobalConstants.getAllArea+ "?schema=" + schema;
    var res = ApiProvider.getData(urlEndPoint:url , setApiData:GlobalConstants.area,);
    return res;
  }

  Future<void> fetchChargeAreaList() async {
    String url = GlobalConstants.getChargeAreaList + "?schema=" +schema;
    var res = ApiProvider.getData(urlEndPoint:url , setApiData:GlobalConstants.chargeAreaName,);
    return res;
  }

  Future<void> interestedDorpdownList() async {
    String url = GlobalConstants.getNoInterested;
    var res = ApiProvider.getData(urlEndPoint:url , setApiData:GlobalConstants.Interested,);
    return res;
  }

  Future<void> _getPropertyCategory() async {
    String url = GlobalConstants.getPropertyCategory+ "?schema=" + schema;
    var res = ApiProvider.getData(urlEndPoint:url , setApiData:GlobalConstants.PropertyCategory,);
    return res;
  }

  Future<void> _getPropertyClass() async {
    String url = GlobalConstants.getProClasssCategory+ "?schema=" + schema;
    var res = ApiProvider.getData(urlEndPoint:url , setApiData:GlobalConstants.propertyclass,);
    return res;
  }

  Future<void> _getSocietyAllow() async {
    String url = GlobalConstants.getSocietyAllow;
    var res = ApiProvider.getData(urlEndPoint:url , setApiData:GlobalConstants.sociaty_allow,);
    return res;
  }

  Future<void> _getResidentStatus() async {
    String url = GlobalConstants.getResidentStatus;
    var res = ApiProvider.getData(urlEndPoint:url , setApiData:GlobalConstants.ResidentStatus,);
    return res;
  }

  Future<void> _getExistingCookingFuel() async {
    String url = GlobalConstants.getExistingCookingFuel;
    var res = ApiProvider.getData(urlEndPoint:url , setApiData:GlobalConstants.CookingFuel,);
    return res;
  }

  Future<void> _getGuardianType() async {
    String url = GlobalConstants.getGuardianType;
    var res = ApiProvider.getData(urlEndPoint:url , setApiData:GlobalConstants.GuardianType,);
    return res;
  }

  Future<void> _getIdProofArray() async {
    String url = GlobalConstants.getIdentityProof;
    var res = ApiProvider.getData(urlEndPoint:url , setApiData:GlobalConstants.IdentityProof,);
    return res;
  }

  Future<void> _getAddressProofArray() async {
    String url = GlobalConstants.getOwnershipProof;
    var res = ApiProvider.getData(urlEndPoint:url , setApiData:GlobalConstants.OwnershipProof,);
    return res;
  }

  Future<void> _getKycProofArray() async {
    String url = GlobalConstants.getKycDoc;
    var res = ApiProvider.getData(urlEndPoint:url , setApiData:GlobalConstants.KycDoc,);
    return res;
  }

  Future<void> _getBank() async {
    String url = GlobalConstants.getAllBanks;
    var res = ApiProvider.getData(urlEndPoint:url , setApiData:GlobalConstants.AllBanks,);
    return res;
  }

  Future<void> _getBillingModeList() async {
    String url = GlobalConstants.getEbilling;
    var res = ApiProvider.getData(urlEndPoint:url , setApiData:GlobalConstants.Ebilling,);
    return res;
  }

  Future<void> _getAcceptConversionPolicyList() async {
    String url = GlobalConstants.getAcceptConversionPolicy;
    var res = ApiProvider.getData(urlEndPoint:url , setApiData:GlobalConstants.ConversionPolicy,);
    return res;
  }

  Future<void> _getAcceptExtraFittingCostList() async {
    String url = GlobalConstants.getAcceptExtraFittingCost;
    var res = ApiProvider.getData(urlEndPoint:url , setApiData:GlobalConstants.ExtraFittingCost,);
    return res;
  }

  Future<void> _getMdeOfDeposite() async {
    String url = GlobalConstants.getMdeOfDeposite;
    var res = ApiProvider.getData(urlEndPoint:url , setApiData:GlobalConstants.MdeOfDeposite,);
    return res;
  }

  Future<void> _getInitialDepositeStatusList() async {
    String url = GlobalConstants.getInitialDepositeStatus;
    var res = ApiProvider.getData(urlEndPoint:url , setApiData:GlobalConstants.DepositeStatus,);
    return res;
  }

  Future<void> getAllDistrictApi() async {
    String url = GlobalConstants.getAllDistrict + "?schema=" + schema;
    var res = ApiProvider.getData(urlEndPoint:url , setApiData:GlobalConstants.AllDistrict,);
    return res;
  }

  Future<void> _getInitialDepositeScheme() async {
    String url = GlobalConstants.getSchemeType + "?schema=" + schema;
    var res = ApiProvider.getData(urlEndPoint:url , setApiData:GlobalConstants.SchemeType,);
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
      _showMyDialog(context, 'Internet', 'Please Check Wi-fi Internet Connection!');
    }
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        if (!mounted) return;
        setState(() {
          isOffline = false;
          dialogIsVisible = false;
          _checkOutBtnStatus = true;
          _checkOutBtnboth = true;
        });
        break;
      case ConnectivityResult.mobile:
        if (!mounted) return;
        setState(() {
          isOffline = true;
          dialogIsVisible = false;
          _checkInBtnStatus = true;
          _checkOutBtnboth = true;
        });
        break;
      case ConnectivityResult.wifi:
        if (!mounted) return;
        setState(() {
          isOffline = false;
          dialogIsVisible = false;
          _checkOutBtnStatus = true;
          _checkOutBtnboth = true;
        });
        break;
      case ConnectivityResult.mobile:
        if (!mounted) return;
        setState(() {
          isOffline = true;
          dialogIsVisible = false;
          _checkInBtnStatus = true;
          _checkOutBtnboth = true;
        });
        break;
      case ConnectivityResult.none:
        if (!mounted) return;
        setState(() {
          isOffline = true;
          _checkInBtnStatus = false;
          _checkOutBtnStatus = false;
          _checkOutBtnboth = false;
        });
        //   buildAlertDialog("Internet connection cannot be established!");
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
                                style: TextStyle(fontSize: 12.0, color: Colors.red),
                              ),
                      ],
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        onPressed: () {
                          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                        },
                        child: Text(
                          "CLOSE THE APP",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
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
                        child: Text(
                          "PROCEED",
                          style: TextStyle(color: Colors.white),
                        ),
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

 /* versionCheck(context) async {
    //Get Current installed version of app
    final PackageInfo info = await PackageInfo.fromPlatform();
    double currentVersion = double.parse(info.version.trim().replaceAll(".", ""));

    //Get Latest version info from firebase config
    final RemoteConfig remoteConfig = await RemoteConfig.instance;

    try {
      // Using default duration to force fetching from remote server.
      await remoteConfig.fetch(expiration: const Duration(seconds: 0));
      await remoteConfig.activateFetched();
      remoteConfig.getString('force_update_current_version');
      double newVersion = double.parse(remoteConfig.getString('force_update_current_version').trim().replaceAll(".", ""));
      if (newVersion > currentVersion) {
        _showVersionDialog(context);
      }
    } on FetchThrottledException catch (exception) {
      // Fetch throttled.
      print(exception);
    } catch (exception) {
      print('Unable to fetch remote config. Cached or default values will be ' 'used');
    }
  }*/

  //Show Dialog to force user to update
  _showVersionDialog(context) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        String title = "New Update Available";
        String message = "There is a newer version of app available please update it now.";
        String btnLabel = "Update Now";
        String btnLabelCancel = "Later";
        return Platform.isIOS
            ? new CupertinoAlertDialog(
                title: Text(title),
                content: Text(message),
                actions: <Widget>[
                  TextButton(
                    child: Text(btnLabel),
                    onPressed: () => _launchURL(APP_STORE_URL),
                  ),
                  TextButton(
                    child: Text(btnLabelCancel),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              )
            : new AlertDialog(
                title: Text(title),
                content: Text(message),
                actions: <Widget>[
                  TextButton(
                    child: Text(btnLabel),
                    onPressed: () => _launchURL(PLAY_STORE_URL),
                  ),
                  TextButton(
                    child: Text(btnLabelCancel),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              );
      },
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Timer timer;
  int _start = 10;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
}


class ApiProvider{
  static Future<dynamic> getData({var urlEndPoint, var setApiData}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     var token = prefs.getString(GlobalConstants.token);
    try {
      String url = urlEndPoint;
      log(url);
      final response = await get(Uri.parse(url.toString()),  headers: {
        "authorization": token,
      },);
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
