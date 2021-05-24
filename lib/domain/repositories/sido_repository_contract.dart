
import 'package:dartz/dartz.dart';
import 'package:getx_cleanarchitecture/core/error/failures.dart';
import 'package:getx_cleanarchitecture/domain/entities/usuario.dart';

abstract class SidoRepositoryContract {     
  
  /* Usuario */
  Future<Either<Failure, Usuario>> getEmpleadoContexto();  

}