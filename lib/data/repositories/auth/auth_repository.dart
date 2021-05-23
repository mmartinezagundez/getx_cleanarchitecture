import 'package:dartz/dartz.dart';
import 'package:getx_cleanarchitecture/core/error/exceptions.dart';
import 'package:getx_cleanarchitecture/core/error/failures.dart';
import 'package:getx_cleanarchitecture/data/datasource/auth/auth_datasource_contract.dart';
import 'package:getx_cleanarchitecture/domain/entities/auth/login_request.dart';
import 'package:getx_cleanarchitecture/domain/repositories/auth/auth_repository_contract.dart';

class AuthRepository extends AuthRepositoryContract {

  /* DataSources */
  final AuthDataSourceContract authDataSource;

  AuthRepository({
    required this.authDataSource
  });

  @override
  Future<Either<Failure, bool>> login(LoginRequest loginRequest) async {

    try {
      
      /* Se hace el login mediante el authRemoteDataSource */
      final loginResponse = await authDataSource.login(loginRequest.login, loginRequest.password);     

      return Right(true);
    } 
    on CredentialsNotValidLoginException {
      return Right(false);
    }
    on LoginException {
      return Left(ServerFailure());
    }

  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }


  
} 