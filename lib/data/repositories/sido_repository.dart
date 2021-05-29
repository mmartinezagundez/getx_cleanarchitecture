import 'package:dartz/dartz.dart';
import 'package:getx_cleanarchitecture/core/error/exceptions.dart';
import 'package:getx_cleanarchitecture/core/error/failures.dart';
import 'package:getx_cleanarchitecture/data/datasource/auth/auth_datasource_contract.dart';
import 'package:getx_cleanarchitecture/data/datasource/remote/sido_remote_datasource_contract.dart';
import 'package:getx_cleanarchitecture/domain/entities/sido/empleados/empleado.dart';
import 'package:getx_cleanarchitecture/domain/entities/usuario.dart';
import 'package:getx_cleanarchitecture/domain/repositories/sido_repository_contract.dart';

class SidoRepository extends SidoRepositoryContract {

  /* DataSources */
  final SidoRemoteDataSourceContract sidoRemoteDataSource;
  final AuthDataSourceContract authDataSource;  

  SidoRepository({
    required this.sidoRemoteDataSource,
    required this.authDataSource
  });

  @override
  Future<Either<Failure, Usuario>> getEmpleadoContexto() {

    throw UnimplementedError();
    

  }

  @override
  Future<Either<Failure, List<Empleado>>> getAllEmpleados() async {    
    
    try {
      var empleados = await sidoRemoteDataSource.getAllEmpleados();  
      return Right(empleados);
    }
    on LoginRequiredExcepcion {
      return Left(LoginRequiredFailure(""));
    }
    catch (e) {
      return Left(Failure(""));
    }
    
  }
  
}