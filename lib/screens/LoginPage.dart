import 'package:flutter/material.dart';
import 'package:hpcl_app/utils/common_widgets/button_widget.dart';
import 'package:hpcl_app/utils/common_widgets/custom_app_bar.dart';
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
  static bool isLoggedIn = false;
  static String jwt;
  bool _showProgress = false;

  bool _obscureText = true;
  void _togglePasswordStatus() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
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
    final data = {"email": username, "password": password, "device": deviceId};
    final jsonString = json.encode(data);
    var res =
        await http.post((Uri.parse(GlobalConstants.Login)), body: jsonString);

    setState(() {
      _showProgress = false;
    });
    return res.body;
  }

  bool passwordVisible = false;

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
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(
              titleAppBar: "Login",
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
                child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Image.asset(
                        'assets/images/pbg_logo.png',
                        height: 150,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "DMA PNG",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      _textField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: [AutofillHints.email],
                        controller: _usernameController,
                        hintText: "Enter Your Username",
                        labelText: "Enter Your Username",
                        prefix: Icon(Icons.email, color: Colors.green.shade800),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _textField(
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        autofillHints: [AutofillHints.password],
                        controller: _passwordController,
                        hintText: "Enter Your Password",
                        labelText: "Enter Your Password",
                        obscureText: _obscureText,
                        prefix: Icon(
                          Icons.lock,
                          color: Colors.green.shade800,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: _togglePasswordStatus,
                          color: Colors.green.shade800,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ButtonWidget(
                        textButton: "LOG IN",
                        onPressed: () {
                          TextInput.finishAutofillContext();
                          btnClick(context);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                (_showProgress)
                    ? Container(
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
                      )
                    : Container()
              ],
            )),
          )),
    );
  }

  Widget _textField({
    TextInputType keyboardType,
    TextInputAction textInputAction,
    Iterable<String> autofillHints,
    Widget suffixIcon,
    TextEditingController controller,
    bool obscureText,
    Widget prefix,
    String labelText,
    String hintText,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        prefixIcon: prefix,
        suffixIcon: suffixIcon,
        isDense: false,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: OutlineInputBorder(),
        labelText: labelText,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(width: 1, color: Colors.green.shade800),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(width: 1, color: Colors.green.shade800),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(width: 1, color: Colors.green.shade800),
        ),
      ),
    );
  }

  btnClick(BuildContext context) async {
    var username = _usernameController.text;
    var password = _passwordController.text;

    if (username.length == 0) {
      CustomToast.showToast('Enter User Name');
      return;
    } else if (password.length == 0) {
      CustomToast.showToast('Enter Password');
      return;
    } else {
      setState(() {
        _showProgress = true;
      });

      var jwt = await attemptLogIn(username, password);
      try {
        LoginDetails lgd = new LoginDetails.fromJson(json.decode(jwt));
        print("Login API---> $jwt");
        print("Login role--->" + lgd.user.role);
        if ((lgd.status == 200) && (lgd.user.role == 'dma')) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool(GlobalConstants.isUserLogIn, true);
          prefs.setString(GlobalConstants.username, username);
          prefs.setString(GlobalConstants.password, password);
          prefs.setString(GlobalConstants.id, lgd.user.id);
          prefs.setString(GlobalConstants.token, lgd.token);
          prefs.setString(GlobalConstants.schema, lgd.user.schema);
          prefs.setString(GlobalConstants.name, lgd.user.name);
          prefs.setString(GlobalConstants.changePassword, lgd.user.pwdChanged);
          CustomToast.showToast(lgd.messages);
          /* if(lgd.user.pwdChanged == "0"){
           Navigator.pushAndRemoveUntil(
             context,
             MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                 (Route<dynamic> route) => false,
           );
         }else{*/
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => RegistrationForm()),
            (Route<dynamic> route) => false,
          );
          // }
        } else if (lgd.status == 401) {
          CustomToast.showToast('Incorrect Username and Password');
        } else {
          CustomToast.showToast('Incorrect Username and Password');
        }
      } catch (e) {
        LoginError lgd = new LoginError.fromJson(json.decode(jwt));
        if (lgd.status == 401)
          displayDialog(context, 'Unauthorised',
              "No account was found matching that username and password");
      }
    }
  }
}
