import 'package:start_up_workspace/resources/helpers/all_imports.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> navBarList = [
      {
        'text': 'home',
        'image': MdiIcons.home,
        'isSvg': true,
      },
      {
        'text': 'السجل',
        'image': MdiIcons.car,
        'isSvg': true,
      },
      {
        'text': 'حسابي',
        'image': MdiIcons.accountCircle,
        'isSvg': true,
      },
      {
        'text': 'المزيد',
        'image': MdiIcons.menu,
        'isSvg': true,
      },
    ];
    Get.put(NavigationController());
    return UpgradeDialog(
      child: GetBuilder<NavigationController>(
        builder: (controller) {
          return Scaffold(
            extendBody: true,
            body: controller.getPage(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              surfaceTintColor: Colors.transparent,
              notchMargin: 5,
              color: customTheme.black,
              height: 60.0,
              padding: EdgeInsets.zero,
              elevation: 4.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: navBarList.map((item) {
                  final int itemIndex = navBarList.indexOf(item);
                  return Expanded(
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        onTap: () {
                          controller.setIndex = itemIndex;
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              item['image']!,
                              size: 22.0,
                              color: itemIndex == controller.index
                                  ? customTheme.grey
                                  : theme.colorScheme.onError,
                            ),
                            const SizedBox(height: 4.0),
                            ScaleText(
                              item['text']!,
                              style: theme.textTheme.titleSmall!.copyWith(
                                color: itemIndex == controller.index
                                    ? customTheme.grey
                                    : theme.colorScheme.onError,
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
