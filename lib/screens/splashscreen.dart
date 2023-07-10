import 'package:flutter/material.dart';
import '../ExportFile/export_file.dart';

class SplashScreen extends StatefulWidget {
  BuildContext context;
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool isLoggedIn = false;
  bool isLoading=true;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    checkLogin();
  }


  Future<bool>  checkLogin()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn =  prefs.getBool(GlobalConstants.isUserLogIn) ?? false;
    String changePassword = prefs.getString(GlobalConstants.changePassword);
    if(changePassword == "0"){
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => ChangePasswordPage()),
            (Route<dynamic> route) => false,
      );
    }else {
      if(isLoggedIn){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegistrationForm()));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]);
    context=context;
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          body:  Container(
              color: Colors.white,
              child:Center(
                child: Container(
                  child: Image.asset('assets/images/ic_launcher.png'),
                ),
              ))),
      debugShowCheckedModeBanner: false,
    );
  }
}
