


import 'package:getx_cleanarchitecture/domain/entities/sido/empleados/puesto.dart';


class PuestoModel extends Puesto {

  PuestoModel({
    required String id,
    required String codigo,
    required String descripcion
  }) : super(
            id: id,
            codigo: codigo,
            descripcion: descripcion
            );

  factory PuestoModel.fromJson(Map<String, dynamic> json){
    return PuestoModel(
      id: json['id'],
      codigo: json['codigo'] == null ? "" : json['codigo'],
      descripcion: json['descripcion'],  
    );      
  }
  
}
