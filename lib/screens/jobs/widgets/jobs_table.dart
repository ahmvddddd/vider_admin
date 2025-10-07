import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';

class JobsTable extends StatelessWidget {
  final List<Map<String, dynamic>> jobs;
  const JobsTable({super.key, required this.jobs});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.sm),
          child: DataTable(
            columnSpacing: 30,
            border:  TableBorder.all(color: Colors.transparent),
            columns: [
              DataColumn(
                label: Text(
                  "Index",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              DataColumn(
                label: Text(
                  "ID",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              DataColumn(
                label: Text(
                  "Profile Image",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              DataColumn(
                label: Text(
                  "Provider",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              DataColumn(
                label: Text(
                  "Employer",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              DataColumn(
                label: Text(
                  "Job",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              DataColumn(
                label: Text(
                  "Pay",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              DataColumn(
                label: Text(
                  "Status",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              DataColumn(
                label: Text(
                  "Duration",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              DataColumn(
                label: Text(
                  "Date",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
            rows: List<DataRow>.generate(jobs.length, (index) {
              final job = jobs[index];
              return DataRow(
                cells: [
                  DataCell(
                    Text(
                      (index + 1).toString(),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ), // index on Y axis
                  DataCell(
                    Text(
                      job["_id"].toString(),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataCell(
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.grey,
                      child: Icon(
                        job["profileImage"],
                        color: Colors.white,
                        size: Sizes.iconSm,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      job["providerName"].toString(),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataCell(
                    Text(
                      job["employerName"].toString(),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataCell(
                    Text(
                      job["jobTitle"].toString(),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataCell(
                    Text(
                      job["pay"].toString(),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataCell(
                    Text(
                      job["status"].toString(),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: (job["status"] == "completed")
                            ? Colors.green
                            : (job["status"] == "pending")
                            ? Colors.amber
                            : Colors.red,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      job["duration"].toString(),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataCell(
                    Text(
                      job["startTime"].toString(),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
