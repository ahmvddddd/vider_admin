import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class JobsPerMonthChart extends StatelessWidget {
  final List<JobData> jobsData = [
    JobData('Jan', 12),
    JobData('Feb', 18),
    JobData('Mar', 9),
    JobData('Apr', 20),
    JobData('May', 14),
    JobData('Jun', 25),
    JobData('Jul', 30),
    JobData('Aug', 22),
    JobData('Sep', 17),
    JobData('Oct', 28),
    JobData('Nov', 19),
    JobData('Dec', 24),
  ];

  JobsPerMonthChart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return RoundedContainer(
      width: 700,
      padding: const EdgeInsets.all(Sizes.spaceBtwItems),
      backgroundColor: dark ? Colors.white.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Monthly Job Execution',
          style: Theme.of(context).textTheme.labelMedium,),

          const SizedBox(height: Sizes.spaceBtwSections,),
          SfCartesianChart(
            plotAreaBorderWidth: 0,
            legend: const Legend(isVisible: false),
            primaryXAxis: CategoryAxis(
              majorGridLines: const MajorGridLines(width: 0),
              labelStyle: Theme.of(context).textTheme.labelSmall,
              interval: 1,
              majorTickLines: const MajorTickLines(size: 0),
              axisLine: AxisLine(width: 0),
            ),
            primaryYAxis: NumericAxis(
              majorGridLines: const MajorGridLines(width: 0),
              labelStyle: Theme.of(context).textTheme.labelSmall,
              interval: 20,
              axisLine: AxisLine(width: 0),
            ),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries>[
              ColumnSeries<JobData, String>(
                width: 0.2,
                dataSource: jobsData,
                xValueMapper: (JobData job, _) => job.month,
                yValueMapper: (JobData job, _) => job.count,
                name: 'Jobs',
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                dataLabelSettings: DataLabelSettings(isVisible: false),
                // Nice colorful bars
                pointColorMapper: (JobData job, int index) {
                  final colors = [
                    Colors.blue,
                    Colors.orange,
                    Colors.purple,
                    Colors.green,
                    Colors.red,
                    Colors.teal,
                    Colors.pink,
                    Colors.indigo,
                    Colors.cyan,
                    Colors.amber,
                    Colors.deepPurple,
                    Colors.lime,
                  ];
                  return colors[index % colors.length];
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class JobData {
  final String month;
  final int count;

  JobData(this.month, this.count);
}
