import 'package:dio/dio.dart';
import 'package:engsinapp_flutter/util/oAuthSecureStorage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class BaseService {
  OAuthSecureStorage _authSecureStorage = OAuthSecureStorage();
  Future<Map<String, Object>> onDioError(
      dynamic error, BuildContext context) async {
    EasyLoading.dismiss();
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.cancel:
          return {
            "status": false,
            "message": "Request is cancelled",
          };
        case DioErrorType.connectTimeout:
          return {
            "status": false,
            "message": "Connection Timeout",
          };
        case DioErrorType.sendTimeout:
          return {
            "status": false,
            "message": "Sending Timeout",
          };

        case DioErrorType.receiveTimeout:
          return {
            "status": false,
            "message": "Receiving Timeout",
          };
        case DioErrorType.response:
          {
            switch (error.response!.statusCode) {
              case 401:
                {
                  await logout();
                  // ExtendedNavigator.named('Base').replace(Routes.loading);
                  return {
                    "status": false,
                    "message":
                        "Can't authenticate. Please retry or check app updates.",
                  };
                }
              case 403:
                {
                  await logout();
                  // ExtendedNavigator.named('Base').replace(Routes.loading);
                  return {
                    "status": false,
                    "message":
                        "Can't authenticate. Please retry or check app updates.",
                  };
                }

              case 400:
                await logout();
                // ExtendedNavigator.named('Base').replace(Routes.loading);
                return error.response!.data["hint"] == null
                    ? error.response!.data.toString()
                    : error.response!.data["hint"] == ""
                        ? "Username and Password mismatch."
                        : error.response!.data["hint"];

              case 500:
                return {
                  "status": false,
                  "message":
                      "You have encountered a server error. Please contact Us."
                };

              default:
                return {
                  "status": false,
                  "message": "Please check your connectivity."
                  // "message": error.response.data.toString(),
                };
            }
          }

        case DioErrorType.other:
          return {
            "status": false,
            "message": "Please check your connectivity."
          };
        default:
          return {
            "status": false,
            "message": "Please check your connectivity."
            // "message": error.message,
          };
      }
    } else {
      return {
        "status": false,
        "message": error.toString()
        // "message": error.message,
      };
    }
  }

  Future<bool> logout() async {
    try {
      await _authSecureStorage.clear();
      return true;
    } catch (e) {
      return false;
    }
  }
}
