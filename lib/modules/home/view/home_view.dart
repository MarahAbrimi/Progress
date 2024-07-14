import '../../../resources/helpers/all_imports.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController homeController = Get.put(
    HomeController(),
  );

  @override
  Widget build(BuildContext context) {
    return UpgradeDialog(
      child: Scaffold(
        appBar: MainAppBar(
          title: localizations.home,
          hasDrawer: true,
        ),
        drawer: const DrawerHome(),
      ),
    );
  }
}
