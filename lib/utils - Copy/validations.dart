

import 'package:get/get.dart';

String? validateEmptyData(String? value) {
  if (value == null || value.isEmpty) {
    return 'Required ';
  }
  return null;
}

String? validatePwdData(String? value) {
  // final regex =
  //     RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
    // } else if (value.length < 8) {
    //   return 'Password Must be at lest 8 characters';
    // } else if (value.length > 31) {
    //   return 'Password Must be less than 30 characters';
    // } else if (!regex.hasMatch(value)) {
    //   return 'Password should contain Upper, Lower, Digit and Special character';
  }
  return null;
}

String? validateMobileNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Required Mobile number';
  } else if (!value.isPhoneNumber) {
    return 'Enter Valid Mobile number';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email Id';
  } else if (!value.isEmail) {
    return 'Please enter a valid email address';
  }
  return null;
}

String? validateIfDataIsEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter the data';
  }
  return null;
}
