import 'package:equatable/equatable.dart';

class Failure extends Equatable {

  final String message;
  

  Failure(this.message);

  @override
  String toString() {
    return message;
  }

  @override
  List<Object?> get props => throw UnimplementedError();

  //Failure([List properties = const <dynamic>[]]) : super();
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);

  @override
  List<Object> get props => [];
}

class DatabaseFailure extends Failure {
  DatabaseFailure(String message) : super(message);

  @override
  List<Object> get props => [];
}

class LoginFailure extends Failure {
  LoginFailure(String message) : super(message);

  @override
  List<Object> get props => [];
}

class UsuarioContextoNotLoggedFailure extends Failure {
  UsuarioContextoNotLoggedFailure(String message) : super(message);

  @override
  List<Object> get props => [];
}

class LoginRequiredFailure extends Failure {
  LoginRequiredFailure(String message) : super(message);

  

  @override
  List<Object> get props => [];
}