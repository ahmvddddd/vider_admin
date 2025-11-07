import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../controllers/jobs_controller/jobs_controller.dart';
import '../../../controllers/users_controller/users_controller.dart';
import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../../../common/widgets/appbar/appbar.dart';
import '../../jobs/widgets/jobs_info_card.dart';
import '../../jobs/widgets/jobs_table.dart';
import 'users_table.dart';

class UsersDesktop extends ConsumerStatefulWidget {
  const UsersDesktop({super.key});

  @override
  ConsumerState<UsersDesktop> createState() => _UsersDesktopState();
}

class _UsersDesktopState extends ConsumerState<UsersDesktop> {
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
    final usersState = ref.watch(usersProvider);
    final controller = ref.read(usersProvider.notifier);
    final dark = HelperFunction.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppbar(title: 'Jobs'),

        Expanded(
          child: usersState.when(
            data: (users) {
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
                                  controller.setFilter(UserFilter.all),
                              child: Padding(
                                padding: const EdgeInsets.all(Sizes.sm),
                                child: JobsInfoCard(
                                  color:
                                      controller.currentFilter ==
                                          UserFilter.all
                                      ? CustomColors.primary
                                      : Colors.grey,
                                  title: 'All Users',
                                  subtitle: '',
                                  value: '${users.length}',
                                ),
                              ),
                            ),
                          ),

                          // Completed Jobs
                          Expanded(
                            child: GestureDetector(
                              onTap: () =>
                                  controller.setFilter(UserFilter.client),
                              child: Padding(
                                padding: const EdgeInsets.all(Sizes.sm),
                                child: JobsInfoCard(
                                  color:
                                      controller.currentFilter ==
                                          UserFilter.client
                                      ? CustomColors.success
                                      : Colors.grey,
                                  title: 'Clients',
                                  subtitle: '',
                                  value: '${controller.clientUsers}',
                                ),
                              ),
                            ),
                          ),

                          // Pending Jobs
                          Expanded(
                            child: GestureDetector(
                              onTap: () =>
                                  controller.setFilter(UserFilter.provider),
                              child: Padding(
                                padding: const EdgeInsets.all(Sizes.sm),
                                child: JobsInfoCard(
                                  color:
                                      controller.currentFilter ==
                                          UserFilter.provider
                                      ? CustomColors.warning
                                      : Colors.grey,
                                  title: 'Providers',
                                  subtitle: '',
                                  value: '${controller.providerUsers}',
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
                        child: UsersTable(users: users),
                      ),

                      const SizedBox(height: Sizes.spaceBtwItems),
                      if (usersState.isLoading)
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(child: CircularProgressIndicator()),
                        ),
                    ],
                  ),
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text(e.toString())),
          ),
        ),
      ],
    );
  }
}
