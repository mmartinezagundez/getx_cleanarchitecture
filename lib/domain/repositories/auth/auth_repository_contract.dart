import 'package:dartz/dartz.dart';
import 'package:getx_cleanarchitecture/core/error/failures.dart';
import 'package:getx_cleanarchitecture/domain/entities/auth/login_request.dart';

abstract class AuthRepositoryContract {
  
  Future<Either<Failure, bool>> login(LoginRequest loginRequest);

  Future<void> logout();    
    

}