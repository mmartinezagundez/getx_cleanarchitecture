
import 'package:get/get.dart';
import 'package:getx_cleanarchitecture/data/datasource/remote/sido_remote_datasource.dart';
import 'package:getx_cleanarchitecture/data/datasource/remote/sido_remote_datasource_contract.dart';
import 'package:getx_cleanarchitecture/data/repositories/auth/auth_repository.dart';
import 'package:getx_cleanarchitecture/data/repositories/sido_repository.dart';
import 'package:getx_cleanarchitecture/domain/repositories/auth/auth_repository_contract.dart';
import 'package:getx_cleanarchitecture/domain/repositories/sido_repository_contract.dart';
import 'package:getx_cleanarchitecture/domain/usecases/auth/auth_login.dart';
import 'package:getx_cleanarchitecture/domain/usecases/auth/get_usuario_contexto.dart';
import 'package:getx_cleanarchitecture/domain/usecases/get_all_empleados.dart';

import 'data/datasource/auth/auth_datasource_contract.dart';
import 'data/datasource/auth/auth_datasource_sido.dart';

Future<void> init() async {
  
  /* DataSources */
  Get.put<AuthDataSourceContract>(AuthDataSourceSido(), permanent: true);
  Get.put<SidoRemoteDataSourceContract>(SidoRemoteDataSource(authDataSource: Get.find()), permanent: true);

/* Repositories */
  Get.put<AuthRepositoryContract>(AuthRepository(authDataSource: Get.find()), permanent: true);
  Get.put<SidoRepositoryContract>(SidoRepository(authDataSource: Get.find(), sidoRemoteDataSource: Get.find()), permanent: true);
  
  /* Use Cases */
  Get.put<Login>(Login(authRepository: Get.find()), permanent: true);
  Get.put<GetUsuarioContexto>(GetUsuarioContexto(authRepository: Get.find()), permanent: true);
  Get.put<GetAllEmpleados>(GetAllEmpleados(sidoRepository: Get.find()), permanent: true);

  

  

}