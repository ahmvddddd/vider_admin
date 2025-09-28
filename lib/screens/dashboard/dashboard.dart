import 'package:flutter/material.dart';
import '../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../utils/constants/custom_colors.dart';
import '../../utils/constants/sizes.dart';
import '../reponsive/responsive_appbar.dart';
import '../reponsive/responsive_scaffold.dart';
import 'widgets/jobs_chart.dart';
import 'widgets/jobs_pie_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      mobileBody: Column(
        children: [
          Text('Mobile'),
        ],
      ),
      tabletBody: Column(
        children: [

          Text('Tablet'),
        ],
      ),
      desktopBody: SingleChildScrollView(
        child: Column(
          children: [
            CustomHeader(),
            Padding(
              padding: const EdgeInsets.all(Sizes.spaceBtwItems),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
        
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Sizes.sm),
                          child: RoundedContainer(
                            height: 100,
                            padding: const EdgeInsets.all(Sizes.spaceBtwItems),
                            backgroundColor: CustomColors.accent,
                            radius: Sizes.cardRadiusLg,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Clients',
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black),),
                          
                                const SizedBox(height: Sizes.spaceBtwItems,),
                                Text('100,525,000',
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black, fontFamily: 'JosefinSans').apply(letterSpacingDelta: 1.2),)
                              ],
                            ),
                          ),
                        ),
                      ),
        
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Sizes.sm),
                          child: RoundedContainer(
                            height: 100,
                            padding: const EdgeInsets.all(Sizes.spaceBtwItems),
                            backgroundColor: CustomColors.textSecondary,
                            radius: Sizes.cardRadiusLg,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Providers',
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black, ),),
                          
                                const SizedBox(height: Sizes.spaceBtwItems,),
                                Text('75,605,230',
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black, fontFamily: 'JosefinSans').apply(letterSpacingDelta: 1.2),)
                              ],
                            ),
                          ),
                        ),
                      ),
        
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Sizes.spaceBtwItems),
                          child: RoundedContainer(
                            height: 100,
                            padding: const EdgeInsets.all(Sizes.spaceBtwItems),
                            backgroundColor: CustomColors.alternate,
                            radius: Sizes.cardRadiusLg,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Total Jobs',
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black),),
                          
                                const SizedBox(height: Sizes.spaceBtwItems,),
                                Text('700,102,793',
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black, fontFamily: 'JosefinSans').apply(letterSpacingDelta: 1.2),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]
                  ),
        
                  const SizedBox(height: Sizes.spaceBtwSections,),
                  Row(
                    children: [
                      JobsPerMonthChart(),
                      const SizedBox(width: Sizes.sm,),
                      Expanded(child: JobsByCountryPieChart())
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

