// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistrictModel _$DistrictModelFromJson(Map<String, dynamic> json) {
  return DistrictModel(
    district: json['district'] as String?,
    district_meta: json['district_meta'] as String?,
    id: json['_id'] as String?,
  );
}

Map<String, dynamic> _$DistrictModelToJson(DistrictModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'district': instance.district,
      'district_meta': instance.district_meta,
    };
