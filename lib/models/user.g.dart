// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    createdAt: json['createdAt'] as String?,
    email: json['email'] as String?,
    id: json['id'] as int?,
    isActive: json['isActive'] as bool,
    isDeleted: json['isDeleted'] as bool,
    isDetailsAdded: json['isDetailsAdded'] as bool,
    updatedAt: json['updatedAt'] as String?,
    promoCode: json['promoCode'] as String?,
    address: json['address'] as String?,
    username: json['username'] as String?,
    bankModel: json['bankModel'] == null
        ? null
        : BankModel.fromJson(json['bankModel'] as Map<String, dynamic>),
    mobileNumber: json['mobileNumber'] as String?,
    name: json['name'] as String?,
    nic: json['nic'] as String?,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'username': instance.username,
      'nic': instance.nic,
      'mobileNumber': instance.mobileNumber,
      'address': instance.address,
      'promoCode': instance.promoCode,
      'bankModel': instance.bankModel,
      'isActive': instance.isActive,
      'isDeleted': instance.isDeleted,
      'isDetailsAdded': instance.isDetailsAdded,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
