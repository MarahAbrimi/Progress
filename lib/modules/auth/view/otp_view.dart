import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../resources/helpers/all_imports.dart';

class OtpView extends StatelessWidget {
  OtpView({super.key});

  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = Get.arguments;
    final String verificationId = arguments['verificationId'];

    return SafeArea(
        child: Scaffold(
          appBar: const MainAppBar(),
          body: ListView(
            shrinkWrap: true,
            reverse: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      localizations.confirmationPhoneNumber,
                      textAlign: TextAlign.right,
                      style: theme.textTheme.titleMedium!.copyWith(
                        color: customTheme.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 460,
                      child: Text(
                        '${localizations.confirmationMsg} ${arguments['phone']}',
                        textAlign: TextAlign.right,
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: customTheme.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 334,
                      child: Text(
                        localizations.confirmationMsg1,
                        textAlign: TextAlign.right,
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: customTheme.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CodePins(
                      controller: _authController.codeController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MainButton(
                      titleWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            localizations.done,
                            textAlign: TextAlign.right,
                            style: theme.textTheme.titleMedium!.copyWith(
                              color: customTheme.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )
                        ],
                      ),
                      onPressed: () async {
                        await _authController.verifyOtp(verificationId,
                            _authController.codeController.text, arguments);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
   
 
  }
}
