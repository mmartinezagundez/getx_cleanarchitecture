import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:getx_cleanarchitecture/core/error/exceptions.dart';
import 'package:getx_cleanarchitecture/data/datasource/auth/auth_datasource_contract.dart';
import 'package:getx_cleanarchitecture/data/models/login_response_model.dart';
import 'package:getx_cleanarchitecture/data/models/refresh_token_response_model.dart';



const _pref_TOKEN = "AUTH_TOKEN";
const _pref_REFRESHTOKEN = "AUTH_REFRESHTOKEN";
const _pref_USERID = "AUTH_USERID";

class AuthDataSourceSido implements AuthDataSourceContract {

  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  final _dio = Dio();

  String? _token;
  String? _refreshToken;
  String? _usuarioId;

  

  @override
  Future<void> login(String user, String password) async {
    
    /* Se hace el login en el servicio de login de Sido */
    final response = await _dio.post('https://sidopre.tragsa.es/apidev/auth/login', data: {'usuario': user, 'password': password});         

    switch (response.statusCode) {
      case 200:
        final loginResponseModel = LoginResponseModel.fromJson(user, response.data);        
        /* Si el login va bien se guarda la información del loginResponse en local con FlutterSecureStorage */
        this._token = loginResponseModel.token;
        this._refreshToken = loginResponseModel.refresToken;
        this._secureStorage.write(key: _pref_USERID, value: loginResponseModel.userId);
        this._secureStorage.write(key: _pref_TOKEN, value: loginResponseModel.token);
        this._secureStorage.write(key: _pref_REFRESHTOKEN, value: loginResponseModel.refresToken);      
        break;
      case 401:
        throw CredentialsNotValidLoginException();        
      default:
        throw LoginException();
    }
    
  }

  @override
  Future<void> refreshToken() async {
    
     /* Se hace el refreshToken en el servicio de auth de Sido */
    final token = await getToken();
    final refreshToken = await _getRefreshToken();

    if (token == null || refreshToken == null) {
      throw LoginRequiredExcepcion();
    }

    final response = await _dio.post('https://sidopre.tragsa.es/apidev/auth/refreshtoken', data: {'token': getToken(), 'refreshToken': _getRefreshToken()});         

    switch (response.statusCode) {
      case 200:
        final refreshTokenResponseModel = RefreshTokenResponseModel.fromJson(response.data);        
        /* Si el refreshToken va bien se guarda la información del refreshTokenResponseModel en local con FlutterSecureStorage */
        this._token = refreshTokenResponseModel.token;        
        this._refreshToken = refreshTokenResponseModel.refresToken;
        this._secureStorage.write(key: _pref_TOKEN, value: refreshTokenResponseModel.token);
        this._secureStorage.write(key: _pref_REFRESHTOKEN, value: refreshTokenResponseModel.refresToken);
        break;
      case 401:
        /* Si se obtiene un 401 quiere decir que no se ha podido obtener un nuevo token. En este caso se resetean del local storage los campos de AUTH. */        
        this._secureStorage.delete(key: _pref_USERID);
        this._secureStorage.delete(key: _pref_TOKEN);
        this._token = null;
        this._secureStorage.delete(key: _pref_REFRESHTOKEN);
        this._refreshToken = null;
        break;      
      default:
        throw LoginException();
    }
  }

  @override
  Future<void> logout() async {
  
    /* Se eliminan del local storage el userId, el token y el refreshToken */
    this._secureStorage.delete(key: _pref_USERID);
    this._secureStorage.delete(key: _pref_TOKEN);
    this._token = null;
    this._secureStorage.delete(key: _pref_REFRESHTOKEN);
    this._refreshToken = null;

  }

  @override
  Future<String?> getToken() async {        

    if (this._token == null) {
      this._token = await _secureStorage.read(key: _pref_TOKEN);      
    }            
    return this._token;
    
  }

  Future<String?> _getRefreshToken() async {        

    if (this._refreshToken == null) {
      this._refreshToken = await _secureStorage.read(key: _pref_REFRESHTOKEN);      
    }            
    return this._refreshToken;
    
  }

  @override
  Future<String?> getUsuarioId() async {

    if (this._usuarioId == null) {
      this._usuarioId = await _secureStorage.read(key: _pref_USERID);      
    }                
    return this._usuarioId;

  }

  

}