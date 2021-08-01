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

class OpenService extends BaseService {
  Dio _dio = GetDio().get();
  BuildContext context;

  OpenService(this.context);

  Future<List> getDistricts() async {
    try {
      var response = await _dio.get('/api/v1/open/districts/getAll');
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

  Future<bool> checkPromo(String promo) async {
    try {
      var response = await _dio.get('/api/v1/open/checkPromo/$promo');
      return response.data;
    } catch (e) {
      print(e);
      await onDioError(e, context);
      return false;
    }
  }
}
