
import 'package:get/get.dart';

class FieldValidator {

  static String? firstName(String? value) {
    if(value?.trim().isEmpty ?? false) {
      return "Enter First Name";
    }
    return null;
  }

  static String? lastName(String? value) {
    if(value?.trim().isEmpty ?? false) {
      return "Enter Last Name";
    }
    return null;
  }

  static String? email(String? value) {
    if(value?.trim().isEmpty ?? false) {
      return "Enter Email Address";
    } else if((value?.trim().isEmail ?? true) == false) {
      return "Enter Valid Email Address";
    }
    return null;
  }

  static String? phone(String? value) {
    if(value?.trim().isEmpty ?? false) {
      return "Enter Phone";
    } else if((!(value?.trim().isPhoneNumber ?? false))) {
      return "Enter Valid Phone";
    }
    return null;
  }

  static String? password(String? value) {
    if(value?.trim().isEmpty ?? false) {
      return "Enter Password";
    }
    return null;
  }

  static String? confirmPassword(String? value, String? password) {
    if(value?.trim().isEmpty ?? false) {
      return "Enter Confirm Password";
    } else if((value?.trim() ?? '') != (password?.trim() ?? '')) {
      return "Enter Valid Confirm Password";
    }
    return null;
  }

}
