import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

const String BASE_URL = "http://94.130.114.234:1234";
// const String BASE_URL = "http://192.168.8.100:1234";
const String APPCAST_URL = BASE_URL + "/android.xml";

const ACCESS_TOKEN_KEY = 'accessToken';
const REFRESH_TOKEN_KEY = 'refreshToken';
const ACCESS_TOKEN_EXPIRE_AT = 'accessTokenExpireAt';

const String APP_NAME = "EngSinApp";
const kNormalTextColor = Colors.white;
const kBlackColor = Colors.black;
const kDangerColor = Colors.redAccent;
final kSecondaryColor = Colors.tealAccent[700];
const kSuccessColor = Colors.greenAccent;
const kMainBGColor = Colors.white;
const kPrimaryColor = Colors.teal;
const kPrimaryLightColor = Color(0xFFF1E6FF);

const TextStyle kH1HeaderStyle = TextStyle(
  color: kBlackColor,
  fontSize: 35,
  fontWeight: FontWeight.bold,
);

const TextStyle kH2HeaderStyle = TextStyle(
  color: kBlackColor,
  fontSize: 30,
  fontWeight: FontWeight.bold,
);
const TextStyle kH3HeaderStyle = TextStyle(
  color: kBlackColor,
  fontSize: 25,
  fontWeight: FontWeight.bold,
);
const TextStyle kPendingStyle = TextStyle(
  color: kPrimaryColor,
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

const TextStyle kH4HeaderStyle = TextStyle(
  color: kBlackColor,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const TextStyle kNormalBoldStyle = TextStyle(
  color: kBlackColor,
  fontSize: 15,
  fontWeight: FontWeight.bold,
);
const TextStyle kNormalStyle = TextStyle(
  color: kBlackColor,
  fontSize: 15,
);

const List<Permission> permissions = [Permission.storage];
