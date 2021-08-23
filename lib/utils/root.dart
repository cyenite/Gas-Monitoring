import 'package:flutter/material.dart';
import 'package:gas_monitoring/controllers/auth_controller.dart';
import 'package:gas_monitoring/pages/home_page.dart';
import 'package:gas_monitoring/pages/signin_page.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<AuthController>(AuthController());
      },
      builder: (_) {
        if (Get.find<AuthController>().isLoggedIn.value) {
          return SignIn();
        } else {
          /// TODO: Replace this with authentication screen
          return HomePage();
        }
      },
    );
  }
}
