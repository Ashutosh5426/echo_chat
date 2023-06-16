import 'dart:async';
import 'package:echo_chat/core/app_strings.dart';
import 'package:echo_chat/core/validator.dart';
import 'package:echo_chat/features/login_signup_page/presentation/bloc/login_signup_event.dart';
import 'package:echo_chat/features/login_signup_page/presentation/bloc/login_signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginSignupBloc extends Bloc<LoginSignupEvent, LoginSignupState> {
  LoginSignupBloc() : super(SignupUserState.loading()){
    on<SignupUserEvent>(_signupUserEventToState);
  }

  FutureOr<void> _signupUserEventToState(SignupUserEvent event, emit){
    String phoneError = '';
    String emailError = '';
    String passwordError = '';
    /// VALIDATING PHONE NUMBER
    if(!Validator.validatePhoneNumber(event.phone)){
      phoneError = AppStrings.phoneError;
    }
    /// VALIDATING EMAIL ADDRESS
    if(!Validator.validateEmailAddress(event.email)){
      emailError = AppStrings.emailError;
    }
    /// VALIDATING PASSWORD - SHOULD CONTAIN ATLEAST 7-14 CHARACTERS
    if(!Validator.validatePassword(event.password)){
      passwordError = AppStrings.passwordError;
    }
    if(phoneError.isNotEmpty || emailError.isNotEmpty || passwordError.isNotEmpty){
      emit(SignupUserState.error([phoneError, emailError, passwordError]));
    } else{
      phoneError = '';
      emailError = '';
      passwordError = '';
      emit(SignupUserState.completed());
    }
    /// VERIFYING PHONE NUMBER FROM DATABASE;
    /// VERIFYING EMAIL ADDRESS FROM DATABASE;
    /// VERIFYING PASSWORD FROM DATABASE;
  }
}