import 'package:dartz/dartz.dart';
import 'package:getx_cleanarchitecture/core/error/failures.dart';
import 'package:getx_cleanarchitecture/core/usecase/usecase.dart';

import 'package:getx_cleanarchitecture/domain/repositories/auth/auth_repository_contract.dart';

class Logout implements UseCase<bool, NoParams> {

  final AuthRepositoryContract authRepository;

  Logout({required this.authRepository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await authRepository.logout();
  }
  
}
