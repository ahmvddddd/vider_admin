import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../controllers/jobs_controller/jobs_controller.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/responsive_sizes.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import 'jobs_info_card.dart';
import 'jobs_table.dart';

class JobsMobile extends ConsumerWidget {
  const JobsMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dark = HelperFunction.isDarkMode(context);
    double screenWidth = MediaQuery.of(context).size.height;
    final jobAsync = ref.watch(jobProvider);
    final controller = ref.read(jobProvider.notifier);
    return jobAsync.when(
      data: (jobs) => SingleChildScrollView(
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
                      color: CustomColors.primary,
                      title: 'All Jobs',
                      subtitle: '',
                      value: '${jobs.length}',
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: Sizes.sm),
                    child: JobsInfoCard(
                      width: screenWidth * 0.90,
                      color: CustomColors.success,
                      title: 'Completed Jobs',
                      subtitle: '',
                      value: '${controller.completedJobs}',
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: Sizes.sm),
                    child: JobsInfoCard(
                      width: screenWidth * 0.90,
                      color: CustomColors.warning,
                      title: 'Pending Jobs',
                      subtitle: '',
                      value: '${controller.pendingJobs}',
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
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text(e.toString())),
    );
  }
}
