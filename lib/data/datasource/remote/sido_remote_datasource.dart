

import 'package:dio/dio.dart';
import 'package:getx_cleanarchitecture/core/error/exceptions.dart';
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

          /* Si no hay token se devuelve una excepción de LoginRequired */
          if (token == null) {
            return handler.reject(DioError(requestOptions: options, type: DioErrorType.other, response: null, error: LoginRequiredExcepcion()));
          }

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
        onError: (DioError error, handler) async {
          
          /* Se actúa en función del error.response?.statusCode */
          switch (error.response?.statusCode) {
            case 401:                            

              /* Antes de nada se bloquean todos los request que pudieran estar encolados por ejecución en paralelo */
              this._dio.interceptors.requestLock.lock();
              //this._dio.interceptors.responseLock.lock();

              /* Si se recibe un 401 se intenta hacer un RefreshToken */
              await authDataSource.refreshToken();

              /* Se vuelve a obtener el token */
              String? token = await this.authDataSource.getToken();

              if (token != null) {

                /* Se desblequean los request y response */
                this._dio.interceptors.requestLock.unlock();
                //this._dio.interceptors.responseLock.unlock();

                /* Si hay token, se reintenta el request con el nuevo token */
                final response = await _dio.request(
                  error.requestOptions.path,
                  queryParameters: error.requestOptions.queryParameters,
                  data: error.requestOptions.data,
                  options: Options(method: error.requestOptions.method),
                );
                return handler.resolve(response);
                

              } else {
                /* Si no hay token, se devuelve una excepción de LoginRequired */
                throw LoginRequiredExcepcion();
              }
              


              break;
            default:
          }


          return  handler.next(error);//continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: return `dio.resolve(response)`.  
        } 
      ));

  }

  @override
  Future<List<EmpleadoModel>> getAllEmpleados() async {

    List<EmpleadoModel> listaEmpleados = [];   

    try {
      var response = await _dio.get('/empleadosbasic', queryParameters: {'offset' : 0, 'pagesize' : 50});  
      List listaResponse = response.data as List;
      listaResponse.forEach((element) {
        try {
          listaEmpleados.add(EmpleadoModel.fromJson(element));  
        } catch (e) {
          print(e);
        }        
      });         
    } 
    on DioError catch (dioError) {
      
      if (dioError.error is LoginRequiredExcepcion) {
        throw LoginRequiredExcepcion();
      }

    }
    catch (e) {
      print(e);
    }              
        
    return listaEmpleados;

  }

}