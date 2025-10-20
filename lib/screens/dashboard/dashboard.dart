import 'package:flutter/material.dart';
import '../reponsive/responsive_scaffold.dart';
import 'widgets/dashboard_desktop.dart';
import 'widgets/dashboard_mobile.dart';
import 'widgets/dashboard_tablet.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      title: 'Dashboard',
      mobileBody: DashboardMobile(),
      tabletBody: DashboardTablet(),
      desktopBody: DashboardDesktop(),
    );
  }
}
