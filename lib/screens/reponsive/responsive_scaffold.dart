import 'package:flutter/material.dart';
import '../../common/widgets/sidebar/custom_sidebar.dart';
import 'responsive_appbar.dart';

class ResponsiveScaffold extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget desktopBody;

  const ResponsiveScaffold({
    super.key,
    required this.mobileBody,
    required this.tabletBody,
    required this.desktopBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Mobile < 600px
        if (constraints.maxWidth < 600) {
          return Scaffold(
            appBar: CustomHeader(),
            drawer: _buildDrawer(context), // show drawer on small screens
            body: mobileBody,
          );
        }
        // Tablet < 1024px
        else if (constraints.maxWidth < 1024) {
          return Scaffold(
            appBar: CustomHeader(),
            drawer: _buildDrawer(context), // still use drawer
            body: tabletBody,
          );
        }
        // Desktop >= 1024px
        else {
          return Scaffold(
            body: Row(
              children: [
                CustomSideBar(), // fixed sidebar
                Expanded(child: desktopBody),
              ],
            ),
          );
        }
      },
    );
  }

  /// Drawer for mobile + tablet
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Text("Menu", style: TextStyle(fontSize: 20))),
          ListTile(
            title: Text("Home", style: Theme.of(context).textTheme.labelMedium),
          ),
          ListTile(
            title: Text(
              "Profile",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          ListTile(
            title: Text(
              "Settings",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}