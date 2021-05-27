import 'package:get/get.dart';
import 'package:getx_cleanarchitecture/presentation/pages/controllers/home_controller.dart';
import 'package:getx_cleanarchitecture/presentation/pages/controllers/login_controller.dart';

class InitialBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<HomeController>(() => HomeController());
  Get.lazyPut<LoginController>(() => LoginController());    
  }
}