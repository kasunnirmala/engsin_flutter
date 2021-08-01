import 'package:engsinapp_flutter/models/bank.dart';
import 'package:engsinapp_flutter/models/district.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel {
  UserModel(
      {this.createdAt,
      this.email,
      this.id,
      this.isActive = false,
      this.isDeleted = false,
      this.isDetailsAdded = false,
      this.updatedAt,
      this.promoCode,
      this.generatedPromo,
      this.district,
      this.referal,
      this.address,
      this.username,
      this.bankModel,
      this.mobileNumber,
      this.name,
      this.nic,
      this.slipURL});
  @JsonKey(name: '_id')
  String? id;
  String? email;
  String? name;
  String? username;
  String? nic;
  String? mobileNumber;
  String? address;
  String? promoCode;
  String? generatedPromo;
  DistrictModel? district;
  UserModel? referal;
  BankModel? bankModel;
  bool isActive;
  bool isDeleted;
  bool isDetailsAdded;
  String? createdAt;
  String? updatedAt;
  String? slipURL;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
