import 'package:json_annotation/json_annotation.dart';

part 'district.g.dart';

@JsonSerializable()
class DistrictModel {
  DistrictModel({this.district, this.district_meta, this.id});
  @JsonKey(name: '_id')
  String? id;
  String? district;
  String? district_meta;

  factory DistrictModel.fromJson(Map<String, dynamic> json) =>
      _$DistrictModelFromJson(json);
  Map<String, dynamic> toJson() => _$DistrictModelToJson(this);
}
