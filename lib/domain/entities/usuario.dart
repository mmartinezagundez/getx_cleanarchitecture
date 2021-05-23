import 'package:equatable/equatable.dart';

class Usuario extends Equatable {
  final String usuarioId;

  Usuario({
    required this.usuarioId,
  });

  @override
  List<Object> get props => [usuarioId];
}
