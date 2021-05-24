import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:getx_cleanarchitecture/core/error/exceptions.dart';
import 'package:getx_cleanarchitecture/data/datasource/auth/auth_datasource_contract.dart';
import 'package:getx_cleanarchitecture/data/models/login_response_model.dart';



const _pref_TOKEN = "AUTH_TOKEN";
const _pref_USERID = "AUTH_USERID";

class AuthDataSourceSido implements AuthDataSourceContract {

  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  final _dio = Dio();

  String? _token;
  String? _usuarioId;

  

  @override
  Future<LoginResponseModel> login(String user, String password) async {
    
    /* Se hace el login en el servicio de login de Sido */
    final response = await _dio.post('https://sidopre.tragsa.es/apidev/auth/login', data: {'usuario': user, 'password': password});         

    switch (response.statusCode) {
      case 200:
        final loginResponseModel = LoginResponseModel.fromJson(user, response.data);
        
        /* Si el login va bien se guarda la información del loginResponse en local con FlutterSecureStorage */
        this._token = loginResponseModel.token;
        this._secureStorage.write(key: _pref_USERID, value: loginResponseModel.userId);
        this._secureStorage.write(key: _pref_TOKEN, value: loginResponseModel.token);
        
        this.getToken();

        return loginResponseModel;

      case 401:
        throw CredentialsNotValidLoginException();        
      default:
        throw LoginException();
    }
    
  }

  @override
  Future<String?> getToken() async {        

    if (this._token == null) {
      this._token = await _secureStorage.read(key: _pref_TOKEN);      
    }
        
    print('TOKEN: ${this._token}');
    return this._token;
    
  }

  @override
  Future<String?> getUsuarioId() async {

   if (this._usuarioId == null) {
      this._usuarioId = await _secureStorage.read(key: _pref_USERID);      
    }
                
    return this._usuarioId;

  }

}