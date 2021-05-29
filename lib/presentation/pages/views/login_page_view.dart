import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_cleanarchitecture/presentation/pages/controllers/login_controller.dart';
import 'package:getx_cleanarchitecture/presentation/routes/app_pages.dart';

class LoginPageView extends GetView<LoginController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('LoginPageView')),

    body: SafeArea(
      child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text('Login'),
            onPressed: () {
              controller.login();
              Get.toNamed(Routes.HOME);
            },
          ),
          ElevatedButton(
            child: Text('Logout'),
            onPressed: () {
              controller.logout();
            },
          ),
        ],
      ))
    )
    );
  }
}