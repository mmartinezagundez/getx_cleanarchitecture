import 'package:equatable/equatable.dart';

class LoginRequest extends Equatable {

  final String login;
  final String password;

  LoginRequest({
    required this.login,
    required this.password
  });

  @override  
  List<Object?> get props => [login, password];


  
}