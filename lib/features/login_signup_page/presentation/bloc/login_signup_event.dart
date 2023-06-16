import 'package:equatable/equatable.dart';

abstract class LoginSignupEvent extends Equatable {}

class SignupUserEvent extends LoginSignupEvent {
  final String phone;
  final String email;
  final String password;

  SignupUserEvent({
    required this.phone,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [phone, email, password];
}
