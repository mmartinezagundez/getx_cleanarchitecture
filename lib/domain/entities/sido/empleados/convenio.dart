import 'package:equatable/equatable.dart';

class Convenio extends Equatable {
  final String id;
  final String codigo;
  final String descripcion;

  Convenio({
    required this.id,
    required this.codigo,
    required this.descripcion
  });

  @override
  List<Object> get props => [id, codigo, descripcion];
}
