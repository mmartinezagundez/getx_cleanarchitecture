import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_cleanarchitecture/core/error/failures.dart';
import 'package:getx_cleanarchitecture/core/usecase/usecase.dart';
import 'package:getx_cleanarchitecture/domain/entities/usuario.dart';
import 'package:getx_cleanarchitecture/domain/usecases/auth/get_usuario_contexto.dart';
import 'package:getx_cleanarchitecture/presentation/pages/bindings/initial_binding.dart';
import 'package:getx_cleanarchitecture/presentation/pages/views/home_page_view.dart';
import 'package:getx_cleanarchitecture/presentation/pages/views/login_page_view.dart';
import 'package:getx_cleanarchitecture/presentation/routes/app_pages.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  /* Se inicializa la injección de dependencias */
  await di.init();

  // final loginUseCase = Get.find<Login>();
  // final loginResponse = await loginUseCase.call(Params(loginRequest: LoginRequest(login: 'mmaa', password: '01052021')));
  // loginResponse.fold(
  //   (failure) => null, 
  //   (isLogged) => null
  // );
  
  runApp (
    GetMaterialApp(
        debugShowCheckedModeBanner: false,
        //initialRoute: Routes.HOME,
        //theme: appThemeData,
        defaultTransition: Transition.fade,        
        getPages: AppPages.routes,
        initialBinding: InitialBinding(),
        home: FutureBuilder(
          future: Get.find<GetUsuarioContexto>().call(NoParams()),
          builder: (BuildContext context, AsyncSnapshot<Either<Failure, Usuario>> snapshot) {
            if (snapshot.hasData) {
              return
              snapshot.data!.fold(
              (failure) => LoginPageView(), // GO TO LOGIN PAGE
              (usuarioContexto) => HomePageView() // GO TO HOME PAGE
              );  
            }
            else {
              return Text('Error al obtener el usuario de contexto.');
            }                                                            
          },
        )
      )
    );  
}






