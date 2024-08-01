import 'package:start_up_workspace/modules/auth/view/register_view.dart';

import '../../../resources/globals.dart';
import '../../../resources/helpers/all_imports.dart';

class AuthView extends StatelessWidget {
  AuthView({super.key});

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return  SafeArea(
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
                      localizations.enterphoneNumber,
                      textAlign: TextAlign.right,
                      style: theme.textTheme.displayMedium!.copyWith(
                        color: customTheme.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      width: 334,
                      child: Text(
                        localizations.sendSms,
                        textAlign: TextAlign.right,
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: customTheme.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    GetBuilder<AuthController>(builder: (controller) {
                      return Column(
                        children: [
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
                          MainTextField(
                            controller: controller.passwordController,
                            hint: localizations.password,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ],
                      );
                    }),
                    MainButton(
                      titleWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            localizations.login,
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
                        final phone = authController.phoneController.text;
                        final password = authController.passwordController.text;

                        final UserModel? userModel =
                            await authController.checkUserRegistered(phone);

                        if (userModel != null) {
                          final isPasswordCorrect = await authController
                              .verifyPassword(phone, password);

                          if (isPasswordCorrect) {
                            Globals().changeUserModel(userModel);
                            Get.to(HomeView());
                          } else {
                            Get.snackbar('Error', 'Incorrect password');
                          }
                        } else {
                          authController.showRegisterDialog();
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Get.to(RegisterView());
                        },
                        child: Text(
                          localizations.signUp,
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
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
