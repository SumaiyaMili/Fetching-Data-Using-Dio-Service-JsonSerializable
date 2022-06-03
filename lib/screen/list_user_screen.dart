import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:json_serializable_implement/model/list_user_response.dart';
import 'package:json_serializable_implement/model/singleuser.dart';

import '../dio_service.dart';

class ListUserScreen extends StatefulWidget {
  const ListUserScreen({Key? key}) : super(key: key);

  @override
  State<ListUserScreen> createState() => _ListUserScreenState();
}

class _ListUserScreenState extends State<ListUserScreen> {
  bool isLoading = false;
  late DioService dio;
  late ListUserResponse listUserResponse;
  late List<SingleUser> listUser;
  Future getListUser() async {
    Response? response;
    try {
      isLoading = true;
      response = await dio.getRequest("/api/users?page=2");
      isLoading = false;
      if (response?.statusCode == 200) {
        setState(() {
          listUserResponse = ListUserResponse.fromJson(response?.data);
          listUser = listUserResponse.listUser;
        });
      } else
        print("status code is not 200");
    } on Exception catch (e) {
      isLoading = false;
      print(e);
    }
  }

  @override
  void initState() {
    dio = DioService();
    getListUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get List Of User"),
      ),
      body: Container(
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : listUser != null
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      final userdata = listUser[index];
                      return ListTile(
                        title: Text(userdata.firstName!),
                        leading: Image.network(userdata.avatar!),
                        subtitle: Text(userdata.email!),
                      );
                    },
                    itemCount: listUser.length,
                  )
                : Center(
                    child: Text("No Single User Object"),
                  ),
      ),
    );
  }
}
