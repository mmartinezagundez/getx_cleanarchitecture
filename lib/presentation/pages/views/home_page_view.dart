import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_cleanarchitecture/presentation/pages/controllers/home_controller.dart';

class HomePageView extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('HomePageView')),
      body: SafeArea(
        child: Obx(() => Text('${controller.counter.value}'))
      )
    );
  }
}