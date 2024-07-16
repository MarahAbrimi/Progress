import '../helpers/all_imports.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.canBack = false,
    this.hasDrawer = false,
    this.actions,
  });

  final bool canBack;
  final bool hasDrawer;
  final List<Widget>? actions;

  @override
  Size get preferredSize =>
      const Size.fromHeight(ConstantsManager.appbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      toolbarHeight: 100,
      systemOverlayStyle: Components().systemUiOverlayStyle(),
      automaticallyImplyLeading: false,
      title: Center(
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(),
          child: const SizedBox(
            width: 87.77,
            height: 60.11,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 10,
                  child: Text(
                    'Trust',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'RTL-Saudi',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 25.77,
                  top: 30.00,
                  child: Text(
                    'Team',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'Simah pro Arabic',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      leading: canBack
          ? IconButton(
              onPressed: () {
                Get.back();
              },
              icon: RotatedBox(
                quarterTurns: Components().isRTL() ? 2 : 0,
                child: SvgPicture.asset(
                  IconsManager.backButtonSvg,
                  height: 22.0,
                  width: 22.0,
                  colorFilter: ColorFilter.mode(
                    theme.colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            )
          : hasDrawer
              ? IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                )
              : null,
      actions: actions,
    );
  }
}
