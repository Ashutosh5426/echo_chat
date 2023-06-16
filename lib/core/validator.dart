import 'package:echo_chat/core/regex_values.dart';

class Validator {
  static bool validatePhoneNumber(String number) {
    if (RegexValues.phoneRegex.hasMatch(number)) {
      return true;
    }
    return false;
  }

  static bool validateEmailAddress(String email) {
    if(RegexValues.emailRegex.hasMatch(email)){
      return true;
    }
    return false;
  }

  static bool validatePassword(String password) {
    if(password.length > 6 && password.length <= 14){
      return true;
    }
    return false;
  }
}
