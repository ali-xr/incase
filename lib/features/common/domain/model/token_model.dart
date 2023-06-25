
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel {
  @JsonKey(name: 'access', defaultValue: '')
  final String access;
  @JsonKey(name: 'refresh', defaultValue: '')
  final String refresh;
  TokenModel({required this.access, required this.refresh});

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
}