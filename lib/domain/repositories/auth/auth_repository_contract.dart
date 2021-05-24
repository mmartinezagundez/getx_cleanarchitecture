import 'package:dartz/dartz.dart';
import 'package:getx_cleanarchitecture/core/error/failures.dart';
import 'package:getx_cleanarchitecture/domain/entities/auth/login_request.dart';
import 'package:getx_cleanarchitecture/domain/entities/usuario.dart';

abstract class AuthRepositoryContract {
  
  Future<Either<Failure, bool>> login(LoginRequest loginRequest);

  Future<Either<Failure, Usuario>> getUsuarioContexto();

  Future<void> logout();    
    

}