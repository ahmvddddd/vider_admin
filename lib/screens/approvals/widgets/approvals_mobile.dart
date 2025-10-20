import 'package:flutter/material.dart';
import '../../../utils/constants/responsive_sizes.dart';
import '../../../utils/constants/sizes.dart';
import '../../dashboard/widgets/dashboard_overview.dart';


class ApprovalsMobile extends StatelessWidget {
  const ApprovalsMobile({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(responsiveSize(context, Sizes.spaceBtwItems)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Approvals', style: Theme.of(context).textTheme.bodySmall),
    
            SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
            DashboardOverview(
              width: screenWidth * 0.90,
              backgroundColor: Colors.redAccent,
              title: 'Suspended',
              amount: 100,
            ),
    
            SizedBox(height: responsiveSize(context, Sizes.sm)),
            DashboardOverview(
              width: screenWidth * 0.90,
              backgroundColor: Colors.amberAccent,
              title: 'Unverified',
              amount: 100,
            ),
    
            SizedBox(height: responsiveSize(context, Sizes.sm)),
            DashboardOverview(
              width: screenWidth * 0.90,
              backgroundColor: Colors.blueGrey,
              title: 'Disputes',
              amount: 100,
            ),
          ],
        ),
      ),
    );
  }
}

