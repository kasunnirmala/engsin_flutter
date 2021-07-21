// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankModel _$BankModelFromJson(Map<String, dynamic> json) {
  return BankModel(
    accountNumber: json['accountNumber'] as String?,
    bank: json['bank'] as String?,
    branch: json['branch'] as String?,
    cardHolderName: json['cardHolderName'] as String?,
    id: json['_id'] as String?,
  );
}

Map<String, dynamic> _$BankModelToJson(BankModel instance) => <String, dynamic>{
      '_id': instance.id,
      'cardHolderName': instance.cardHolderName,
      'accountNumber': instance.accountNumber,
      'bank': instance.bank,
      'branch': instance.branch,
    };
