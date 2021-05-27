import 'package:equatable/equatable.dart';
import 'package:getx_cleanarchitecture/domain/entities/sido/empleados/contrato.dart';

class Empleado extends Equatable {
  final String idPeopleSoft;
  final String usuarioId;  
  final String nombre;
  final String apellido1;
  final String apellido2;

  // final String nif;
  // final bool activo;

  final Contrato? contrato;

  

  Empleado({
    required this.idPeopleSoft,
    required this.usuarioId,
    required this.nombre,
    required this.apellido1,
    required this.apellido2,
    required this.contrato    
  });

  @override
  List<Object> get props => [
    idPeopleSoft, 
    usuarioId, 
    nombre, 
    apellido1, 
    apellido2,    
    ];
}
