import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_cleanarchitecture/presentation/pages/controllers/login_controller.dart';

class LoginPageView extends GetView<LoginController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('LoginPageView')),

    body: SafeArea(
      child: Text('LoginContViewroller'))
    );
  }
}