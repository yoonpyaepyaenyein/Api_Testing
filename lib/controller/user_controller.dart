import 'dart:convert';

import 'package:api_testing/models/users/users_list.dart';
import 'package:api_testing/services/user_api_services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../models/users/user.dart';

enum ApiStatus { initial, loading, succeed, failure }

class UserController extends GetxController {
  int pageSize = 10;
  ApiStatus fetchLoadingStatus = ApiStatus.initial;
  UsersList? userData;
  ApiStatus fetchMoreLoadingStatus = ApiStatus.initial;
  // List<User> users = [];

  // Userslis

  void getUserList() async {
    fetchLoadingStatus = ApiStatus.loading;
    update();

    try {
      http.Response response =
          await UserApiService().usersList(pageSize: pageSize.toString());
      print('response is $response');
      fetchLoadingStatus = ApiStatus.succeed;
      var result = jsonDecode(response.body);
      UsersList usersList = UsersList.fromJson(result);
      userData = usersList;
      // print('User is >>> ${userData?.results}');

      update();
    } catch (e) {
      print(e.toString());
      fetchLoadingStatus = ApiStatus.failure;
      update();
    }
  }

  Future<void> fetchMoreUserList() async {
    fetchMoreLoadingStatus = ApiStatus.loading;
    update();

    try {
      pageSize += 10;
      http.Response response =
          await UserApiService().usersList(pageSize: pageSize.toString());

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        UsersList usersList = UsersList.fromJson(result);
        userData = usersList;

        fetchMoreLoadingStatus = ApiStatus.succeed;
        update();
      }
    } catch (e) {
      print(e.toString());
      fetchMoreLoadingStatus = ApiStatus.loading;
      update();
    }
  }
}
