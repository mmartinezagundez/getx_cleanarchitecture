import 'package:get/get.dart';
import 'package:getx_cleanarchitecture/core/usecase/usecase.dart';
import 'package:getx_cleanarchitecture/domain/entities/auth/login_request.dart';
import 'package:getx_cleanarchitecture/domain/usecases/auth/auth_login.dart';
import 'package:getx_cleanarchitecture/domain/usecases/auth/auth_logout.dart';

class LoginController extends GetxController {

  final _loginUseCase = Get.find<Login>();
  final _logoutUseCase = Get.find<Logout>();

  Future<void> login() async {
    final loginResponse = await _loginUseCase.call(Params(loginRequest: LoginRequest(login: 'mmaa', password: '01052021')));
    loginResponse.fold(
      (failure) => null, 
      (isLogged) => null
    );
  }

  Future<void> logout() async {
    final logoutResponse = await _logoutUseCase.call(NoParams());
    logoutResponse.fold(
      (failure) => null, 
      (isLogged) => null
    );
  }

}