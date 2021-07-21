// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordModel _$WordModelFromJson(Map<String, dynamic> json) {
  return WordModel(
    words: json['words'] as List<dynamic>?,
    audio: json['audio'] as String?,
    day: json['day'] as String?,
    dayMeta: json['dayMeta'] as String?,
    id: json['_id'] as String?,
    createdAt: json['createdAt'] as String?,
    isActive: json['isActive'] as bool?,
    isDeleted: json['isDeleted'] as bool?,
    updatedAt: json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$WordModelToJson(WordModel instance) => <String, dynamic>{
      '_id': instance.id,
      'words': instance.words,
      'audio': instance.audio,
      'day': instance.day,
      'dayMeta': instance.dayMeta,
      'isDeleted': instance.isDeleted,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
