// import 'dart:convert' show json;
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:hpcl_app/utils/common_widgets/global_constant.dart';
// import 'package:hpcl_app/models/ForgotResponse.dart';
// import 'package:http/http.dart' as http;
// import 'LoginPage.dart';
// import '../ExportFile/export_file.dart';
//
//
// class ForgotPassword extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return ForgotPasswordScreen();
//   }
// }
//
// class ForgotPasswordScreen extends State<ForgotPassword> {
//   static String tag = 'login-page';
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   static bool isLoggedIn = false;
//   String Scheme, token;
//   static String jwt;
//   bool _showProgress = false;
//   void displayDialog(context, title, text) => showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text(title),
//           content: Text(text),
//           actions: [
//             TextButton(
//               child: Text('Dismiss!'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             )
//           ],
//         ),
//       );
//
//   Future<String> attemptForgotPassword(String username,Scheme) async {
//
//     var res = await http.post((Uri.parse(GlobalConstants.forgot_password)),
//         body: {"email":username,"schema":Scheme},
//         headers: {
//           'Accept': 'application/json',
//           'content-type':'application/x-www-form-urlencoded',
//         });
//
//     print(res.statusCode);
//     print("ForgotResponse${res.body}");
//     if(res.statusCode==200){
//      //  ForgotResponse user = ForgotResponse.fromJson(res.body);
//       Fluttertoast.showToast(
//           msg: "Link has been sent to your mail",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.grey,
//           textColor: Colors.white,
//           fontSize: 14.0);
//       Navigator.pushReplacement(
//           context,MaterialPageRoute(builder: (context) => LoginScreen()));
//     } else{
//       Fluttertoast.showToast(
//           msg: "Please Eneter valid Email",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.grey,
//           textColor: Colors.white,
//           fontSize: 14.0);
//     };
//     setState(() {
//       _showProgress = false;
//     });
//     return res.body;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         //appBar: AppBar(title: Text("Log In"),),
//         body: Center(
//       child: SingleChildScrollView(
//           child: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 SizedBox(height: 50,),
//                 Image.asset('assets/images/ic_launcher.png',height: 150,),
//                 SizedBox( height: 20,),
//                 Text("DMA PNG",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
//                 SizedBox(height: 50,),
//                 Container(
//                   margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
//                   child: TextFormField(
//                     controller: _usernameController,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Email',
//                         hintText: 'Email'),
//                   ),
//                 ),
//                 SizedBox( height: 50,),
//                 ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       elevation: 10,
//                     ),
//                     onPressed: () {
//                       btnClick(context);
//                     },
//                     child: Container(
//                       width: 150,
//                       height: 45,
//                       child: Align(
//                         child: Text("SEND", style: TextStyle(color: Colors.white),),
//                         alignment: Alignment.center,
//                       ),
//                     )),
//               ],
//             ),
//           ),
//           (_showProgress)
//               ? Container(
//                   color: Colors.white60,
//                   child: Center(
//                     child: Container(
//                       width: 60,
//                       height: 60,
//                       child: Card(
//                         elevation: 5,
//                         child: Container(
//                           padding: EdgeInsets.all(10.0),
//                           child: CircularProgressIndicator(),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               : Container()
//         ],
//       )),
//     ));
//   }
//
//   btnClick(BuildContext context) async {
//     var username = _usernameController.text;
//     // var password = _passwordController.text;
//     if (username.length == 0) {
//       _toastMsg('Enter Valid Email');
//       return;
//     }
//     /*else if(password.length==0){
//       _toastMsg('Enter Password');
//       return;
//     }*/
//     else {
//       setState(() {
//         _showProgress = true;
//       });
//       Scheme = "sonipat";
//       var jwt = await attemptForgotPassword(username, Scheme);
//     //  ForgotResponse lgd = new ForgotResponse.fromJson(json.decode(jwt));
//       //print("json Object$lgd");
//     }
//   }
//
//   _toastMsg(String msg) {
//     Fluttertoast.showToast(
//         msg: msg,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.grey,
//         textColor: Colors.white,
//         fontSize: 14.0);
//   }
// }
