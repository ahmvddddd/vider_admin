import 'package:flutter/material.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../../../common/widgets/appbar/appbar.dart';
import 'jobs_info_card.dart';
import 'jobs_table.dart';

class JobsDesktop extends StatelessWidget {
  const JobsDesktop({super.key, required this.jobs});

  final List<Map<String, dynamic>> jobs;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppbar(title: 'Jobs'),

        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Sizes.spaceBtwSections),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(Sizes.sm),
                          child: JobsInfoCard(
                            color: CustomColors.success,
                            title: 'Completed Jobs',
                            subtitle: '',
                            value: '100525000',
                          ),
                        ),
                      ),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(Sizes.sm),
                          child: JobsInfoCard(
                            color: CustomColors.warning,
                            title: 'Pending Jobs',
                            subtitle: '',
                            value: '75605230',
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: Sizes.spaceBtwSections),
                  RoundedContainer(
                    padding: const EdgeInsets.all(Sizes.sm),
                    radius: Sizes.cardRadiusSm,
                    backgroundColor: dark
                        ? Colors.white.withValues(alpha: 0.1)
                        : Colors.black.withValues(alpha: 0.1),
                    borderColor: dark ? Colors.white : Colors.black,
                    child: JobsTable(jobs: jobs),
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
