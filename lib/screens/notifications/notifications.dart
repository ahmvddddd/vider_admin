import 'package:flutter/material.dart';
import '../../screens/reponsive/responsive_scaffold.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      mobileBody: Text('mobile'),
      tabletBody: Text('tablet'),
      desktopBody: Text('desktop'),
    );
  }
}