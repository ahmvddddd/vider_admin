import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class JobsByCountryPieChart extends StatelessWidget {
  final double? width;
  final List<CountryJobData> countryData = [
    CountryJobData('China', 120),
    CountryJobData('Nigeria', 95),
    CountryJobData('USA', 80),
    CountryJobData('Brazil', 70),
    CountryJobData('UK', 65),
  ];

  JobsByCountryPieChart({
    super.key,
    this.width
    });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return RoundedContainer(
      width: width,
      padding: const EdgeInsets.all(Sizes.spaceBtwItems),
      backgroundColor: dark
          ? Colors.white.withValues(alpha: 0.1)
          : Colors.black.withValues(alpha: 0.1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top 5 Countries with Highest Job Executions',
            style: Theme.of(context).textTheme.labelMedium,
          ),

          const SizedBox(height: Sizes.spaceBtwSections),
          SfCircularChart(
            legend: Legend(
              isVisible: true,
              iconHeight: 10,
              iconWidth: 10,
              overflowMode: LegendItemOverflowMode.wrap,
              position: LegendPosition.bottom,
              textStyle: Theme.of(context).textTheme.labelSmall,
            ),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CircularSeries>[
              DoughnutSeries<CountryJobData, String>(
                dataSource: countryData,
                xValueMapper: (CountryJobData data, _) => data.country,
                yValueMapper: (CountryJobData data, _) => data.jobs,
                dataLabelSettings: const DataLabelSettings(isVisible: false),
                explode: true, // makes one slice pop out
                explodeIndex: 0, // highlight the top country
                pointColorMapper: (CountryJobData data, int index) {
                  final colors = [
                    Color(0xFFA0BCE8),
                    Color(0xFF6BE6D3),
                    Color(0xFFADADFB),
                    Color(0xFF7DBBFF),
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

class CountryJobData {
  final String country;
  final int jobs;

  CountryJobData(this.country, this.jobs);
}
