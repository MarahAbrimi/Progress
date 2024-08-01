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
      backgroundColor: Colors.white,
      systemOverlayStyle: Components().systemUiOverlayStyle(),
      automaticallyImplyLeading: false,
      title: Center(
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Image.asset(
              IconsManager.appIcon,
              height: 90.0,
              width: 90.0,
              fit: BoxFit.contain,
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
