import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../ExportFile/export_file.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPage();
  }
}
class LoginPage extends State<LoginScreen> {
  static String tag = 'login-page';
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  static bool isLoggedIn=false ;
  static String jwt;
  bool _showProgress = false;

  bool _isError=true;

  void displayDialog(context, title, text) => showDialog(
      context: context,
      builder: (context) =>AlertDialog(
          title: Text(title),
          content: Text(text),
          actions: [
            TextButton(
              child: Text('Dismiss!'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
    );

  getUniqueDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // unique ID on Android
    }
    return null;
  }

  Future<String> attemptLogIn(String username, String password) async {
    var deviceId = await getUniqueDeviceId();
   final data ={"email": username,"password": password, "device": deviceId};
   final jsonString = json.encode(data);
    var res = await http.post( (Uri.parse(GlobalConstants.Login)),
      body: jsonString
    );

   setState(() {
     _showProgress=false;
   });
   return res.body;
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
          title: Text('Warning'),
          content: Text('Do you really want to exit'),
          actions: [
            TextButton(
              child: Text('Yes'),
              onPressed: () => Navigator.pop(c, true),
            ),
            TextButton(
              child: Text('No'),
              onPressed: () => Navigator.pop(c, false),
            ),
          ],
        ),
      ),
      child: Scaffold(
        //appBar: AppBar(title: Text("Log In"),),
        body:Center(
          child: SingleChildScrollView(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 50,),
                        Image.asset('assets/images/ic_launcher.png',height: 150,),
                        SizedBox(height: 20,),
                        Text("DMA PNG",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        SizedBox(height: 50,),
                        Container(
                          margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                          child: TextFormField(
                            autofillHints: [AutofillHints.username],
                            controller: _usernameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Username',hintText:'Username'
                            ),
                          ),),
                        SizedBox(height: 20,),
                        Container(
                          margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                          child: TextFormField(
                            autofillHints: [AutofillHints.password],
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                               // suffix: Icon(Icons.panorama_fish_eye_sharp),
                                labelText: 'Password',hintText: 'Password'
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 10,
                            ),
                            onPressed: () {
                              TextInput.finishAutofillContext();
                              btnClick(context);
                              },
                            child: Container(width:150,height:45,child: Align(child: Text("LOG IN",style: TextStyle(color: Colors.white),),alignment: Alignment.center,),)
                        ),
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                  (_showProgress)?Container(
                    color: Colors.white60,
                    child: Center(
                      child: Container(
                        width: 60,
                        height: 60,
                        child: Card(
                          elevation: 5,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ),
                  ):Container()
                ],
              )
          ),
        )
      ),
    );
  }


  btnClick(BuildContext context) async{
    var username = _usernameController.text;
    var password = _passwordController.text;

    if(username.length==0){
      _toastMsg('Enter User Name');
      return;
    }else if(password.length==0){
      _toastMsg('Enter Password');
      return;
    }else{
      setState(() {
        _showProgress=true;
      });

      var jwt = await attemptLogIn(username, password);
      try{
        LoginDetails lgd = new LoginDetails.fromJson(json.decode(jwt));
        print("Login API---> $jwt");
        print("Login role--->" +lgd.user.role);
        if((lgd.status == 200) &&(lgd.user.role=='dma')){
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool(GlobalConstants.isUserLogIn, true);
          prefs.setString(GlobalConstants.username, username);
          prefs.setString(GlobalConstants.password, password);
          prefs.setString(GlobalConstants.id,   lgd.user.id);
          prefs.setString(GlobalConstants.token, lgd.token);
          prefs.setString(GlobalConstants.schema, lgd.user.schema);
          prefs.setString(GlobalConstants.name, lgd.user.name);
          prefs.setString(GlobalConstants.changePassword, lgd.user.pwdChanged);
         _toastMsg(lgd.messages);
         if(lgd.user.pwdChanged == "0"){
           Navigator.pushAndRemoveUntil(
             context,
             MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                 (Route<dynamic> route) => false,
           );
         }else{
           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => RegistrationForm()), (Route<dynamic> route) => false,);
         }
        }else if(lgd.status == 401) {
          _toastMsg('Incorrect Username and Password');
        }else{
          _toastMsg('Incorrect Username and Password');
        }
      }catch(e){
        LoginError lgd = new LoginError.fromJson(json.decode(jwt));
        if(lgd.status==401)
          displayDialog(context, 'Unauthorised', "No account was found matching that username and password");
      }

    }

  }

  _toastMsg(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 14.0
    );
  }
}
