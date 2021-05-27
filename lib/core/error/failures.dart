import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {

  final String message;


  const Failure(this.message);

  @override
  String toString() {
    return message;
  }

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