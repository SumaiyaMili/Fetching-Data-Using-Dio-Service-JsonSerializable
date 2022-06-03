//its a model class for user object

import 'package:json_annotation/json_annotation.dart';

part 'singleuser.g.dart';

@JsonSerializable()
class SingleUser {
  @JsonKey(name: "id") //key must be same as the json file
  int? id; //this name can be different based on devloper choice
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "avatar")
  String? avatar;

  SingleUser(); //calling a constructor

// Factory Connect the generated [_$SingleUserFromJson] function to the `fromJson`
  factory SingleUser.fromJson(Map<String, dynamic> json) =>
      _$SingleUserFromJson(json);
  // Connect the generated [_$SingleUserToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SingleUserToJson(this);
}
