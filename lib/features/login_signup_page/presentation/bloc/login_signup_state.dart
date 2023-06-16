import 'package:echo_chat/core/common_bloc_state.dart';

abstract class LoginSignupState extends ApiState{
  LoginSignupState.loading([data]) : super.loading(data);
  LoginSignupState.error([error])
      : super.error(error);
  LoginSignupState.completed([super.data]) : super.completed();
}



class SignupUserState extends LoginSignupState{
  SignupUserState.loading() : super.loading('');
  SignupUserState.error([error]) : super.error(error);
  SignupUserState.completed() : super.completed();
}