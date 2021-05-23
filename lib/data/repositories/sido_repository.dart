import 'package:dartz/dartz.dart';
import 'package:getx_cleanarchitecture/core/error/failures.dart';
import 'package:getx_cleanarchitecture/data/datasource/auth/auth_datasource_contract.dart';
import 'package:getx_cleanarchitecture/data/datasource/remote/sido_remote_datasource_contract.dart';
import 'package:getx_cleanarchitecture/domain/entities/usuario.dart';
import 'package:getx_cleanarchitecture/domain/repositories/sido_repository_contract.dart';

class SidoRepository extends SidoRepositoryContract {

  /* DataSources */
  final SidoRemoteDataSourceContract sidoRemoteDataSource;
  final AuthDataSourceContract authDataSourceContract;  

  SidoRepository({
    required this.sidoRemoteDataSource,
    required this.authDataSourceContract
  });

  @override
  Future<Either<Failure, Usuario>> getUsuarioContexto() {
    // TODO: implement getUsuarioContexto
    throw UnimplementedError();
    

  }
  
}