import 'package:engsinapp_flutter/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';

@JsonSerializable()
class PaymentModel {
  PaymentModel(
      {this.amount,
      this.createdAt,
      this.paidStatus = false,
      this.requestedBy,
      this.updatedAt,
      this.id});
  @JsonKey(name: '_id')
  String? id;
  double? amount;
  bool paidStatus;
  UserModel? requestedBy;
  String? createdAt;
  String? updatedAt;

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);
}
