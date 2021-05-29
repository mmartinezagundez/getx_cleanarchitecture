import 'package:get/get.dart';
import 'package:getx_cleanarchitecture/presentation/pages/controllers/home_controller.dart';
import 'package:getx_cleanarchitecture/presentation/pages/controllers/login_controller.dart';

class InitialBinding implements Bindings {
@override
void dependencies() {
  Get.put<HomeController>(HomeController(), permanent: true);
  Get.put<LoginController>(LoginController(), permanent: true);    
  }
}