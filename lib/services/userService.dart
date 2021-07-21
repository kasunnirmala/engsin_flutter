import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:engsinapp_flutter/models/user.dart';
import 'package:engsinapp_flutter/route/appRouter.gr.dart';
import 'package:engsinapp_flutter/util/dio_helper.dart';
import 'package:engsinapp_flutter/util/get_dio.dart';
import 'package:engsinapp_flutter/util/oAuthSecureStorage.dart';
import 'package:engsinapp_flutter/util/oauth2Helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
    String username,
    String password,
  ) async {
    try {
      var data = {
        "username": username,
        "password": password,
      };
      var response = await _dio.post('/api/v1/open/register', data: data);

      return response.data;
    } catch (e) {
      print(e);
      return await onDioError(e, context);
    }
  }

  Future<Map<String, dynamic>> updateUser(UserModel userModel, XFile file,
      Function(int, int) onSendProgress) async {
    FormData formData = FormData.fromMap({
      'slip': (await MultipartFile.fromFile(file.path)),
      'user': jsonEncode(userModel.toJson())
    });
    try {
      var response = await _dio.post('/api/v1/user/update',
          data: formData,
          options: Options(contentType: "multipart/form-data"),
          onSendProgress: onSendProgress);
      return response.data;
    } catch (e) {
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
}
