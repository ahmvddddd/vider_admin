import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../utils/constants/responsive_sizes.dart';
import '../../utils/constants/sizes.dart';
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
      "userType": "Provider"
    },
    {
      "userId": "002",
      "profileImage": Iconsax.user,
      "firstName": "Jane",
      "lastName": "Smith",
      "username": "janesmith",
      "email": "janel@gmail.com",
      "isVerified": false,
      "userType": "Employer"
    },
    {
      "userId": "003",
      "profileImage": Iconsax.user,
      "firstName": "Michael",
      "lastName": "Brown",
      "username": "mikeb",
      "email": "micheal@gmail.com",
      "isVerified": true,
      "userType": "Provider"
    },
  ];

  UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      mobileBody: SingleChildScrollView(
        child: Column(
          children: [
        
            Padding(
                padding: const EdgeInsets.all(Sizes.spaceBtwSections),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DashboardOverview(
                            width: responsiveSize(context, 170),
                          backgroundColor: Color(0xFF7DBBFF),
                          title: 'Clients',
                          amount: 100525000,
                        ),
          
                        DashboardOverview(
                            width: responsiveSize(context, 170),
                          backgroundColor: Color(0xFFB899EB),
                          title: 'Providers',
                          amount: 75605230,
                        ),
                  ],
                ),),
        
            UsersTable(
            users: users,
          ),
          ],
        ),
      ),
      tabletBody: SingleChildScrollView(
        child: Column(
          children: [
        
            Padding(
                padding: const EdgeInsets.all(Sizes.spaceBtwSections),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DashboardOverview(
                            width: responsiveSize(context, 176),
                          backgroundColor: Color(0xFF7DBBFF),
                          title: 'Clients',
                          amount: 100525000,
                        ),
          
                        DashboardOverview(
                            width: responsiveSize(context, 176),
                          backgroundColor: Color(0xFFB899EB),
                          title: 'Providers',
                          amount: 75605230,
                        ),
                  ],
                ),),
        
            UsersTable(
            users: users,
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
                    DashboardOverview(
                          width: 200,
                          backgroundColor: Color(0xFF7DBBFF),
                          title: 'Clients',
                          amount: 100525000,
                        ),
          
                        DashboardOverview(
                          width: 200,
                          backgroundColor: Color(0xFFB899EB),
                          title: 'Providers',
                          amount: 75605230,
                        ),
                  ],
                ),),
              
            UsersTable(
              users: users,
            ),
          ],
        ),
      ),
    );
  }
}
