import 'package:get/get.dart';
import 'package:getx_cleanarchitecture/presentation/pages/controllers/home_controller.dart';

class HomeBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<HomeController>(() => HomeController());
  }
}