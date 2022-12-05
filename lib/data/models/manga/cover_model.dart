import 'package:json_annotation/json_annotation.dart';

part 'cover_model.g.dart';

@JsonSerializable()
class CoverModel {
  String fileName;
  String createdAt;
  String updatedAt;

  CoverModel({
    required this.fileName,
    required this.createdAt,
    required this.updatedAt
  });

  factory CoverModel.fromJson(Map<String, dynamic> json) => _$CoverModelFromJson(json);
}