import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:start_up_workspace/modules/auth/view/otp_view.dart';
import 'package:start_up_workspace/modules/auth/controller/register_controller.dart';
import 'package:start_up_workspace/resources/widgets/age_picker.dart';
import 'package:start_up_workspace/resources/widgets/gender.dart';
import '../../../resources/helpers/all_imports.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MainAppBar(),
        body: Form(
          key: registerController.formKey,
          child: ListView(
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
                      localizations.signUp,
                      textAlign: TextAlign.right,
                      style: theme.textTheme.displayMedium!.copyWith(
                        color: customTheme.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    GetBuilder<RegisterController>(builder: (controller) {
                      return Column(
                        children: [
                          MainTextField(
                            controller: controller.fullNameController,
                            hint: localizations.username,
                            keyboardType: TextInputType.text,
                          ),
                          MainTextField(
                            controller: controller.phoneController,
                            suffixIcon: CountryPicker(
                              selectedCountryFlag:
                                  controller.selectedCountryFlag,
                              selectedCountryCode: controller.selectedPhoneCode,
                              onSelect: (Country country) {
                                controller.setSelectedCountryFlag =
                                    country.flagEmoji;
                                controller.setSelectedPhoneCode =
                                    country.phoneCode;
                              },
                            ),
                            hint: localizations.phoneNumber,
                            keyboardType: TextInputType.phone,
                            validator: ValidationsManager.validatePhone,
                          ),
                          AgePicker(
                            selectedAge: controller.selectedAge,
                            onSelect: (int? age) {
                              if (age != null) {
                                controller.setSelectedAge(age);
                              }
                            },
                          ),
                          GenderDropdown(
                            selectedGender: controller.selectedGender,
                            onSelect: (String? gender) {
                              if (gender != null) {
                                controller.setSelectedGender(gender);
                              }
                            },
                          ),
                          MainTextField(
                            controller: controller.passwordController,
                            hint: localizations.password,
                            keyboardType: TextInputType.visiblePassword,
                            validator: ValidationsManager.validatePassword,
                          ),
                          MainTextField(
                            controller: controller.confirmPasswordController,
                            hint: localizations.pleaseEnterPassword,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              return ValidationsManager.validateConfirmPassword(
                                  value, controller.passwordController.text);
                            },
                          ),
                        ],
                      );
                    }),
                    MainButton(
                      titleWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            localizations.signUp,
                            textAlign: TextAlign.right,
                            style: theme.textTheme.titleLarge!.copyWith(
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
                        if (registerController.validateForm()) {
                          await registerController.sendOtp(
                              registerController.phoneController.text,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
