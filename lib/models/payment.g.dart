// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) {
  return PaymentModel(
    amount: (json['amount'] as num?)?.toDouble(),
    createdAt: json['createdAt'] as String?,
    paidStatus: json['paidStatus'] as bool,
    requestedBy: json['requestedBy'] == null
        ? null
        : UserModel.fromJson(json['requestedBy'] as Map<String, dynamic>),
    updatedAt: json['updatedAt'] as String?,
    id: json['_id'] as String?,
  );
}

Map<String, dynamic> _$PaymentModelToJson(PaymentModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'amount': instance.amount,
      'paidStatus': instance.paidStatus,
      'requestedBy': instance.requestedBy,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
