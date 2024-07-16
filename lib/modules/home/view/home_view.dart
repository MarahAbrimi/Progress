
import '../../../resources/helpers/all_imports.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController homeController = Get.put(
    HomeController(),
  );

  final List<Map<String, dynamic>> list = [
    {'text': 'احمد الراشد', 'icon': MdiIcons.account},
    {'text': 'مركز تجهيز الحي الشرقي', 'icon': MdiIcons.taxi},
    {'text': 'مدينة اربد', 'icon': MdiIcons.map},
  ];

  @override
  Widget build(BuildContext context) {
    return UpgradeDialog(
      child: Scaffold(
          appBar: const MainAppBar(),
          // bottomNavigationBar: BottomNavBar(
          //   onTap: (int index) {
          //     controller.changeIndex(index);
          //   },
          //   selectedNavIndex: controller.selectedNavIndex,
          // ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 53,
                  padding: const EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    color: customTheme.darkGrey,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'مركز متابعة Trust',
                        textAlign: TextAlign.right,
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: customTheme.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                        ),
                      ),
                      Icon(
                        MdiIcons.certificate,
                        size: 26,
                        color: customTheme.white,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SizedBox(
                    height: 94,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200, // Set the desired width here
                          child: ListView.builder(
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Icon(
                                    list[index]['icon'],
                                    size: 24,
                                    color: customTheme.darkGrey,
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    list[index]['text'],
                                    textAlign: TextAlign.right,
                                    style:
                                        theme.textTheme.titleMedium!.copyWith(
                                      color: customTheme.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Container(
                          width: 84,
                          height: 84,
                          decoration: ShapeDecoration(
                            image: const DecorationImage(
                              image: NetworkImage(
                                 'https://cdn-icons-png.freepik.com/512/180/180644.png?ga=GA1.1.1700875974.1692094917'),
                              fit: BoxFit.cover,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(356),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
