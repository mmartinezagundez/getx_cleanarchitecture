import 'package:dartz/dartz.dart';
import 'package:getx_cleanarchitecture/core/error/failures.dart';
import 'package:getx_cleanarchitecture/core/usecase/usecase.dart';
import 'package:getx_cleanarchitecture/domain/entities/usuario.dart';
import 'package:getx_cleanarchitecture/domain/repositories/auth/auth_repository_contract.dart';

class GetUsuarioContexto implements UseCase<Usuario, NoParams> {

  final AuthRepositoryContract authRepository;

  GetUsuarioContexto({required this.authRepository});

  @override
  Future<Either<Failure, Usuario>> call(NoParams params) async {
    return await authRepository.getUsuarioContexto();
  }
  
}

