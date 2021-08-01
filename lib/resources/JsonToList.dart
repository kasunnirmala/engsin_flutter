import 'package:engsinapp_flutter/models/bank.dart';
import 'package:engsinapp_flutter/models/payment.dart';
import 'package:engsinapp_flutter/models/user.dart';
import 'package:engsinapp_flutter/models/word.dart';

class CreateList<T> {
  dynamic json;
  CreateList(this.json);

  List<T> getList() {
    List<T> models = [];
    if (this.json is List) {
      this.json.forEach((obj) {
        models.add(getObject(obj));
      });
    } else {
      models.add(getObject(this.json));
    }

    return models;
  }

  dynamic getObject(json) {
    if (T == UserModel().runtimeType) {
      return UserModel.fromJson(json);
    }
    if (T == BankModel().runtimeType) {
      return BankModel.fromJson(json);
    }
    if (T == WordModel().runtimeType) {
      return WordModel.fromJson(json);
    }
    if (T == PaymentModel().runtimeType) {
      return PaymentModel.fromJson(json);
    }
  }
}
