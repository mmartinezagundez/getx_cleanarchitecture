import 'package:getx_cleanarchitecture/data/models/sido/empleados/empleado_model.dart';

abstract class SidoRemoteDataSourceContract {
  
  /* Empleados */
  Future<List<EmpleadoModel>> getAllEmpleados();

}