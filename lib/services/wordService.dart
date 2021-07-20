import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:engsinapp_flutter/models/user.dart';
import 'package:engsinapp_flutter/models/word.dart';
import 'package:engsinapp_flutter/route/appRouter.gr.dart';
import 'package:engsinapp_flutter/util/dio_helper.dart';
import 'package:engsinapp_flutter/util/get_dio.dart';
import 'package:engsinapp_flutter/util/oAuthSecureStorage.dart';
import 'package:engsinapp_flutter/util/oauth2Helper.dart';
import 'package:flutter/material.dart';
import 'baseService.dart';

class WordService extends BaseService {
  Dio _dio = GetDio().get();
  BuildContext context;

  OAuthSecureStorage _authSecureStorage = OAuthSecureStorage();

  WordService(this.context);

  Future<List> getDays() async {
    try {
      var response = await _dio.get('/api/v1/word/getAllDays');
      if (response.data["status"]) {
        return response.data["data"];
      }
      return [];
    } catch (e) {
      print(e);
      await onDioError(e, context);
      return [];
    }
  }

  Future<WordModel?> getWords(String dayMeta) async {
    try {
      var response = await _dio.get('/api/v1/word/getAllwords/$dayMeta');
      if (response.data["status"]) {
        WordModel wordModel = WordModel.fromJson(response.data["data"][0]);
        return wordModel;
      }
      return null;
    } catch (e) {
      print(e);
      await onDioError(e, context);
      return null;
    }
  }
}
