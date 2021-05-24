

import 'package:get/get.dart';
import 'package:getx_cleanarchitecture/presentation/pages/bindings/home_binding.dart';
import 'package:getx_cleanarchitecture/presentation/pages/controllers/login_controller.dart';
import 'package:getx_cleanarchitecture/presentation/pages/views/home_page_view.dart';
import 'package:getx_cleanarchitecture/presentation/pages/views/login_page_view.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPageView(),
      binding: BindingsBuilder(() => Get.lazyPut<LoginController>(() => LoginController())),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePageView(),
      binding: HomeBinding()
    ),
    // GetPage(
    //   name: Routes.LOADING,
    //   page: () => LoadingView(),
    //   //binding: LoadingBinding(),
    // ),
  ];
}
