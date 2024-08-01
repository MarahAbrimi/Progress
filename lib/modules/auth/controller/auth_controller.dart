import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:start_up_workspace/modules/auth/view/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:start_up_workspace/resources/globals.dart';
import '../../../resources/helpers/all_imports.dart';

class AuthController extends GetxController {
  AuthType authType = AuthType.login;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

  Future<void> registerUser(Map<String, dynamic> userData) async {
    final String enPass =
        await EncryptionService().encrypt(userData['password']);

    final usersCollection = FirebaseFirestore.instance.collection('users');
    await usersCollection.add({
      'fullName': userData['fullName'],
      'phone': userData['phone'],
      'age': userData['age'],
      'gender': userData['gender'],
      'password': enPass,
    });
  }


  Future<UserModel?> checkUserRegistered(String phone) async {
    final usersCollection = FirebaseFirestore.instance.collection('users');
    final querySnapshot =
        await usersCollection.where('phone', isEqualTo: phone).get();
    if (querySnapshot.docs.isEmpty) return null;
    return UserModel.fromMap(
        querySnapshot.docs.first.id, querySnapshot.docs.first.data());
  }

  Future<bool> verifyPassword(String phone, String password) async {
    final String enPass = await EncryptionService().encrypt(password);
    final usersCollection = FirebaseFirestore.instance.collection('users');
    final querySnapshot =
        await usersCollection.where('phone', isEqualTo: phone).get();

    if (querySnapshot.docs.isNotEmpty) {
      final userDoc = querySnapshot.docs.first;
      final storedPassword = userDoc.data()['password'];
      log(storedPassword);
      log(enPass);
      return storedPassword == enPass;
    }
    return false;
  }

  void showRegisterDialog() {
    Get.defaultDialog(
      title: localizations.userNotRegistered,
      middleText: "",
      textConfirm: localizations.signUp,
      textCancel: localizations.cancel,
      onConfirm: () {
        Get.to(RegisterView());
      },
      onCancel: () {
      },
    );
  }

  Future<void> verifyOtp(
      String verificationId, String otp, Map<String, dynamic> userData) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      if (userCredential.user != null) {
        final String enPass =
            await EncryptionService().encrypt(userData['password']);
        userData['password'] = enPass;
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(userData);
        final UserModel userModel = UserModel(
          id: userCredential.user!.uid,
          fullName: userData['fullName'],
          age: userData['age'],
          gender: userData['gender'],
        );

        Globals().changeUserModel(userModel);

        Get.to(HomeView());
      }
    } catch (e) {
      Get.snackbar(localizations.error, localizations.invalidOtp);
    }
  }
}
