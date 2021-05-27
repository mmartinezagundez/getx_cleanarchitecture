


import 'package:getx_cleanarchitecture/data/models/sido/empleados/convenio_model.dart';
import 'package:getx_cleanarchitecture/data/models/sido/empleados/puesto_model.dart';
import 'package:getx_cleanarchitecture/data/models/sido/zona_model.dart';
import 'package:getx_cleanarchitecture/domain/entities/sido/empleados/contrato.dart';


class ContratoModel extends Contrato {

  ContratoModel({
    required String empresa,
    required ZonaModel zona,
    required PuestoModel puesto,
    required ConvenioModel convenio,
    required bool esMaquinista,
    required String tipoContratoPlantilla,
    required String tipoContratoReal,
  }) : super(
            empresa: empresa,
            zona: zona,
            puesto: puesto,
            convenio: convenio,
            esMaquinista: esMaquinista,
            tipoContratoPlantilla: tipoContratoPlantilla,
            tipoContratoReal: tipoContratoReal
            );

  factory ContratoModel.fromJson(Map<String, dynamic> json){
    return ContratoModel(
      empresa: json['empresa'] == null ? "" : json['empresa'],
      zona: ZonaModel(
        id: json['zonaId'] == null ? "" : json['zonaId'], 
        codigo: json['zonaCodigo'] == null ? "" : json['zonaCodigo'], 
        descripcion: json['zonaDescripcion'] == null ? "" : json['zonaDescripcion']
        ),
      convenio: ConvenioModel(
        id: json['convenioId'] == null ? "" : json['convenioId'], 
        codigo: json['convenioCodigo'] == null ? "" : json['convenioCodigo'], 
        descripcion: json['convenioDescripcion'] == null ? "" : json['convenioDescripcion']
        ),
      puesto: PuestoModel(
        id: json['puestoId'] == null ? "" : json['puestoId'], 
        codigo: json['puestoCodigo'] == null ? "" : json['puestoCodigo'], 
        descripcion: json['puestoDescripcion'] == null ? "" : json['puestoDescripcion']
        ),
      esMaquinista: json['esMaquinista'] == null ? "" : json['esMaquinista'],
      tipoContratoPlantilla: json['tipoContratoPlantilla'] == null ? "" : json['tipoContratoPlantilla'],
      tipoContratoReal: json['tipoContratoReal'] == null ? "" : json['tipoContratoReal']

    );      
  }
  
}
