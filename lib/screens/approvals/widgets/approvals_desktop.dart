import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';
import '../../dashboard/widgets/dashboard_overview.dart';
import '../../reponsive/responsive_appbar.dart';

class ApprovalsDesktop extends StatelessWidget {
  const ApprovalsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHeader(title: 'Approvals'),

        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Sizes.spaceBtwSections),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Approvals',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),

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
          ),
        ),
      ],
    );
  }
}
