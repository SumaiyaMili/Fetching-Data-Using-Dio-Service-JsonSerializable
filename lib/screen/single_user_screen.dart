//this screen will fetch data for a single user

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:json_serializable_implement/model/single_user_response.dart';

import '../dio_service.dart';
import '../model/singleuser.dart';

class SingleUserScren extends StatefulWidget {
  const SingleUserScren({Key? key}) : super(key: key);

  @override
  State<SingleUserScren> createState() => _SingleUserScrenState();
}

class _SingleUserScrenState extends State<SingleUserScren> {
//ToDo: Making a future that will be responsible for get user via http call
//for this need reference of dio service class
  late DioService dio;

  //after getting the response we need to store it ..so we will store it on single user response class er object by creating an object of that class
  late SingleUserResponse singleUserResponse;
  //for mapping the item in every element we need object of User aka SingleUser
  late SingleUser singleUser;

  //create a bool variable to show the progerss and initially make it false
  bool isLoading = false;
  Future getUser() async {
    //it will return a response onject ..so we will set the response
    Response? response;
    try {
      isLoading = true;
      response = await dio.getRequest("/api/users/2");
      isLoading = false;
      // to check if the response is ok or not we are going to check the status code
      if (response?.statusCode == 200) {
        //todo: convert the response data to single user object
        //1: create an object of single user object
        //2:another object for user
        //3:create a set state and inside it assign the object value
        setState(() {
//set value to singleUserResponse
          singleUserResponse = SingleUserResponse.fromJson(response?.data);
          singleUser = singleUserResponse.singleUser!;
        });
      } else
        print("status code is not 200");
    } on Exception catch (e) {
      isLoading = false;
      print(e);
    }
  }

  //for getting data when screen initialize put then on init function
  @override
  void initState() {
    dio = DioService();
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Single User"),
      ),
      body: Container(
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : singleUser != null
                  ? Container(
                      //if single user model is not null show the container
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.network(singleUser.avatar!),
                          Container(
                            height: 16,
                          ),
                          Text("${singleUser.firstName}"),
                          Text("${singleUser.lastName}"),
                        ],
                      ),
                    )
                  : Center(
                      child: Text("No Single User Object"),
                    )),
    );
  }
}
