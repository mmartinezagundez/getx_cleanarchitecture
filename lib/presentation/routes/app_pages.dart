

import 'package:get/get.dart';
import 'package:getx_cleanarchitecture/presentation/pages/bindings/all_empleados_binding.dart';
import 'package:getx_cleanarchitecture/presentation/pages/views/all_empleados_page_view.dart';
import 'package:getx_cleanarchitecture/presentation/pages/views/home_page_view.dart';
import 'package:getx_cleanarchitecture/presentation/pages/views/login_page_view.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPageView(),      
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePageView(),    
    ),
    GetPage(
      name: Routes.ALLEMPLEADOS,
      page: () => AllEmpleadosPageView(),
      binding: AllEmpleadosBinding(),
      transition: Transition.cupertino
    ),
  ];
}
