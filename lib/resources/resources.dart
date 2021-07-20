import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:engsinapp_flutter/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as fss;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constants.dart';

class Resources {
  static late UserModel userModel;
  static final StreamController<String> appbartitleStream =
      StreamController.broadcast();

  static String path = "/data/user/0/com.esol.etrafficpolice/cache";
  static Future<bool?> getErrorToast(String message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: kDangerColor,
        textColor: kNormalTextColor,
        fontSize: 12);
  }

  static Future<bool?> getSuccessToast(String message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: kSuccessColor,
        textColor: kNormalTextColor,
        fontSize: 12);
  }

  static Future requestPermission(BuildContext context) async {
    Map<Permission, PermissionStatus> permissionStatus =
        await permissions.request();
    permissionStatus.forEach((key, value) {
      if (value != PermissionStatus.granted) {
        getErrorToast(
            "${key.toString().split('.')[1]} is ${describeEnum(value)}. Cannot Proceed Further.");
        AutoRouter.of(context).root.popUntilRoot();
        // ExtendedNavigator.named("Body").popUntilRoot();
        return;
      }
    });
  }

  static Future launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      Resources.getErrorToast('Could not launch $url');
      throw 'Could not launch $url';
    }
  }
}
