import 'package:get/get.dart';
import 'package:getx_cleanarchitecture/presentation/pages/controllers/all_empleados_controller.dart';

class AllEmpleadosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllEmpleadosController>(() => AllEmpleadosController());
  }
}