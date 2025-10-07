import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../utils/constants/responsive_sizes.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_function.dart';
import '../dashboard/widgets/dashboard_overview.dart';
import '../reponsive/responsive_appbar.dart';
import '../reponsive/responsive_scaffold.dart';
import 'widgets/users_table.dart';

class UsersScreen extends StatelessWidget {
  final List<Map<String, dynamic>> users = [
    {
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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final dark = HelperFunction.isDarkMode(context);

    return ResponsiveScaffold(
      mobileBody: SingleChildScrollView(
        child: Column(
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
                        title: 'Clients',
                        amount: 100525000,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(responsiveSize(context, 4)),
                      child: DashboardOverview(
                        width: screenWidth * 0.70,
                        backgroundColor: Color(0xFFB899EB),
                        title: 'Providers',
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
                padding: const EdgeInsets.all(Sizes.sm),
                backgroundColor: Colors.transparent,
                showBorder: true,
                borderColor: dark ? Colors.white : Colors.black,
                child: UsersTable(users: users),
              ),
            ),
          ],
        ),
      ),
      tabletBody: SingleChildScrollView(
        child: Column(
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
                        width: screenWidth * 0.70,
                        backgroundColor: Color(0xFF7DBBFF),
                        title: 'Clients',
                        amount: 100525000,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(responsiveSize(context, 4)),
                      child: DashboardOverview(
                        width: screenWidth * 0.70,
                        backgroundColor: Color(0xFFB899EB),
                        title: 'Providers',
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
                padding: const EdgeInsets.all(Sizes.sm),
                backgroundColor: Colors.transparent,
                showBorder: true,
                borderColor: dark ? Colors.white : Colors.black,
                child: UsersTable(users: users),
              ),
            ),
          ],
        ),
      ),
      desktopBody: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeader(),

            Padding(
              padding: const EdgeInsets.all(Sizes.spaceBtwSections),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: DashboardOverview(
                      width: responsiveSize(context, 200),
                      backgroundColor: Color(0xFF7DBBFF),
                      title: 'Clients',
                      amount: 100525000,
                    ),
                  ),

                  Expanded(
                    child: DashboardOverview(
                      width: responsiveSize(context, 200),
                      backgroundColor: Color(0xFFB899EB),
                      title: 'Providers',
                      amount: 75605230,
                    ),
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
                child: UsersTable(users: users),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
