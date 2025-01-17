import 'package:start_up_workspace/main.dart';

class ValidationsManager {
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return localizations.fieldRequired;
    }
    final RegExp phoneRegex = RegExp(r'^(^(?:[+0]9)?[0-9]{10,12}$)');
    if (!phoneRegex.hasMatch(value)) {
      return localizations.phoneNotValid;
    }

    return null;
  }



  static String? validateOtpCode(String? value) {
    if (value == null || value.trim().isEmpty) {
      return localizations.codeRequired;
    }
    if (value.trim().length < 4) {
      return localizations.codeAtLeastFourChars;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return localizations.pleaseEnterPassword;
    }
    if (value.length < 6) {
      return localizations.passwordMustContainNumber;
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return localizations.pleaseEnterConfirmPassword;
    }
    if (value != password) {
      return localizations.passwordDoesNotMatch;
    }
    return null;
  }
}
