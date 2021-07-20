import 'package:json_annotation/json_annotation.dart';

part 'word.g.dart';

@JsonSerializable()
class WordModel {
  WordModel(
      {this.words,
      this.audio,
      this.day,
      this.dayMeta,
      this.id,
      this.createdAt,
      this.isActive,
      this.isDeleted,
      this.updatedAt});
  String? id;
  List? words;
  String? audio;
  String? day;
  String? dayMeta;
  bool? isDeleted;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  factory WordModel.fromJson(Map<String, dynamic> json) =>
      _$WordModelFromJson(json);
  Map<String, dynamic> toJson() => _$WordModelToJson(this);
}
