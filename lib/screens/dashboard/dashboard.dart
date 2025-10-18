import 'package:flutter/material.dart';
import '../../utils/constants/responsive_sizes.dart';
import '../../utils/constants/sizes.dart';
import '../reponsive/responsive_appbar.dart';
import '../reponsive/responsive_scaffold.dart';
import 'widgets/dashboard_overview.dart';
import 'widgets/jobs_chart.dart';
import 'widgets/jobs_per_week.dart';
import 'widgets/jobs_pie_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      title: 'Dashboard',
      mobileBody: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(Sizes.spaceBtwItems),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overview',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),

                  SizedBox(
                    height: responsiveSize(context, Sizes.spaceBtwItems),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DashboardOverview(
                          width: responsiveSize(context, 150),
                          backgroundColor: Color(0xFF7DBBFF),
                          title: 'Clients',
                          amount: 100525000,
                        ),
                      ),

                      Expanded(
                        child: DashboardOverview(
                          width: responsiveSize(context, 150),
                          backgroundColor: Color(0xFFB899EB),
                          title: 'Providers',
                          amount: 75605230,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: responsiveSize(context, Sizes.spaceBtwItems),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DashboardOverview(
                          width: responsiveSize(context, 150),
                          backgroundColor: Color(0xFFADADFB),
                          title: 'Total Jobs',
                          amount: 700102793,
                        ),
                      ),

                      Expanded(
                        child: DashboardOverview(
                          width: responsiveSize(context, 150),
                          backgroundColor: Color(0xFF71DD8C),
                          title: 'Transactions',
                          amount: 189702793,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: responsiveSize(context, Sizes.spaceBtwItems),
                  ),

                  JobsPerMonthChart(),

                  SizedBox(
                    height: responsiveSize(context, Sizes.spaceBtwItems),
                  ),
                  JobsByCountryPieChart(),
                  SizedBox(
                    height: responsiveSize(context, Sizes.spaceBtwItems),
                  ),
                  JobsPerWeekChart(),
                ],
              ),
            ),
          ],
        ),
      ),
      tabletBody: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(Sizes.spaceBtwItems),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overview',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),

                  SizedBox(
                    height: responsiveSize(context, Sizes.spaceBtwItems),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DashboardOverview(
                          width: responsiveSize(context, 176),
                          backgroundColor: Color(0xFF7DBBFF),
                          title: 'Clients',
                          amount: 100525000,
                        ),
                      ),

                      Expanded(
                        child: DashboardOverview(
                          width: responsiveSize(context, 176),
                          backgroundColor: Color(0xFFB899EB),
                          title: 'Providers',
                          amount: 75605230,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: responsiveSize(context, Sizes.spaceBtwItems),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DashboardOverview(
                          width: responsiveSize(context, 176),
                          backgroundColor: Color(0xFFADADFB),
                          title: 'Total Jobs',
                          amount: 700102793,
                        ),
                      ),

                      Expanded(
                        child: DashboardOverview(
                          backgroundColor: Color(0xFF71DD8C),
                          title: 'Total Transactions',
                          amount: 189702793,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: responsiveSize(context, Sizes.spaceBtwItems),
                  ),

                  JobsPerMonthChart(),

                  SizedBox(
                    height: responsiveSize(context, Sizes.spaceBtwItems),
                  ),
                  Row(
                    children: [
                      JobsByCountryPieChart(width: 300),
                      SizedBox(width: responsiveSize(context, Sizes.sm)),
                      Expanded(child: JobsPerWeekChart()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      desktopBody: Column(
        children: [
          CustomHeader(title: 'Dashboard'),
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
      ),
    );
  }
}
