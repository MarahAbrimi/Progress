import '../../../resources/helpers/all_imports.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});

  final SplashController splashController = Get.find();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: width * 0.5, 
                maxHeight: height * 0.5,
              ),
              child: Image.asset(
                IconsManager.appIcon,
              ),
            ),
          ),
          const Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                '© 2024 ProgressSoft',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
