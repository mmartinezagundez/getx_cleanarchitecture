import 'package:getx_cleanarchitecture/data/models/login_response_model.dart';

abstract class AuthDataSourceContract {    

  Future<LoginResponseModel> login(String user, String password);  

  //Future<RefreshLoginResponseModel> refreshToken();

  Future<String?> getToken();

  Future<String?> getUsuarioId();

}