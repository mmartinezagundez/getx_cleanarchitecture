
import 'package:getx_cleanarchitecture/data/models/sido/empleados/contrato_model.dart';
import 'package:getx_cleanarchitecture/domain/entities/sido/empleados/empleado.dart';

class EmpleadoModel extends Empleado {

  EmpleadoModel({
    required String idPeopleSoft,
    required String usuarioId,
    required String nombre,
    required String apellido1,
    required String apellido2,
    required ContratoModel? contrato,
  }) : super(
            idPeopleSoft: idPeopleSoft,
            usuarioId: usuarioId,
            nombre: nombre,
            apellido1: apellido1,
            apellido2: apellido2,
            contrato: contrato
            );

  factory EmpleadoModel.fromJson(Map<String, dynamic> json){
    return EmpleadoModel(
      idPeopleSoft: json['idPeopleSoft'],
      usuarioId: json['usuarioId'] == null ? "" : json['usuarioId'],
      nombre: json['nombre'],
      apellido1: json['apellido1'] == null ? "" : json['apellido1'],
      apellido2: json['apellido2'] == null ? "" : json['apellido2'],
      contrato: json['contrato'] == null ? null : ContratoModel.fromJson(json['contrato'])
    );      
  }
  
}
