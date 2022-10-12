import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'username')
  String? userName;
  String? email;
  String? password;
  String? id;
  @JsonKey(name: 'acessToken')
  String? token;
  String? phone;

  UserModel({
    this.userName,
    this.email,
    this.password,
    this.id,
    this.token,
    this.phone
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}
