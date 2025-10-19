import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../utils/constants/custom_colors.dart';
import '../../utils/constants/responsive_sizes.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_function.dart';
import '../reponsive/responsive_appbar.dart';
import '../reponsive/responsive_scaffold.dart';
import 'widgets/jobs_table.dart';

class JobsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> jobs = [
    {
      "_id": "001",
      "profileImage": Iconsax.user,
      "providerName": "John",
      "EmployerName": "Doe",
      "jobTitle": "johndoe",
      "pay": "\$75.00",
      "status": "completed",
      "duration": "1 hour",
      "startTime": DateTime.now(),
    },
    {
      "_id": "002",
      "profileImage": Iconsax.user,
      "providerName": "Jane",
      "employerName": "Smith",
      "jobTitle": "janesmith",
      "pay": "\$50.00",
      "status": "completed",
      "duration": "1 hour",
      "startTime": DateTime.now(),
    },
    {
      "_id": "003",
      "profileImage": Iconsax.user,
      "providerNmae": "Michael",
      "EmployerName": "Brown",
      "jobTitle": "mikeb",
      "pay": "\$100.00",
      "status": "pending",
      "duration": "2 hours",
      "startTime": DateTime.now(),
    },
  ];

  JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.height;
    final dark = HelperFunction.isDarkMode(context);
    return ResponsiveScaffold(
      title: 'Jobs',
      mobileBody: SingleChildScrollView(
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
      ),
      tabletBody: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(
                responsiveSize(context, Sizes.spaceBtwItems),
              ),
              child: Row(
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
            ),

            SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
            Padding(
              padding: EdgeInsets.all(
                responsiveSize(context, Sizes.spaceBtwItems),
              ),
              child: RoundedContainer(
                padding: const EdgeInsets.all(Sizes.sm),
                radius: Sizes.cardRadiusSm,
                backgroundColor: dark
                    ? Colors.white.withValues(alpha: 0.1)
                    : Colors.black.withValues(alpha: 0.1),
                child: JobsTable(jobs: jobs),
              ),
            ),
          ],
        ),
      ),
      desktopBody: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeader(title: 'Jobs'),

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
      ),
    );
  }
}

class JobsInfoCard extends StatelessWidget {
  final double? width;
  final Color color;
  final String title;
  final String subtitle;
  final String value;

  const JobsInfoCard({
    super.key,
    this.width,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return RoundedContainer(
      width: width,
      padding: const EdgeInsets.all(Sizes.spaceBtwItems),
      backgroundColor: dark
          ? Colors.white.withValues(alpha: 0.1)
          : Colors.black.withValues(alpha: 0.1),
      radius: Sizes.cardRadiusMd,
      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color(0xFFE3F2FD),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.cases_rounded, color: color),
              ),
              const SizedBox(width: Sizes.sm),
              Text(title, style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
          const SizedBox(height: Sizes.spaceBtwItems),
          Text(value, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: Sizes.sm),
          Text(subtitle, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
