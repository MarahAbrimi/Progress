import '../../../resources/helpers/all_imports.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});

  final SettingsController settingsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: const [],
      ),
    );
  }
}
