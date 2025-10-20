import 'package:flutter/material.dart';
import '../../../utils/constants/responsive_sizes.dart';
import '../../../utils/constants/sizes.dart';
import '../../dashboard/widgets/dashboard_overview.dart';

class ApprovalsTablet extends StatelessWidget {
  const ApprovalsTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(responsiveSize(context, Sizes.spaceBtwItems)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Approvals', style: Theme.of(context).textTheme.bodySmall),
    
            const SizedBox(height: Sizes.spaceBtwItems),
            Row(
              children: [
                Expanded(
                  child: DashboardOverview(
                    width: 200,
                    backgroundColor: Colors.redAccent,
                    title: 'Suspended',
                    amount: 100,
                  ),
                ),
                Expanded(
                  child: DashboardOverview(
                    width: 200,
                    backgroundColor: Colors.amberAccent,
                    title: 'Unverified',
                    amount: 100,
                  ),
                ),
                Expanded(
                  child: DashboardOverview(
                    width: 200,
                    backgroundColor: Colors.blueGrey,
                    title: 'Disputes',
                    amount: 100,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

