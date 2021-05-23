import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:getx_cleanarchitecture/core/error/failures.dart';
import 'package:getx_cleanarchitecture/core/usecase/usecase.dart';
import 'package:getx_cleanarchitecture/domain/entities/auth/login_request.dart';
import 'package:getx_cleanarchitecture/domain/repositories/auth/auth_repository_contract.dart';

class Login implements UseCase<bool, Params> {

  final AuthRepositoryContract authRepository;

  Login({required this.authRepository});

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await authRepository.login(params.loginRequest);
  }
  
}

class Params extends Equatable {
  final LoginRequest loginRequest;

  Params({
    required this.loginRequest,
  });

  @override
  List<Object> get props => [loginRequest];
}
