import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../reponsive/responsive_scaffold.dart';
import 'widgets/jobs_desktop.dart';
import 'widgets/jobs_mobile.dart';
import 'widgets/jobs_tablet.dart';

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
    return ResponsiveScaffold(
      title: 'Jobs',
      mobileBody: JobsMobile(),
      tabletBody: JobsTablet(),
      desktopBody: JobsDesktop(),
    );
  }
}