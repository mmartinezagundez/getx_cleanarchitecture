import 'package:equatable/equatable.dart';

class Puesto extends Equatable {
  final String id;
  final String codigo;
  final String descripcion;

  Puesto({
    required this.id,
    required this.codigo,
    required this.descripcion
  });

  @override
  List<Object> get props => [id, codigo, descripcion];
}
