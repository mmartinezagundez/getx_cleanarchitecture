import 'package:get/get.dart';

class HomeController extends GetxController {
  
  var counter = 1.obs;

  void incrementCounter() {
    counter.value++;
  }

}