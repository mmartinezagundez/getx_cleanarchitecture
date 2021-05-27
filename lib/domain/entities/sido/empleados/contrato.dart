import 'package:equatable/equatable.dart';
import 'package:getx_cleanarchitecture/domain/entities/sido/empleados/convenio.dart';
import 'package:getx_cleanarchitecture/domain/entities/sido/empleados/puesto.dart';
import 'package:getx_cleanarchitecture/domain/entities/sido/zona.dart';

class Contrato extends Equatable {
  final String empresa;
  final Zona zona;  
  final Puesto puesto;
  final Convenio convenio;
  final bool esMaquinista;
  final String tipoContratoPlantilla;  
  final String tipoContratoReal;

  Contrato({
    required this.empresa,
    required this.zona,
    required this.puesto,
    required this.convenio,
    required this.esMaquinista,
    required this.tipoContratoPlantilla,
    required this.tipoContratoReal,
  });

  @override
  List<Object> get props => [
    empresa,
    zona,
    puesto,
    convenio,
    esMaquinista,
    tipoContratoPlantilla,
    tipoContratoReal
    ];
}
