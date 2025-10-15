import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'jobs_table.dart';

class JobsDesktop extends StatelessWidget {
  const JobsDesktop({super.key});

  @override
  Widget build(BuildContext context) {final List<Map<String, dynamic>> jobs = [
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
    return Scaffold(
      body: Row(
          children: [
      
            // Main Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        InfoCard(
                          title: 'Total Client',
                          value: '150',
                          subtitle: 'In the last 30 days',
                        ),
                        InfoCard(
                          title: 'Partnership Request Received',
                          value: '50',
                          subtitle: 'In the last 30 days',
                        ),
                        InfoCard(
                          title: 'Open Vacancies',
                          value: '20',
                          subtitle: 'In the last 30 days',
                        ),
                      ],
                    ),
      
                    // Job Applications Table
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 4)],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('New Job Application Received',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                Text('See All Application',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: JobsTable(
                                  jobs: jobs,
                                ),
                                // child: DataTable(
                                //   columns: const [
                                //     DataColumn(label: Text('No')),
                                //     DataColumn(label: Text('Application ID')),
                                //     DataColumn(label: Text("Applicant's Name")),
                                //     DataColumn(label: Text("Applicant's Email")),
                                //     DataColumn(label: Text("Applicant's Role")),
                                //     DataColumn(label: Text('Application Received')),
                                //   ],
                                //   rows: const [
                                //     DataRow(cells: [
                                //       DataCell(Text('1')),
                                //       DataCell(Text('2025/V/APP/0001')),
                                //       DataCell(Text('Ralph Edwards')),
                                //       DataCell(Text('ralph@yeedev.id')),
                                //       DataCell(Text('Frontend Engineer')),
                                //       DataCell(Text('2 hours ago')),
                                //     ]),
                                //     DataRow(cells: [
                                //       DataCell(Text('2')),
                                //       DataCell(Text('2025/V/APP/0002')),
                                //       DataCell(Text('Savannah Nguyen')),
                                //       DataCell(Text('savannah@yeedev.id')),
                                //       DataCell(Text('Frontend Engineer')),
                                //       DataCell(Text('15 Mei, 16:40')),
                                //     ]),
                                //     DataRow(cells: [
                                //       DataCell(Text('3')),
                                //       DataCell(Text('2025/V/APP/0003')),
                                //       DataCell(Text('Wade Warren')),
                                //       DataCell(Text('wade@yeedev.id')),
                                //       DataCell(Text('Product Manager')),
                                //       DataCell(Text('15 Mei, 09:24')),
                                //     ]),
                                //     DataRow(cells: [
                                //       DataCell(Text('4')),
                                //       DataCell(Text('2025/V/APP/0004')),
                                //       DataCell(Text('Courtney Henry')),
                                //       DataCell(Text('courtney@yeedev.id')),
                                //       DataCell(Text('Backend Engineer')),
                                //       DataCell(Text('15 Mei, 08:10')),
                                //     ]),
                                //     DataRow(cells: [
                                //       DataCell(Text('5')),
                                //       DataCell(Text('2025/V/APP/0005')),
                                //       DataCell(Text('Devon Lane')),
                                //       DataCell(Text('devon@yeedev.id')),
                                //       DataCell(Text('Backend Engineer')),
                                //       DataCell(Text('14 Mei, 18:55')),
                                //     ]),
                                //   ],
                                // ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;
  final Color? color;

  const SidebarItem(
      {super.key,
      required this.icon,
      required this.title,
      this.selected = false,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: color ?? (selected ? Colors.blue : Colors.grey)),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
                color: color ?? (selected ? Colors.blue : Colors.black87),
                fontWeight: selected ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;

  const InfoCard(
      {super.key,
      required this.title,
      required this.value,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
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
                  child: const Icon(Icons.people, color: Colors.blue),
                ),
                const SizedBox(width: 8),
                Text(title,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            Text(value,
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(subtitle, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
