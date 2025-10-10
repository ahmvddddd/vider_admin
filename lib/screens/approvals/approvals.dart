import 'package:flutter/material.dart';
import '../../screens/dashboard/widgets/dashboard_overview.dart';
import '../../utils/constants/sizes.dart';
import '../reponsive/responsive_appbar.dart';
import '../reponsive/responsive_scaffold.dart';

class ApprovalScreen extends StatelessWidget {
  const ApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      mobileBody: Column(
        children: [

          Text('Approvals',
          style: Theme.of(context).textTheme.bodySmall)
        ],
      ),

      tabletBody: Column(
        children: [

          Text('Approvals',
          style: Theme.of(context).textTheme.bodySmall)
        ],
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
                    Expanded(child: DashboardOverview(width: 200, backgroundColor: Colors.redAccent, title: 'Suspension', amount: 100)),
                    Expanded(child: DashboardOverview(width: 200, backgroundColor: Colors.amberAccent, title: 'Verification', amount: 100)),
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