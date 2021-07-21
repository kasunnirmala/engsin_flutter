import 'package:json_annotation/json_annotation.dart';

part 'bank.g.dart';

@JsonSerializable()
class BankModel {
  BankModel(
      {this.accountNumber,
      this.bank,
      this.branch,
      this.cardHolderName,
      this.id});
  @JsonKey(name: '_id')
  String? id;
  String? cardHolderName;
  String? accountNumber;
  String? bank;
  String? branch;

  factory BankModel.fromJson(Map<String, dynamic> json) =>
      _$BankModelFromJson(json);
  Map<String, dynamic> toJson() => _$BankModelToJson(this);
}
