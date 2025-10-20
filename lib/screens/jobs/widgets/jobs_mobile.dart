import 'package:flutter/material.dart';

import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/responsive_sizes.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import 'jobs_info_card.dart';
import 'jobs_table.dart';

class JobsMobile extends StatelessWidget {
  const JobsMobile({
    super.key,
    required this.jobs,
  });

  final List<Map<String, dynamic>> jobs;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    double screenWidth = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(responsiveSize(context, Sizes.spaceBtwItems)),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Sizes.sm),
                  child: JobsInfoCard(
                    width: screenWidth * 0.90,
                    color: CustomColors.success,
                    title: 'Completed Jobs',
                    subtitle: '',
                    value: '100525000',
                  ),
                ),
    
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Sizes.sm),
                  child: JobsInfoCard(
                    width: screenWidth * 0.90,
                    color: CustomColors.warning,
                    title: 'Pending Jobs',
                    subtitle: '',
                    value: '75605230',
                  ),
                ),
              ],
            ),
    
            SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
            RoundedContainer(
              padding: const EdgeInsets.all(Sizes.sm),
              radius: Sizes.cardRadiusSm,
              backgroundColor: dark
                  ? Colors.white.withValues(alpha: 0.1)
                  : Colors.black.withValues(alpha: 0.1),
              child: JobsTable(jobs: jobs),
            ),
          ],
        ),
      ),
    );
  }
}

