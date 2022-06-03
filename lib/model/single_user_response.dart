// a model for whole object
import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable_implement/model/singleuser.dart';
part 'single_user_response.g.dart';

@JsonSerializable()
class SingleUserResponse {
  SingleUserResponse();

  @JsonKey(name: "data")
  SingleUser? singleUser;
  // Factory Connect the generated [_$SingleUserFromJson] function to the `fromJson`
  factory SingleUserResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleUserResponseFromJson(json);
  // Connect the generated [_$SingleUserToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SingleUserResponseToJson(this);
}
