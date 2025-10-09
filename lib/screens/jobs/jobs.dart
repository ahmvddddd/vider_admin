import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../utils/constants/responsive_sizes.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_function.dart';
import '../dashboard/widgets/dashboard_overview.dart';
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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final dark = HelperFunction.isDarkMode(context);
    return ResponsiveScaffold(
      mobileBody: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(
              responsiveSize(context, Sizes.spaceBtwItems),
            ),
            child: SizedBox(
              height: screenHeight * 0.18,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: EdgeInsets.all(responsiveSize(context, 4)),
                    child: DashboardOverview(
                      width: screenWidth * 0.70,
                      backgroundColor: Color(0xFF7DBBFF),
                      title: 'Completed Jobs',
                      amount: 100525000,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(responsiveSize(context, 4)),
                    child: DashboardOverview(
                      width: screenWidth * 0.70,
                      backgroundColor: Color(0xFFB899EB),
                      title: 'Pending Jobs',
                      amount: 75605230,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
          Padding(
            padding: EdgeInsets.all(
              responsiveSize(context, Sizes.spaceBtwItems),
            ),
            child: RoundedContainer(
              padding: EdgeInsets.all(responsiveSize(context, Sizes.sm)),
              backgroundColor: Colors.transparent,
              showBorder: true,
              borderColor: dark ? Colors.white : Colors.black,
              child: JobsTable(jobs: jobs),
            ),
          ),
        ],
      ),
      tabletBody: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(
              responsiveSize(context, Sizes.spaceBtwItems),
            ),
            child: SizedBox(
              height: responsiveSize(context, 120),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: EdgeInsets.all(responsiveSize(context, 4)),
                    child: DashboardOverview(
                      width: screenWidth * 0.30,
                      backgroundColor: Color(0xFF7DBBFF),
                      title: 'Completed Jobs',
                      amount: 100525000,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(responsiveSize(context, 4)),
                    child: DashboardOverview(
                      width: screenWidth * 0.30,
                      backgroundColor: Color(0xFFB899EB),
                      title: 'Pending Jobs',
                      amount: 75605230,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
          Padding(
            padding: EdgeInsets.all(
              responsiveSize(context, Sizes.spaceBtwItems),
            ),
            child: RoundedContainer(
              padding: EdgeInsets.all(responsiveSize(context, Sizes.sm)),
              backgroundColor: Colors.transparent,
              showBorder: true,
              borderColor: dark ? Colors.white : Colors.black,
              child: JobsTable(jobs: jobs),
            ),
          ),
        ],
      ),
      desktopBody: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeader(),
        
            Padding(
              padding: const EdgeInsets.all(Sizes.spaceBtwSections),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text('Jobs',
                  style: Theme.of(context).textTheme.bodySmall,),
                  
                  const SizedBox(height: Sizes.spaceBtwItems,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: DashboardOverview(
                          width: 200,
                          backgroundColor: Color(0xFF7DBBFF),
                          title: 'Completed Jobs',
                          amount: 100525000,
                        ),
                      ),
                          
                      Expanded(
                        child: DashboardOverview(
                          width: 200,
                          backgroundColor: Color(0xFFB899EB),
                          title: 'Pending Jobs',
                          amount: 75605230,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.all(Sizes.spaceBtwSections),
              child: RoundedContainer(
                padding: const EdgeInsets.all(Sizes.sm),
                backgroundColor: Colors.transparent,
                showBorder: true,
                borderColor: dark ? Colors.white : Colors.black,
                child: JobsTable(jobs: jobs),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
