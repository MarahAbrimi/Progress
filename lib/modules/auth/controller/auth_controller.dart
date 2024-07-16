import '../../../resources/helpers/all_imports.dart';

class AuthController extends GetxController {
  AuthType authType = AuthType.login;
  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  void changeAuthType() {
    authType = authType == AuthType.login ? AuthType.signUp : AuthType.login;
    update();
  }

  String selectedCountryFlag = '🇯🇴';

  set setSelectedCountryFlag(String value) {
    selectedCountryFlag = value;
    update();
  }

  String selectedPhoneCode = '962';

  set setSelectedPhoneCode(String value) {
    selectedPhoneCode = value;
    update();
  }

  Future<void> submit() async {
    Get.offAllNamed(Routes.navigationRoute);
  }
}
