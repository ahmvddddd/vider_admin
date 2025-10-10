import 'package:flutter/material.dart';
import '../../screens/dashboard/widgets/dashboard_overview.dart';
import '../../utils/constants/responsive_sizes.dart';
import '../../utils/constants/sizes.dart';
import '../reponsive/responsive_appbar.dart';
import '../reponsive/responsive_scaffold.dart';

class ApprovalScreen extends StatelessWidget {
  const ApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return ResponsiveScaffold(
      mobileBody: Padding(
        padding: EdgeInsets.all(responsiveSize(context, Sizes.spaceBtwItems)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            Text('Approvals',
            style: Theme.of(context).textTheme.bodySmall),
            
            SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems),),
            DashboardOverview(
              width: screenWidth * 0.90, backgroundColor: Colors.redAccent, title: 'Suspended', amount: 100),

            SizedBox(height: responsiveSize(context, Sizes.sm),),
            DashboardOverview(width: screenWidth * 0.90, backgroundColor: Colors.amberAccent, title: 'Unverified', amount: 100)  
            
            
          ],
        ),
      ),

      tabletBody: Padding(
        padding: EdgeInsets.all(responsiveSize(context, Sizes.spaceBtwItems)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            Text('Approvals',
            style: Theme.of(context).textTheme.bodySmall),

            const SizedBox(height: Sizes.spaceBtwItems,),
                Row(
                  children: [
                    Expanded(child: DashboardOverview(width: 200, backgroundColor: Colors.redAccent, title: 'Suspended', amount: 100)),
                    Expanded(child: DashboardOverview(width: 200, backgroundColor: Colors.amberAccent, title: 'Unverified', amount: 100)),
                  ],
                )
          ],
        ),
      ),

      desktopBody: Column(
        children: [
          CustomHeader(),

          Padding(
              padding: const EdgeInsets.all(Sizes.spaceBtwSections),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Approvals',
                style: Theme.of(context).textTheme.bodySmall),

                const SizedBox(height: Sizes.spaceBtwItems,),
                Row(
                  children: [
                    Expanded(child: DashboardOverview(width: 200, backgroundColor: Colors.redAccent, title: 'Suspended', amount: 100)),
                    Expanded(child: DashboardOverview(width: 200, backgroundColor: Colors.amberAccent, title: 'Unverified', amount: 100)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}