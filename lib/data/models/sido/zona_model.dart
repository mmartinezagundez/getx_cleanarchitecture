


import 'package:getx_cleanarchitecture/domain/entities/sido/zona.dart';

class ZonaModel extends Zona {

  ZonaModel({
    required String id,
    required String codigo,
    required String descripcion
  }) : super(
            id: id,
            codigo: codigo,
            descripcion: descripcion
            );

  factory ZonaModel.fromJson(Map<String, dynamic> json){
    return ZonaModel(
      id: json['id'],
      codigo: json['codigo'] == null ? "" : json['codigo'],
      descripcion: json['descripcion'],  
    );      
  }
  
}
