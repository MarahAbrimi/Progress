import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:start_up_workspace/main.dart';
import 'package:start_up_workspace/modules/auth/view/otp_view.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  int selectedAge = 18;
  String selectedGender = 'Male';

  void setSelectedAge(int age) {
    selectedAge = age;
    update();
  }

  void setSelectedGender(String gender) {
    selectedGender = gender;
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

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  Future<void> sendOtp(String phoneNumber) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    if (phoneNumber[0] == '0') {
      phoneNumber = phoneNumber.replaceFirst('0', '');
    }
    final String phone = '+$selectedPhoneCode$phoneNumber';
    print('phone: $phone');
    await auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.snackbar(localizations.error, e.message ?? localizations.error);
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        Get.to(() => OtpView(), arguments: {
          'verificationId': verificationId,
          'fullName': fullNameController.text,
          'phone': phoneController.text,
          'age': selectedAge,
          'gender': selectedGender,
          'password': passwordController.text,
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
      },
    );
  }

  @override
  void onClose() {
    fullNameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
