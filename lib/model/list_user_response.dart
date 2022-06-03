import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable_implement/model/singleuser.dart';
part 'list_user_response.g.dart';

@JsonSerializable()
class ListUserResponse {
  //must have default constructor
  ListUserResponse();
  @JsonKey(name: "page")
  int? page;
  @JsonKey(name: "per_page")
  int? perPage;
  @JsonKey(name: "total")
  int? total;
  @JsonKey(name: "total_page")
  int? totalPage;
  @JsonKey(name: "data")
  late List<SingleUser> listUser;

  factory ListUserResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListUserResponseToJson(this);
}
