import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vider_admin/common/widgets/appbar/appbar.dart';
import '../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../utils/constants/responsive_sizes.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_function.dart';
import '../dashboard/widgets/dashboard_overview.dart';
import '../reponsive/responsive_scaffold.dart';
import 'widgets/users_table.dart';

class UsersScreen extends StatelessWidget {
  final List<Map<String, dynamic>> users = [
    {
      "date": DateTime.now(),
      "userId": "001",
      "profileImage": Iconsax.user,
      "firstName": "John",
      "lastName": "Doe",
      "username": "johndoe",
      "email": "john@gmail.com",
      "isVerified": true,
      "userType": "Provider",
    },
    {
      "date": DateTime.now(),
      "userId": "002",
      "profileImage": Iconsax.user,
      "firstName": "Jane",
      "lastName": "Smith",
      "username": "janesmith",
      "email": "janel@gmail.com",
      "isVerified": false,
      "userType": "Employer",
    },
    {
      "date": DateTime.now(),
      "userId": "003",
      "profileImage": Iconsax.user,
      "firstName": "Michael",
      "lastName": "Brown",
      "username": "mikeb",
      "email": "micheal@gmail.com",
      "isVerified": true,
      "userType": "Provider",
    },
  ];

  UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final dark = HelperFunction.isDarkMode(context);

    return ResponsiveScaffold(
      title: 'Users',
      mobileBody: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(
                responsiveSize(context, Sizes.spaceBtwItems),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: responsiveSize(context, 4),
                    ),
                    child: DashboardOverview(
                      width: screenWidth * 0.90,
                      backgroundColor: Color(0xFF7DBBFF),
                      title: 'Clients',
                      amount: 100525000,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: responsiveSize(context, 4),
                    ),
                    child: DashboardOverview(
                      width: screenWidth * 0.90,
                      backgroundColor: Color(0xFFB899EB),
                      title: 'Providers',
                      amount: 75605230,
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
                child: UsersTable(users: users),
              ),
            ),
          ],
        ),
      ),
      tabletBody: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(
                responsiveSize(context, Sizes.spaceBtwItems),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(responsiveSize(context, 4)),
                      child: DashboardOverview(
                        backgroundColor: Color(0xFF7DBBFF),
                        title: 'Clients',
                        amount: 100525000,
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(responsiveSize(context, 4)),
                      child: DashboardOverview(
                        backgroundColor: Color(0xFFB899EB),
                        title: 'Providers',
                        amount: 75605230,
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
                child: UsersTable(users: users),
              ),
            ),
          ],
        ),
      ),
      desktopBody: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppbar(title: 'Users'),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Sizes.spaceBtwItems),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(Sizes.xs),
                      child: DashboardOverview(
                        backgroundColor: Color(0xFF7DBBFF),
                        title: 'Clients',
                        amount: 100525000,
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: DashboardOverview(
                        backgroundColor: Color(0xFFB899EB),
                        title: 'Providers',
                        amount: 75605230,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: Sizes.spaceBtwItems),
          Padding(
            padding: const EdgeInsets.all(Sizes.spaceBtwItems),
            child: RoundedContainer(
              padding: const EdgeInsets.all(Sizes.sm),
              radius: Sizes.cardRadiusSm,
              backgroundColor: dark
                  ? Colors.white.withValues(alpha: 0.1)
                  : Colors.black.withValues(alpha: 0.1),
              child: UsersTable(users: users),
            ),
          ),
        ],
      ),
    );
  }
}
