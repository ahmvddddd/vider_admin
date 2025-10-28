import 'package:flutter/material.dart';
import 'package:vider_admin/common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../models/jobs_model/jobs_model.dart';
import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class JobsTable extends StatelessWidget {
  final List<JobsModel> jobs;
  const JobsTable({super.key, required this.jobs});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.sm),
          child: DataTable(
            columnSpacing: 100,
            border: TableBorder.all(color: Colors.transparent),
            columns: [
              DataColumn(
                label: RoundedContainer(
                  backgroundColor: dark
                      ? CustomColors.alternate.withValues(alpha: 0.2)
                      : CustomColors.primary.withValues(alpha: 0.2),
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.sm,
                    horizontal: Sizes.md,
                  ),
                  radius: Sizes.cardRadiusSm,
                  child: Text(
                    "Index",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              DataColumn(
                label: RoundedContainer(
                        backgroundColor: dark ? CustomColors.alternate.withValues(alpha: 0.2) : CustomColors.primary.withValues(alpha: 0.2),
                        padding: const EdgeInsets.symmetric(vertical: Sizes.sm, horizontal: Sizes.md),
                        radius: Sizes.cardRadiusSm,
                  child: Text(
                    "ID",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              DataColumn(
                label: RoundedContainer(
                        backgroundColor: dark ? CustomColors.alternate.withValues(alpha: 0.2) : CustomColors.primary.withValues(alpha: 0.2),
                        padding: const EdgeInsets.symmetric(vertical: Sizes.sm, horizontal: Sizes.md),
                        radius: Sizes.cardRadiusSm,
                  child: Text(
                    "Profile Image",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              DataColumn(
                label: RoundedContainer(
                        backgroundColor: dark ? CustomColors.alternate.withValues(alpha: 0.2) : CustomColors.primary.withValues(alpha: 0.2),
                        padding: const EdgeInsets.symmetric(vertical: Sizes.sm, horizontal: Sizes.md),
                        radius: Sizes.cardRadiusSm,
                  child: Text(
                    "Provider",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              DataColumn(
                label: RoundedContainer(
                        backgroundColor: dark ? CustomColors.alternate.withValues(alpha: 0.2) : CustomColors.primary.withValues(alpha: 0.2),
                        padding: const EdgeInsets.symmetric(vertical: Sizes.sm, horizontal: Sizes.md),
                        radius: Sizes.cardRadiusSm,
                  child: Text(
                    "Employer",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              DataColumn(
                label: RoundedContainer(
                        backgroundColor: dark ? CustomColors.alternate.withValues(alpha: 0.2) : CustomColors.primary.withValues(alpha: 0.2),
                        padding: const EdgeInsets.symmetric(vertical: Sizes.sm, horizontal: Sizes.md),
                        radius: Sizes.cardRadiusSm,
                  child: Text(
                    "Job",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              DataColumn(
                label: RoundedContainer(
                        backgroundColor: dark ? CustomColors.alternate.withValues(alpha: 0.2) : CustomColors.primary.withValues(alpha: 0.2),
                        padding: const EdgeInsets.symmetric(vertical: Sizes.sm, horizontal: Sizes.md),
                        radius: Sizes.cardRadiusSm,
                  child: Text(
                    "Pay",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              DataColumn(
                label: RoundedContainer(
                        backgroundColor: dark ? CustomColors.alternate.withValues(alpha: 0.2) : CustomColors.primary.withValues(alpha: 0.2),
                        padding: const EdgeInsets.symmetric(vertical: Sizes.sm, horizontal: Sizes.md),
                        radius: Sizes.cardRadiusSm,
                  child: Text(
                    "Status",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              DataColumn(
                label: RoundedContainer(
                        backgroundColor: dark ? CustomColors.alternate.withValues(alpha: 0.2) : CustomColors.primary.withValues(alpha: 0.2),
                        padding: const EdgeInsets.symmetric(vertical: Sizes.sm, horizontal: Sizes.md),
                        radius: Sizes.cardRadiusSm,
                  child: Text(
                    "Duration",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              DataColumn(
                label: RoundedContainer(
                        backgroundColor: dark ? CustomColors.alternate.withValues(alpha: 0.2) : CustomColors.primary.withValues(alpha: 0.2),
                        padding: const EdgeInsets.symmetric(vertical: Sizes.sm, horizontal: Sizes.md),
                        radius: Sizes.cardRadiusSm,
                  child: Text(
                    "Date",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
            ],
            rows: List<DataRow>.generate(jobs.length, (index) {
             
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
                      jobs[index].id,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataCell(
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.grey,
                      child: Image.network(
                        jobs[index].providerImage ?? '',
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      jobs[index].providerName,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      jobs[index].employerName,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      jobs[index].jobTitle,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      jobs[index].pay.toString(),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      jobs[index].status,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: (jobs[index].status == "completed")
                            ? Colors.green
                            : (jobs[index].status == "pending")
                            ? Colors.amber
                            : Colors.red,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      jobs[index].duration.toString(),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      jobs[index].startTime.toString(),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
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
