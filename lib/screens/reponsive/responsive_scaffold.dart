import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vider_admin/common/widgets/sidebar/sidebar_widget.dart';
import '../../common/widgets/sidebar/custom_sidebar.dart';
import '../../utils/constants/custom_colors.dart';
import '../../utils/constants/responsive_sizes.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/device/device_utility.dart';
import '../../utils/helpers/helper_function.dart';
import 'responsive_appbar.dart';

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
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Mobile < 600px
        if (DeviceUtils.isMobileScreen(context)) {
          return Scaffold(
            key: scaffoldKey,
            appBar: CustomHeader(title: title, scaffoldKey: scaffoldKey),
            drawer: _buildDrawer(context), // show drawer on small screens
            body: mobileBody,
          );
        }
        // Tablet < 1024px
        else if (DeviceUtils.isTabletScreen(context)) {
          return Scaffold(
            appBar: CustomHeader(title: title),
            drawer: _buildDrawer(context), // still use drawer
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

  /// Drawer for mobile + tablet
  Widget _buildDrawer(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: CustomColors.darkGrey, width: 0.3),
        ),
      ),
      child: Drawer(
        width: responsiveSize(context, 300),
        backgroundColor: dark ? Colors.black : Colors.white,
        shape: BeveledRectangleBorder(),
        child: ListView(
          children: [
            SizedBox(height: responsiveSize(context, Sizes.spaceBtwSections)),
            SideBarWidget(route: '/', icon: Iconsax.activity, title: 'Dashboard'),
            
            SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
            SideBarWidget(route: '/', icon: Iconsax.user, title: 'Users'),

            SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
            SideBarWidget(route: '/', icon: Icons.cases_rounded, title: 'Jobs'),

            SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
            SideBarWidget(route: '/', icon: Iconsax.bank, title: 'Transactions'),

            SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
            SideBarWidget(route: '/', icon: Iconsax.check, title: 'Approvals'),

            SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
            SideBarWidget(route: '/', icon: Icons.notifications, title: 'Notifications'),

            SizedBox(height: responsiveSize(context, Sizes.spaceBtwSections)),
            SideBarWidget(route: '/', icon: Iconsax.logout, title: 'Sign Out'),
            ListTile(
              title: Text(
                "Settings",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
