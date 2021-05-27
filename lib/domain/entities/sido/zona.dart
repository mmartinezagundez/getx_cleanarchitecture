import 'package:equatable/equatable.dart';

class Zona extends Equatable {
  final String id;
  final String codigo;
  final String descripcion;

  Zona({
    required this.id,
    required this.codigo,
    required this.descripcion
  });

  @override
  List<Object> get props => [id, codigo, descripcion];
}
