import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
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
      mobileBody: Column(
        children: [
          UsersTable(
          users: users,
        ),
        ],
      ),
      tabletBody: Column(
        children: [
          UsersTable(
          users: users,
        ),
        ],
      ),
      desktopBody: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            CustomHeader(),
            
          UsersTable(
            users: users,
          ),
        ],
      ),
    );
  }
}
