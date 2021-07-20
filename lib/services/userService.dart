import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:engsinapp_flutter/models/user.dart';
import 'package:engsinapp_flutter/route/appRouter.gr.dart';
import 'package:engsinapp_flutter/util/dio_helper.dart';
import 'package:engsinapp_flutter/util/get_dio.dart';
import 'package:engsinapp_flutter/util/oAuthSecureStorage.dart';
import 'package:engsinapp_flutter/util/oauth2Helper.dart';
import 'package:flutter/material.dart';
import 'baseService.dart';

class UserService extends BaseService {
  Dio _dio = GetDio().get();
  BuildContext context;

  OAuthSecureStorage _authSecureStorage = OAuthSecureStorage();

  UserService(this.context);
  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      OAuthToken token = await DioHelper.oauth.requestTokenAndSave(
          PasswordGrant(
              username: username, password: password, scope: ['mobile']));
      if (token.status) {
        return {"status": true, "message": ""};
      } else {
        return {"status": false, "message": token.error};
      }
    } catch (e) {
      return {"status": false, "message": e.toString()};
    }
  }

  Future checkSession() async {
    OAuthToken oAuthToken = await _authSecureStorage.fetch();
    return (oAuthToken.accessToken != null) &&
        (oAuthToken.refreshToken != null);
  }

  Future<Map<String, dynamic>> register(
    String email,
    String password,
  ) async {
    try {
      var data = {
        "email": email,
        "password": password,
      };
      var response = await _dio.post('/api/open/register', data: data);

      return response.data;
    } catch (e) {
      print(e);
      return await onDioError(e, context);
    }
  }

  Future<UserModel?> getUser() async {
    try {
      var response = await _dio.get('/api/v1/user/profile');
      if (response.data["status"]) {
        UserModel user = UserModel.fromJson(response.data["data"]);
        return user;
      }
      return await onUserFetchError();
    } catch (e) {
      print(e);
      await onDioError(e, context);
      return null;
    }
  }

  Future<dynamic> onUserFetchError() async {
    await logout();
    AutoRouter.of(context).root.replace(LoadingScreenRoute());
    return null;
  }

  Future changePassword(String currPass, String newPass) async {
    try {
      var data = {
        "oldPassword": currPass,
        "newPassword": {"first": newPass, "second": newPass}
      };
      var response = await _dio.post('/api/profile/reset_password', data: data);
      return response.data;
    } catch (e) {
      print(e);
      return await onDioError(e, context);
    }
  }

  Future profileUpdate(String firstName, String lastName, String mobileNo,
      String nicNo, String drivingLicenseNo) async {
    try {
      var data = {
        "firstName": firstName,
        "lastName": lastName,
        "mobileNo": mobileNo,
        "nicNo": nicNo,
        "drivingLicenseNo": drivingLicenseNo
      };
      var response = await _dio.post('/api/profile', data: data);
      return response.data;
    } catch (e) {
      print(e);
      return await onDioError(e, context);
    }
  }
}
