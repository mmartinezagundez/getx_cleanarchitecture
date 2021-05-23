import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:getx_cleanarchitecture/core/error/failures.dart';
import 'package:getx_cleanarchitecture/core/usecase/usecase.dart';
import 'package:getx_cleanarchitecture/domain/entities/usuario.dart';
import 'package:getx_cleanarchitecture/domain/repositories/sido_repository_contract.dart';

class GetUsuarioContexto implements UseCase<Usuario, NoParams> {

  final SidoRepositoryContract sidoRepository;

  GetUsuarioContexto({required this.sidoRepository});

  @override
  Future<Either<Failure, Usuario>> call(NoParams params) async {
    return await sidoRepository.getUsuarioContexto();
  }
  
}

