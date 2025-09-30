import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class JobsPerWeekChart extends StatelessWidget {
  final double? width;
  final List<JobData> jobsData = [
    JobData('Sun', 12),
    JobData('Mon', 18),
    JobData('Tue', 9),
    JobData('Wed', 20),
    JobData('Thu', 14),
    JobData('Fri', 25),
    JobData('Sat', 30),
  ];

  JobsPerWeekChart({
    super.key,
    this.width
    });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return RoundedContainer(
      width: width,
      padding: const EdgeInsets.all(Sizes.spaceBtwItems),
      backgroundColor: dark ? Colors.white.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Weekly Job Execution',
          style: Theme.of(context).textTheme.labelMedium,),

          const SizedBox(height: Sizes.spaceBtwSections,),
          SfCartesianChart(
            plotAreaBorderWidth: 0,
            legend: const Legend(isVisible: false),
            primaryXAxis: CategoryAxis(
              majorGridLines: const MajorGridLines(width: 0),
              labelStyle: Theme.of(context).textTheme.labelSmall,
              interval: 2,
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
                width: 0.4,
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
                    Color(0xFFA0BCE8),
                    Color(0xFF6BE6D3),
                    Color(0xFFADADFB),
                    Color(0xFF7DBBFF),
                    Color(0xFFB899EB),
                    Color(0xFF71DD8C),
                    Color(0xFFA0BCE8),
                    Color(0xFF6BE6D3),
                    Color(0xFFADADFB),
                    Color(0xFF7DBBFF),
                    Color(0xFFB899EB),
                    Color(0xFF71DD8C),
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