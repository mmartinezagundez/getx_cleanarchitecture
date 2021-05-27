

import 'package:dio/dio.dart';
import 'package:getx_cleanarchitecture/data/datasource/auth/auth_datasource_contract.dart';
import 'package:getx_cleanarchitecture/data/datasource/remote/sido_remote_datasource_contract.dart';
import 'package:getx_cleanarchitecture/data/models/sido/empleados/empleado_model.dart';

class SidoRemoteDataSource extends SidoRemoteDataSourceContract {
  
  /* DataSources */
  final AuthDataSourceContract authDataSource;  

  late Dio _dio;

  SidoRemoteDataSource({
    required this.authDataSource      
  }) {

    /* Dio Setup */
      this._dio = Dio(
        BaseOptions(
          connectTimeout: 30000,
          receiveTimeout: 30000,                  
          baseUrl: 'https://sidopre.tragsa.es/apidev'
        )
      );

      this._dio.interceptors.add(InterceptorsWrapper(
        onRequest:(options, handler) async{
          
          
          /* Se obtiene el token del authDataSource */
          String? token = await this.authDataSource.getToken();

          /* Se añade el token en el header */
          options.headers.addAll({ "Authorization": "Bearer $token"});

          return handler.next(options); //continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: return `dio.resolve(response)`.
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: return `dio.reject(dioError)`
        },
        onResponse:(response,handler) {
          // Do something with response data
          return handler.next(response); // continue
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: return `dio.reject(dioError)` 
        },
        onError: (DioError e, handler) {
          // Do something with response error
          return  handler.next(e);//continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: return `dio.resolve(response)`.  
        } 
      ));

  }

  @override
  Future<List<EmpleadoModel>> getAllEmpleados() async {

    List<EmpleadoModel> listaEmpleados = [];       
    var response = await _dio.get('/empleadosbasic');        
    List listaResponse = response.data as List;
    listaResponse.forEach((element) {
      try {
        listaEmpleados.add(EmpleadoModel.fromJson(element));  
      } catch (e) {
        print(e);
      }
      
    });   
        
    return listaEmpleados;

  }

}