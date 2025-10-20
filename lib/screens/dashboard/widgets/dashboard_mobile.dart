import 'package:flutter/material.dart';
import '../../../utils/constants/responsive_sizes.dart';
import '../../../utils/constants/sizes.dart';
import 'dashboard_overview.dart';
import 'jobs_chart.dart';
import 'jobs_per_week.dart';
import 'jobs_pie_chart.dart';

class DashboardMobile extends StatelessWidget {
  const DashboardMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}

