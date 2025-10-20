import 'package:flutter/material.dart';
import '../reponsive/responsive_scaffold.dart';
import 'widgets/approvals_desktop.dart';
import 'widgets/approvals_mobile.dart';
import 'widgets/approvals_tablet.dart';

class ApprovalScreen extends StatelessWidget {
  const ApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return ResponsiveScaffold(
      title: 'Approvals',
      mobileBody: ApprovalsMobile(screenWidth: screenWidth),

      tabletBody: ApprovalsTablet(),

      desktopBody: ApprovalsDesktop(),
    );
  }
}
