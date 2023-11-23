import 'package:api_testing/controller/user_controller.dart';
import 'package:api_testing/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    return ResponsiveSizer(builder: (_, __, ___) {
      return const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test',
        home: HomeScreen(),
        defaultTransition: Transition.fadeIn,
      );
    });
  }
}
