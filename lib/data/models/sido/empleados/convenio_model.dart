


import 'package:getx_cleanarchitecture/domain/entities/sido/empleados/convenio.dart';

class ConvenioModel extends Convenio {

  ConvenioModel({
    required String id,
    required String codigo,
    required String descripcion
  }) : super(
            id: id,
            codigo: codigo,
            descripcion: descripcion
            );

  factory ConvenioModel.fromJson(Map<String, dynamic> json){
    return ConvenioModel(
      id: json['id'],
      codigo: json['codigo'] == null ? "" : json['codigo'],
      descripcion: json['descripcion'],  
    );      
  }
  
}
