import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';
import '../../../common/widgets/appbar/appbar.dart';
import 'dashboard_overview.dart';
import 'jobs_chart.dart';
import 'jobs_per_week.dart';
import 'jobs_pie_chart.dart';

class DashboardDesktop extends StatelessWidget {
  const DashboardDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppbar(title: 'Dashboard'),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Sizes.spaceBtwSections),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overview',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),

                  const SizedBox(height: Sizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DashboardOverview(
                          width: 200,
                          backgroundColor: Color(0xFF7DBBFF),
                          title: 'Clients',
                          amount: 100525000,
                        ),
                      ),

                      Expanded(
                        child: DashboardOverview(
                          width: 200,
                          backgroundColor: Color(0xFFB899EB),
                          title: 'Providers',
                          amount: 75605230,
                        ),
                      ),

                      Expanded(
                        child: DashboardOverview(
                          width: 200,
                          backgroundColor: Color(0xFF71DD8C),
                          title: 'Total Jobs',
                          amount: 700102793,
                        ),
                      ),

                      Expanded(
                        child: DashboardOverview(
                          width: 200,
                          backgroundColor: Color(0xFFADADFB),
                          title: 'Total Transactions',
                          amount: 189702793,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: Sizes.spaceBtwSections),
                  JobsPerMonthChart(),

                  const SizedBox(height: Sizes.spaceBtwSections),
                  Row(
                    children: [
                      Expanded(child: JobsByCountryPieChart(width: 430)),
                      const SizedBox(width: Sizes.sm),
                      Expanded(child: JobsPerWeekChart(width: 430)),
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
