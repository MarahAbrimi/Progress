import 'package:start_up_workspace/resources/helpers/all_imports.dart';

class CodePins extends StatelessWidget {
  const CodePins({
    super.key,
    required this.controller,
    this.onCompleted,
  });
  final TextEditingController controller;
  final void Function(String)? onCompleted;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        controller: controller,
        length: 6,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        defaultPinTheme: PinTheme(
          width: 79,
          height: 49,
          textStyle: theme.textTheme.titleLarge!.copyWith(
            fontSize: 16,
          ),
          decoration: BoxDecoration(
            color: customTheme.grey,
            border: Border.all(
              color: customTheme.grey,
            ),
          ),
        ),
        validator: ValidationsManager.validateOtpCode,
        onCompleted: onCompleted,
      ),
    );
  }
}
