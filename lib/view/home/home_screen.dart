import 'package:api_testing/controller/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:lottie/lottie.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<UserController>(
          builder: (UserController userController) {
            return Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      userController.getUserList();
                    },
                    child: const Text('Click Me'),
                  ),
                  userController.fetchLoadingStatus != ApiStatus.loading
                      ? NotificationListener<ScrollEndNotification>(
                          onNotification: (scrollInfo) {
                            if (scrollInfo.metrics.pixels ==
                                scrollInfo.metrics.maxScrollExtent) {
                              userController.fetchMoreUserList();
                            }
                            return true;
                          },
                          child: _userListView(userController),
                        )
                      : Center(
                          child: Lottie.asset(
                            'assets/icons/loading.json',
                          ),
                        ),
                  userController.fetchMoreLoadingStatus == ApiStatus.loading
                      ? const CupertinoActivityIndicator()
                      : const SizedBox.shrink()
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _userListView(UserController userController) {
    return Expanded(
      child: ListView.builder(
          itemCount: userController.userData?.results?.length,
          itemBuilder: (BuildContext context, int index) {
            final individualUserData = userController.userData?.results?[index];
            return Container(
              width: 70.w,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.w),
              child: Card(
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 3.w, horizontal: 3.w),
                      child: Column(
                        children: [
                          Text(
                              'Name - ${individualUserData?.name?.first ?? 'hello'}'),
                          Text(
                              'Gender - ${individualUserData?.gender ?? 'hello'}'),
                          SizedBox(
                            height: 2.w,
                          ),
                          ClipOval(
                            child: CachedNetworkImage(
                              width: 15.w,
                              height: 15.w,
                              imageUrl:
                                  individualUserData?.picture?.large ?? '',
                              placeholder: (context, url) =>
                                  const CupertinoActivityIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          )
                        ],
                      ))),
            );
          }),
    );
  }
}
