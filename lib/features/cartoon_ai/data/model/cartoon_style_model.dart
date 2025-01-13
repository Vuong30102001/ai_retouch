import 'package:json_annotation/json_annotation.dart';

part 'cartoon_style_model.g.dart';

@JsonSerializable()
class CartoonStyleModel{
  final String uuid;
  final String name;

  CartoonStyleModel({required this.uuid, required this.name});

  factory CartoonStyleModel.fromJson(Map<String, dynamic> json) => _$CartoonStyleModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartoonStyleModelToJson(this);
}