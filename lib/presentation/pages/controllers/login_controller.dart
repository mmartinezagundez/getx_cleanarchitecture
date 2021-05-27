import 'package:get/get.dart';
import 'package:getx_cleanarchitecture/domain/entities/auth/login_request.dart';
import 'package:getx_cleanarchitecture/domain/usecases/auth/auth_login.dart';

class LoginController extends GetxController {

  final _loginUseCase = Get.find<Login>();

  Future<void> login() async {
    final loginResponse = await _loginUseCase.call(Params(loginRequest: LoginRequest(login: 'mmaa', password: '01052021')));
    loginResponse.fold(
      (failure) => null, 
      (isLogged) => null
    );
  }

}