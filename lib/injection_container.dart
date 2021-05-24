
import 'package:get/get.dart';
import 'package:getx_cleanarchitecture/data/repositories/auth/auth_repository.dart';
import 'package:getx_cleanarchitecture/domain/repositories/auth/auth_repository_contract.dart';
import 'package:getx_cleanarchitecture/domain/usecases/auth/auth_login.dart';
import 'package:getx_cleanarchitecture/domain/usecases/auth/get_usuario_contexto.dart';

import 'data/datasource/auth/auth_datasource_contract.dart';
import 'data/datasource/auth/auth_datasource_sido.dart';

Future<void> init() async {
  
  /* Use Cases */
  Get.lazyPut<Login>(() => Login(authRepository: Get.find()));
  Get.lazyPut<GetUsuarioContexto>(() => GetUsuarioContexto(authRepository: Get.find()));

  /* Repositories */
  Get.lazyPut<AuthRepositoryContract>(() => AuthRepository(authDataSource: Get.find()));

  /* DataSources */
  Get.lazyPut<AuthDataSourceContract>(() => AuthDataSourceSido());

}