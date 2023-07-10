import 'package:flutter/material.dart';

Color primaryColor = const Color.fromRGBO(21, 29, 86, 1);
Color accentColor = const Color.fromRGBO(19, 173, 244, 1);
Color greyColor = const Color.fromRGBO(131, 146, 165, 1);
Color brightGreyColor = const Color.fromRGBO(241, 243, 249, 1);
Color orangeColor = const Color.fromRGBO(243, 120, 53, 1);
Color yellowColor = const Color.fromRGBO(255, 255, 127, 1);
Color bgColor = const Color.fromRGBO(227, 220, 207, 1);
Color brightGreen = const Color(0xffF0FDF3);
Color brightOrange = const Color(0xffFDF9F0);
Color redColor = const Color(0xffCD1D1D);
Color greenColor = const Color(0xff34C759);

Color darkPrimaryColor = Color.fromRGBO(198, 153, 10, 1);
Color whiteColor = Colors.white;
Color blackColor = Colors.black;
Color cementGrey = Color.fromRGBO(85, 85, 85, 1);
Color lightMustard = Color.fromRGBO(255, 247, 125, 1);
Color lightGreyColor = Colors.grey.withOpacity(0.3);
Color lightButtongrey = Color.fromRGBO(214, 216, 234, 1);
Color whitegrey = Color.fromRGBO(234, 235, 245, 1);
Color barinactive = Color.fromRGBO(214, 238, 249, 1);
Color calenderColor = Color.fromRGBO(249, 250, 252, 1);

double fixPadding = 10.0;

SizedBox heightSpace = SizedBox(height: 10.0);
SizedBox widthSpace = SizedBox(width: 10.0);

const kGoogleApiKey = "AIzaSyCl4k5NKvXVvyDVimQUO2KzHMMzjZIAAFc";
const API_URL = "http://qladder-dev.calidig.com/api/";
// const API_URL = "https://qladder-test.calidig.com/api/";
// const API_URL = "http://qladder.calidig.com/api/";
const providerData = "providerData";
const accessToken = "token";
const organization = "organization";
const individual = "individual";
const userData = "userData";
//subscriptions

/*#000000*/
TextStyle bottomBarItemStyle = TextStyle(
  color: greyColor,
  fontSize: 12.0,
  fontWeight: FontWeight.w500,
);

TextStyle bigHeadingStyle = TextStyle(
  fontSize: 22.0,
  color: blackColor,
  fontWeight: FontWeight.w600,
);

TextStyle centerHeadingStyle = TextStyle(
  fontSize: 36.0,
  color: blackColor,
  fontWeight: FontWeight.w600,
);

TextStyle whiteheadingStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.white,
  fontWeight: FontWeight.w300,
);
TextStyle unselectedHeadingStyle = TextStyle(
  fontSize: 16.0,
  color: blackColor,
  fontWeight: FontWeight.w500,
);
TextStyle greyHeadingStyle = TextStyle(
  fontSize: 16.0,
  color: greyColor,
  fontWeight: FontWeight.w200,
);
TextStyle blueTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.blue,
  fontWeight: FontWeight.w600,
);

TextStyle whiteHeadingStyle = TextStyle(
  fontSize: 22.0,
  color: whiteColor,
  fontWeight: FontWeight.w500,
);

TextStyle whiteSubHeadingStyle = TextStyle(
  fontSize: 14.0,
  color: whiteColor,
  fontWeight: FontWeight.normal,
);

TextStyle wbuttonWhiteTextStyle = TextStyle(
  fontSize: 16.0,
  color: whiteColor,
  fontWeight: FontWeight.w500,
);

TextStyle buttonBlackTextStyle = TextStyle(
  fontSize: 18.0,
  color: blackColor,
  fontWeight: FontWeight.w200,
);

TextStyle moreStyle = TextStyle(
  fontSize: 14.0,
  color: primaryColor,
  fontWeight: FontWeight.w500,
);

TextStyle priceStyle = TextStyle(
  fontSize: 18.0,
  color: primaryColor,
  fontWeight: FontWeight.bold,
);

TextStyle lightGreyStyle = TextStyle(
  fontSize: 15.0,
  color: Colors.black87,
  fontWeight: FontWeight.bold,
);

// List Item Style Start
TextStyle listItemTitleStyle = TextStyle(
  fontSize: 15.0,
  color: blackColor,
  fontWeight: FontWeight.w200,
);
TextStyle listItemSubTitleStyle = TextStyle(
  fontSize: 14.0,
  color: greyColor,
  fontWeight: FontWeight.normal,
);
TextStyle ItemSubTitleStyle = TextStyle(
  fontSize: 14.0,
  color: Colors.blue,
  fontWeight: FontWeight.normal,
);

// List Item Style End
// AppBar Style Start
TextStyle appbarHeadingStyle = TextStyle(
  color: blackColor,
  fontSize: 14.0,
  fontWeight: FontWeight.w800,
);
TextStyle appbarSubHeadingStyle = TextStyle(
  color: whiteColor,
  fontSize: 13.0,
  fontWeight: FontWeight.w500,
);
// AppBar Style End

// Search text style start
TextStyle searchTextStyle = TextStyle(
  color: whiteColor.withOpacity(0.6),
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
);
TextStyle headingStyle = TextStyle(
  color: blackColor.withOpacity(0.6),
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
);
