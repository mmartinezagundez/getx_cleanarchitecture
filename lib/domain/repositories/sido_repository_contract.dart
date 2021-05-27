
import 'package:dartz/dartz.dart';
import 'package:getx_cleanarchitecture/core/error/failures.dart';
import 'package:getx_cleanarchitecture/domain/entities/sido/empleados/empleado.dart';
import 'package:getx_cleanarchitecture/domain/entities/usuario.dart';

abstract class SidoRepositoryContract {     
  
  /* Empleado */
  Future<Either<Failure, Usuario>> getEmpleadoContexto();  
  Future<Either<Failure, List<Empleado>>> getAllEmpleados();  



}