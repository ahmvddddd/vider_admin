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
      mobileBody: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(Sizes.spaceBtwItems),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Overview',
                    style: Theme.of(context).textTheme.bodySmall,),
        
                    SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DashboardOverview(
                          width: responsiveSize(context, 170),
                          backgroundColor: Color(0xFF7DBBFF),
                          title: 'Clients',
                          amount: '100,525,000',
                        ),
          
                        DashboardOverview(
                          width: responsiveSize(context, 170),
                          backgroundColor: Color(0xFFB899EB),
                          title: 'Providers',
                          amount: '75,605,230',
                        ),
                      ],
                    ),
        
                    SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DashboardOverview(
                          width: responsiveSize(context, 170),
                          backgroundColor: Color(0xFFADADFB),
                          title: 'Total Jobs',
                          amount: '700,102,793',
                        ),
        
                        DashboardOverview(
                          width: responsiveSize(context, 170),
                          backgroundColor: Color(0xFF71DD8C),
                          title: 'Total Transactions',
                          amount: '\$1,989,102,793',
                        ),
                      ],
                    ),
        
                    SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
                    
                    JobsPerMonthChart(),

                    SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
                    JobsByCountryPieChart(
                    ),
                    SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
                    JobsPerWeekChart()
                    ],
                ),
                )
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
                    Text('Overview',
                    style: Theme.of(context).textTheme.bodySmall,),
        
                    SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DashboardOverview(
                          width: responsiveSize(context, 176),
                          backgroundColor: Color(0xFF7DBBFF),
                          title: 'Clients',
                          amount: '100,525,000',
                        ),
          
                        DashboardOverview(
                          width: responsiveSize(context, 176),
                          backgroundColor: Color(0xFFB899EB),
                          title: 'Providers',
                          amount: '75,605,230',
                        ),
                      ],
                    ),
        
                    SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DashboardOverview(
                          width: responsiveSize(context, 176),
                          backgroundColor: Color(0xFFADADFB),
                          title: 'Total Jobs',
                          amount: '700,102,793',
                        ),
        
                        DashboardOverview(
                          backgroundColor: Color(0xFF71DD8C),
                          title: 'Total Transactions',
                          amount: '\$1,989,102,793',
                        ),
                      ],
                    ),
        
                    SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
                    
                    JobsPerMonthChart(),

                    SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
                    Row(
                      children: [
                        JobsByCountryPieChart(
                          width: 300,
                        ),
                        SizedBox(width: responsiveSize(context, Sizes.sm)),
                        Expanded(child: JobsPerWeekChart())
                      ],
                    )
                    ],
                ),
                )
          ],
        ),
      ),
      desktopBody: SingleChildScrollView(
        child: Column(
          children: [
            CustomHeader(),
            Padding(
              padding: const EdgeInsets.all(Sizes.spaceBtwItems),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Overview',
                  style: Theme.of(context).textTheme.bodySmall,),

                  const SizedBox(height: Sizes.spaceBtwItems,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
        
                      DashboardOverview(
                        width: 200,
                        backgroundColor: Color(0xFF7DBBFF),
                        title: 'Clients',
                        amount: '100,525,000',
                      ),
        
                      DashboardOverview(
                        width: 200,
                        backgroundColor: Color(0xFFB899EB),
                        title: 'Providers',
                        amount: '75,605,230',
                      ),

                      DashboardOverview(
                        width: 200,
                        backgroundColor: Color(0xFF71DD8C),
                        title: 'Total Jobs',
                        amount: '700,102,793',
                      ),

                      DashboardOverview(
                        width: 200,
                        backgroundColor: Color(0xFFADADFB),
                        title: 'Total Transactions',
                        amount: '\$1,989,102,793',
                      ),
                    ]
                  ),
        
                  const SizedBox(height: Sizes.spaceBtwSections,),
                  JobsPerMonthChart(),

                  const SizedBox(height: Sizes.spaceBtwSections,),
                  Row(
                    children: [
                      Expanded(child: JobsByCountryPieChart(
                        width: 430,
                      )),
                      const SizedBox(width: Sizes.sm,),
                      Expanded(child: JobsPerWeekChart(
                        width: 430,
                      ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}