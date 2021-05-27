import 'package:dartz/dartz.dart';
import 'package:getx_cleanarchitecture/core/error/failures.dart';
import 'package:getx_cleanarchitecture/core/usecase/usecase.dart';
import 'package:getx_cleanarchitecture/domain/entities/sido/empleados/empleado.dart';
import 'package:getx_cleanarchitecture/domain/repositories/sido_repository_contract.dart';

class GetAllEmpleados implements UseCase<List<Empleado>, NoParams> {

  final SidoRepositoryContract sidoRepository;

  GetAllEmpleados({required this.sidoRepository});

  @override
  Future<Either<Failure, List<Empleado>>> call(NoParams params) async {
    return await sidoRepository.getAllEmpleados();
  }
  
}

