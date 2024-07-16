

import '../../../resources/helpers/all_imports.dart';

class OtpView extends StatelessWidget {
  OtpView({super.key});

  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return UpgradeDialog(
      child: SafeArea(
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
                        '${localizations.confirmationMsg} ${_authController.phoneController.text}',
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
                    // GetBuilder<AuthController>(builder: (controller) {
                    //   return MainTextField(
                    //     controller: controller.PhoneController,
                    //     suffixIcon: CountryPicker(
                    //       selectedCountryFlag: controller.selectedCountryFlag,
                    //       selectedCountryCode: controller.selectedPhoneCode,
                    //       onSelect: (Country country) {
                    //         controller.setSelectedCountryFlag =
                    //             country.flagEmoji;
                    //         controller.setSelectedPhoneCode = country.phoneCode;
                    //       },
                    //     ),
                    //     hint: localizations.phoneNumber,
                    //     keyboardType: TextInputType.phone,
                    //     validator: ValidationsManager.validatePhone,
                    //   );
                    // }),
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
                      onPressed: () {
                        Get.to(const NavigationView());
                      },
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    SizedBox(
                      width: 334,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'إعادة إرسال الرمز',
                              style: theme.textTheme.titleMedium!.copyWith(
                                color: customTheme.darkGrey,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(
                              text: ' خلال ',
                              style: theme.textTheme.titleMedium!.copyWith(
                                color: customTheme.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: '59',
                              style: theme.textTheme.titleMedium!.copyWith(
                                color: customTheme.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: ' ',
                              style: theme.textTheme.titleMedium!.copyWith(
                                color: customTheme.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: 'ثانية',
                              style: theme.textTheme.titleMedium!.copyWith(
                                color: customTheme.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
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
