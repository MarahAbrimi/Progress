

import '../../../resources/helpers/all_imports.dart';

class AuthView extends StatelessWidget {
  AuthView({super.key});

  final AuthController authController = Get.find();

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
                      return MainTextField(
                        controller: controller.phoneController,
                        suffixIcon: CountryPicker(
                          selectedCountryFlag: controller.selectedCountryFlag,
                          selectedCountryCode: controller.selectedPhoneCode,
                          onSelect: (Country country) {
                            controller.setSelectedCountryFlag =
                                country.flagEmoji;
                            controller.setSelectedPhoneCode = country.phoneCode;
                          },
                        ),
                        hint: localizations.phoneNumber,
                        keyboardType: TextInputType.phone,
                        validator: ValidationsManager.validatePhone,
                      );
                    }),
                    MainButton(
                      titleWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            localizations.sendOtp,
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
                      onPressed: () {
                        Get.to(OtpView());
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
