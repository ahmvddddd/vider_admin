// import 'package:flutter/material.dart';
// import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
// import '../../../utils/constants/custom_colors.dart';
// import '../../../utils/constants/sizes.dart';
// import '../../../utils/helpers/helper_function.dart';
// import '../../../common/widgets/appbar/appbar.dart';
// import 'jobs_info_card.dart';
// import 'jobs_table.dart';

// class JobsDesktop extends StatelessWidget {
//   const JobsDesktop({super.key, required this.jobs});

//   final List<Map<String, dynamic>> jobs;

//   @override
//   Widget build(BuildContext context) {
//     final dark = HelperFunction.isDarkMode(context);
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CustomAppbar(title: 'Jobs'),

//         Expanded(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(Sizes.spaceBtwSections),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.all(Sizes.sm),
//                           child: JobsInfoCard(
//                             color: CustomColors.success,
//                             title: 'Completed Jobs',
//                             subtitle: '',
//                             value: '100525000',
//                           ),
//                         ),
//                       ),

//                       Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.all(Sizes.sm),
//                           child: JobsInfoCard(
//                             color: CustomColors.warning,
//                             title: 'Pending Jobs',
//                             subtitle: '',
//                             value: '75605230',
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: Sizes.spaceBtwSections),
//                   RoundedContainer(
//                     padding: const EdgeInsets.all(Sizes.sm),
//                     radius: Sizes.cardRadiusSm,
//                     backgroundColor: dark
//                         ? Colors.white.withValues(alpha: 0.1)
//                         : Colors.black.withValues(alpha: 0.1),
//                     borderColor: dark ? Colors.white : Colors.black,
//                     child: JobsTable(jobs: jobs),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../controllers/jobs_controller/jobs_controller.dart';
import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../../../common/widgets/appbar/appbar.dart';
import 'jobs_info_card.dart';
import 'jobs_table.dart';

class JobsDesktop extends ConsumerStatefulWidget {
  const JobsDesktop({super.key});

  @override
  ConsumerState<JobsDesktop> createState() => _JobsDesktopState();
}

class _JobsDesktopState extends ConsumerState<JobsDesktop> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final controller = ref.read(jobProvider.notifier);
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      controller.loadMoreJobs();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final jobsState = ref.watch(jobProvider);
    final controller = ref.read(jobProvider.notifier);
    final dark = HelperFunction.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppbar(title: 'Jobs'),

        Expanded(
          child: jobsState.when(
            data: (jobs) {
              return SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(Sizes.spaceBtwSections),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ====== INFO CARDS ======
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // All Jobs
                          Expanded(
                            child: GestureDetector(
                              onTap: () =>
                                  controller.setFilter(JobFilter.all),
                              child: Padding(
                                padding: const EdgeInsets.all(Sizes.sm),
                                child: JobsInfoCard(
                                  color: controller.currentFilter ==
                                          JobFilter.all
                                      ? CustomColors.primary
                                      : Colors.grey,
                                  title: 'All Jobs',
                                  subtitle: '',
                                  value: '${jobs.length}',
                                ),
                              ),
                            ),
                          ),

                          // Completed Jobs
                          Expanded(
                            child: GestureDetector(
                              onTap: () =>
                                  controller.setFilter(JobFilter.completed),
                              child: Padding(
                                padding: const EdgeInsets.all(Sizes.sm),
                                child: JobsInfoCard(
                                  color: controller.currentFilter ==
                                          JobFilter.completed
                                      ? CustomColors.success
                                      : Colors.grey,
                                  title: 'Completed Jobs',
                                  subtitle: '',
                                  value:
                                      '${controller.completedJobs}',
                                ),
                              ),
                            ),
                          ),

                          // Pending Jobs
                          Expanded(
                            child: GestureDetector(
                              onTap: () =>
                                  controller.setFilter(JobFilter.pending),
                              child: Padding(
                                padding: const EdgeInsets.all(Sizes.sm),
                                child: JobsInfoCard(
                                  color: controller.currentFilter ==
                                          JobFilter.pending
                                      ? CustomColors.warning
                                      : Colors.grey,
                                  title: 'Pending Jobs',
                                  subtitle: '',
                                  value:
                                      '${controller.pendingJobs}',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: Sizes.spaceBtwSections),

                      // ====== JOBS TABLE ======
                      RoundedContainer(
                        padding: const EdgeInsets.all(Sizes.sm),
                        radius: Sizes.cardRadiusSm,
                        backgroundColor: dark
                            ? Colors.white.withValues(alpha: 0.1)
                            : Colors.black.withValues(alpha: 0.1),
                        borderColor: dark ? Colors.white : Colors.black,
                        child: JobsTable(jobs: jobs),
                      ),

                      const SizedBox(height: Sizes.spaceBtwItems),
                      if (jobsState.isLoading)
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(child: CircularProgressIndicator()),
                        ),
                    ],
                  ),
                ),
              );
            },
            loading: () =>
                const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text(e.toString())),
          ),
        ),
      ],
    );
  }
}
