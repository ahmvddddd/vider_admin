import 'package:flutter/material.dart';
import 'package:vider_admin/common/widgets/drawer/custom_drawer.dart';
import '../../common/widgets/sidebar/custom_sidebar.dart';
import '../../utils/device/device_utility.dart';
import '../../common/widgets/appbar/appbar.dart';

class ResponsiveScaffold extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget desktopBody;
  final String title;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  ResponsiveScaffold({
    super.key,
    required this.mobileBody,
    required this.tabletBody,
    required this.desktopBody,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Mobile < 600px
        if (DeviceUtils.isMobileScreen(context)) {
          return Scaffold(
            key: scaffoldKey,
            appBar: CustomAppbar(title: title, scaffoldKey: scaffoldKey),
            drawer: CustomDrawer(), // show drawer on small screens
            body: mobileBody,
          );
        }
        // Tablet < 1024px
        else if (DeviceUtils.isTabletScreen(context)) {
          return Scaffold(
            appBar: CustomAppbar(title: title),
            drawer: CustomDrawer(), // still use drawer
            body: tabletBody,
          );
        }
        // Desktop >= 1024px
        else if (DeviceUtils.isDeskTopScreen(context)) {
          return Scaffold(
            body: Row(
              children: [
                CustomSideBar(), // fixed sidebar
                Expanded(child: desktopBody),
              ],
            ),
          );
        } else {
          return Scaffold(body: mobileBody);
        }
      },
    );
  }
}
