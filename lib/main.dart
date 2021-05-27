import 'package:animations/animations.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_cleanarchitecture/core/error/failures.dart';
import 'package:getx_cleanarchitecture/core/usecase/usecase.dart';
import 'package:getx_cleanarchitecture/domain/entities/usuario.dart';
import 'package:getx_cleanarchitecture/domain/usecases/auth/get_usuario_contexto.dart';
import 'package:getx_cleanarchitecture/domain/usecases/get_all_empleados.dart';
import 'package:getx_cleanarchitecture/presentation/pages/bindings/initial_binding.dart';
import 'package:getx_cleanarchitecture/presentation/pages/views/all_empleados_page_view.dart';
import 'package:getx_cleanarchitecture/presentation/pages/views/home_page_view.dart';
import 'package:getx_cleanarchitecture/presentation/pages/views/login_page_view.dart';
import 'package:getx_cleanarchitecture/presentation/pages/views/splashscreen_page_view.dart';
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

  // final getAllEmpleadosUseCase = Get.find<GetAllEmpleados>();
  // final empleados = await getAllEmpleadosUseCase.call(NoParams());
  // empleados.fold(
  //   (failure) => print('Error en GetAllEmpleados'), 
  //   (empleados) => null
  // );
  
  runApp (

  //   GetMaterialApp(
  //     theme: ThemeData(
  //       pageTransitionsTheme: PageTransitionsTheme(
  //         builders: {
  //           TargetPlatform.android: SharedAxisPageTransitionsBuilder(
  //             transitionType: SharedAxisTransitionType.horizontal,
  //           ),
  //           TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
  //             transitionType: SharedAxisTransitionType.horizontal,
  //           ),
  //         },
  //       ),
  //     ),
  //     routes: {
  //       '/': (BuildContext context) {
  //         return Container(
  //           color: Colors.red,
  //           child: Center(
  //             child: ElevatedButton(
  //               child: Text('Push route'),
  //               onPressed: () {
  //                 // Navigator.of(context).pushNamed('/a');
  //                 Get.toNamed('/a');
  //               },
  //             ),
  //           ),
  //         );
  //       },
  //       '/a' : (BuildContext context) {
  //         return Container(
  //           color: Colors.red,
  //           child: Center(
  //             child: ElevatedButton(
  //               child: Text('Pop route'),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ),
  //         );
  //       },
  //     },
  //   )
  // );

    GetMaterialApp(
        debugShowCheckedModeBanner: false,
        //initialRoute: Routes.HOME,
        // theme: ThemeData(
          
        //   pageTransitionsTheme: PageTransitionsTheme(            
        //     builders: {
        //       TargetPlatform.android: SharedAxisPageTransitionsBuilder(                
        //         transitionType: SharedAxisTransitionType.horizontal,
        //       ),
        //       TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
        //         transitionType: SharedAxisTransitionType.horizontal,
        //       ),
        //     },
        //   ),
        // ),
        //defaultTransition: Transition.fade,        
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
              return SplashScreenPage();
            }                                                            
          },
        )
      )
    );  
}






