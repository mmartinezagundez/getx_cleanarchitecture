import 'package:get/get.dart';
import 'package:getx_cleanarchitecture/core/usecase/usecase.dart';
import 'package:getx_cleanarchitecture/domain/entities/sido/empleados/empleado.dart';
import 'package:getx_cleanarchitecture/domain/usecases/get_all_empleados.dart';
import 'package:getx_cleanarchitecture/presentation/routes/app_pages.dart';

class AllEmpleadosController extends GetxController {

  final _getAllEmpleadosUseCase = Get.find<GetAllEmpleados>();
  

  var empleados = <Empleado>[].obs;
  var getEmpleadosIsBusy = false.obs;

  @override
  Future<void> onInit() async {

    getEmpleadosIsBusy.value = true;
    final empleadosResponse = await _getAllEmpleadosUseCase.call(NoParams());
    empleadosResponse.fold(
      (failure) => Get.toNamed(Routes.LOGIN), 
      (empleadosGet) {
        empleados.value = empleadosGet;
        getEmpleadosIsBusy.value = false;
      } 
    );

    super.onInit();
  }

}