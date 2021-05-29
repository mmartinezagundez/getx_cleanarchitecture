import 'package:getx_cleanarchitecture/data/models/login_response_model.dart';

abstract class AuthDataSourceContract {    

  Future<void> login(String user, String password);  

  Future<void> refreshToken();

  Future<void> logout();

  Future<String?> getToken();

  Future<String?> getUsuarioId();

}