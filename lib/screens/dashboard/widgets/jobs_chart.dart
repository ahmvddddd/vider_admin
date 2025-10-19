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
      padding: const EdgeInsets.all(Sizes.spaceBtwItems),
      backgroundColor: dark
          ? Colors.white.withValues(alpha: 0.1)
          : Colors.black.withValues(alpha: 0.1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Monthly Job Execution',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: Sizes.spaceBtwSections),
          SfCartesianChart(
            plotAreaBorderWidth: 0,
            legend: const Legend(isVisible: false),
            primaryXAxis: CategoryAxis(
              majorGridLines: const MajorGridLines(width: 0),
              majorTickLines: const MajorTickLines(size: 0),
              axisLine: const AxisLine(width: 0),
              labelStyle: Theme.of(context).textTheme.labelSmall,
              interval: 2,
            ),
            primaryYAxis: NumericAxis(
              majorGridLines: const MajorGridLines(width: 0),
              majorTickLines: const MajorTickLines(size: 0),
              axisLine: const AxisLine(width: 0),
              labelStyle: Theme.of(context).textTheme.labelSmall,
              interval: 10,
            ),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries>[
              LineSeries<JobData, String>(
                dataSource: jobsData,
                xValueMapper: (JobData job, _) => job.month,
                yValueMapper: (JobData job, _) => job.count,
                color: Colors.blueAccent,
                width: 3,
                markerSettings: const MarkerSettings(isVisible: false),
                dataLabelSettings: const DataLabelSettings(isVisible: false),
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
