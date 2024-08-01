import 'helpers/all_imports.dart';

class Components {
  Components._();

  static final Components _instance = Components._();

  factory Components() => _instance;
  dynamic bodyDecode(List<int> bodyBytes) {
    return jsonDecode(utf8.decode(bodyBytes));
  }
  void snackBar({
    required String message,
    SnackBarStatus snackBarStatus = SnackBarStatus.warning,
    Duration duration = const Duration(seconds: 3),
  }) {
    Color? leftBarIndicatorColor;
    switch (snackBarStatus) {
      case SnackBarStatus.success:
        leftBarIndicatorColor = ColorsManager.success;
        break;
      case SnackBarStatus.error:
        leftBarIndicatorColor = ColorsManager.error;
        break;
      case SnackBarStatus.warning:
        leftBarIndicatorColor = ColorsManager.warning;
        break;
      default:
        leftBarIndicatorColor = null;
        break;
    }
    scaffoldMessengerKey.currentState!.hideCurrentSnackBar();
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50.0,
              width: 4.0,
              color: leftBarIndicatorColor,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: ScaleText(
                message,
                maxLines: 2,
              ),
            ),
            const SizedBox(width: 8.0),
          ],
        ),
        padding: EdgeInsets.zero,
        backgroundColor: ColorsManager.snackBarBackground,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Future<void> showAdaptiveDialog({
    required BuildContext context,
    Widget? title,
    Widget? content,
    List<Widget>? actions,
  }) async {
    await showDialog(
      context: context,
      builder: (ctx) {
        if (Platform.isIOS) {
          return CupertinoAlertDialog(
            title: title,
            content: content,
            actions: actions ?? [],
          );
        }
        return AlertDialog(
          title: title,
          content: content,
          actions: actions,
        );
      },
    );
  }

  Widget customLoadingItem() {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }

  void showLoading() {
    LoadingPlusController().show();
  }

  void dismissLoading() {
    LoadingPlusController().dismiss();
  }

  Center loadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  bool isRTL() {
    return Bidi.isRtlLanguage(Get.locale!.languageCode);
  }

  bool isDark() {
    return theme.colorScheme.brightness == Brightness.dark;
  }

  SystemUiOverlayStyle systemUiOverlayStyle({
    Color? statusBarColor,
    Brightness? statusBarBrightness,
    Brightness? statusBarIconBrightness,
  }) {
    return SystemUiOverlayStyle(
      statusBarColor: statusBarColor ?? theme.colorScheme.primary,
      statusBarBrightness: statusBarBrightness ?? (isDark() ? Brightness.dark : Brightness.light),
      statusBarIconBrightness:
          statusBarIconBrightness ?? (isDark() ? Brightness.dark : Brightness.light),
    );
  }

  Future<bool> checkConnection() {
    return InternetConnectionChecker().hasConnection;
  }


  Future<TimeOfDay?> timePicker(BuildContext context, {TimeOfDay? initialTime}) async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: initialTime ?? const TimeOfDay(hour: 8, minute: 0),
      helpText: localizations.chooseTheTime,
      builder: (context, child) {
        return Theme(
          data: isDark()
              ? ThemeData.dark().copyWith(
                  colorScheme: ColorScheme.light(
                    primary: theme.colorScheme.primary,
                    onSurface: customTheme.grey,
                  ),
                  buttonTheme: ButtonThemeData(
                    colorScheme: ColorScheme.light(
                      primary: theme.colorScheme.primary,
                    ),
                  ),
                  timePickerTheme: TimePickerThemeData(
                    backgroundColor: theme.colorScheme.surface,
                    helpTextStyle: TextStyle(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                )
              : ThemeData.light().copyWith(
                  colorScheme: ColorScheme.light(
                    primary: theme.colorScheme.primary,
                    onSurface: customTheme.grey,
                  ),
                  buttonTheme: ButtonThemeData(
                    colorScheme: ColorScheme.light(
                      primary: theme.colorScheme.primary,
                    ),
                  ),
                  timePickerTheme: TimePickerThemeData(
                    backgroundColor: theme.colorScheme.surface,
                    helpTextStyle: TextStyle(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
          child: child!,
        );
      },
    );
    return time;
  }

  Future<DateTime?> datePicker(
    BuildContext context, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime.now(),
      lastDate: lastDate ?? DateTime.now().add(const Duration(days: 90)),
      locale: Get.locale!,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: isDark()
              ? ThemeData.dark().copyWith(
                  dialogBackgroundColor: customTheme.white,
                  colorScheme: ColorScheme.fromSwatch().copyWith(
                    primary: theme.colorScheme.primary,
                    onSurface: customTheme.black,
                  ),
                )
              : ThemeData.light().copyWith(
                  dialogBackgroundColor: customTheme.white,
                  colorScheme: ColorScheme.fromSwatch().copyWith(
                    primary: theme.colorScheme.primary,
                    onSurface: customTheme.black,
                  ),
                ),
          child: child!,
        );
      },
    );
    return dateTime;
  }

}

enum SnackBarStatus {
  success,
  error,
  warning,
  none,
}
