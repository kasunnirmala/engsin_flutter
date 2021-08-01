import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:engsinapp_flutter/models/payment.dart';
import 'package:engsinapp_flutter/models/user.dart';
import 'package:engsinapp_flutter/models/word.dart';
import 'package:engsinapp_flutter/resources/JsonToList.dart';
import 'package:engsinapp_flutter/route/appRouter.gr.dart';
import 'package:engsinapp_flutter/util/dio_helper.dart';
import 'package:engsinapp_flutter/util/get_dio.dart';
import 'package:engsinapp_flutter/util/oAuthSecureStorage.dart';
import 'package:engsinapp_flutter/util/oauth2Helper.dart';
import 'package:flutter/material.dart';
import 'baseService.dart';

class BalanceService extends BaseService {
  Dio _dio = GetDio().get();
  BuildContext context;
  BalanceService(this.context);

  Future<List<PaymentModel?>> getAllMyPayments() async {
    try {
      var response = await _dio.get('/api/v1/balance/getMyPaymentRequests');
      if (response.data["status"]) {
        return CreateList<PaymentModel>(response.data["data"]).getList();
      }
      return [];
    } catch (e) {
      print(e);
      await onDioError(e, context);
      return [];
    }
  }

  Future<double> getMyBalance() async {
    try {
      var response = await _dio.get('/api/v1/balance/get/balance/details');
      if (response.data["status"]) {
        return response.data["data"]["remaining_amount"].toDouble();
      }
      return 0;
    } catch (e) {
      print(e);
      await onDioError(e, context);
      return 0;
    }
  }

  Future<Map<String, dynamic>> requestPayment(double amount) async {
    try {
      var response = await _dio
          .post('/api/v1/balance/request/payment', data: {"amount": amount});
      return response.data;
    } catch (e) {
      print(e);
      await onDioError(e, context);
      return {"status": false, "message": "Error"};
    }
  }
}
