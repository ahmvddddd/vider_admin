import 'package:flutter/material.dart';
import '../reponsive/responsive_appbar.dart';
import '../reponsive/responsive_scaffold.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      mobileBody: Column(
        children: [
          Text('Mobile'),
        ],
      ),
      tabletBody: Column(
        children: [

          Text('Tablet'),
        ],
      ),
      desktopBody: Column(
        children: [
          CustomHeader(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Desktop'),
          ),
        ],
      ),
    );
  }
}