import '../../../resources/helpers/all_imports.dart';

class NavigationController extends GetxController {
  int index = 0;

  set setIndex(int value) {
    index = value;
    update();
  }

  final List<Widget> pages = [
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView(),
  ];

  int selectedNavIndex = 0;
  void changeIndex(int value) {
    selectedNavIndex = value;
    update();
  }

  Widget getPage() {
    return pages.elementAt(selectedNavIndex);
  }
}
