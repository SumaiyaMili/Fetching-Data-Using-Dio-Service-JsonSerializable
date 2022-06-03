// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListUserResponse _$ListUserResponseFromJson(Map<String, dynamic> json) =>
    ListUserResponse()
      ..page = json['page'] as int?
      ..perPage = json['per_page'] as int?
      ..total = json['total'] as int?
      ..totalPage = json['total_page'] as int?
      ..listUser = (json['data'] as List<dynamic>)
          .map((e) => SingleUser.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ListUserResponseToJson(ListUserResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_page': instance.totalPage,
      'data': instance.listUser,
    };
