import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // for formatting
import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/sizes.dart';

class DashboardOverview extends StatelessWidget {
  final double? width;
  final Color backgroundColor;
  final String title;
  final num amount; // change to num for easier formatting

  const DashboardOverview({
    super.key,
    this.width,
    required this.backgroundColor,
    required this.title,
    required this.amount,
  });

  /// Convert big numbers to short form (1,000,000 -> 1M, 1,200 -> 1.2K etc.)
  String _formatAmount(num value, {bool compact = false}) {
    if (!compact) {
      return NumberFormat.decimalPattern().format(value);
    }
    if (value >= 1000000) {
      return "${(value / 1000000).toStringAsFixed(1)}M";
    } else if (value >= 1000) {
      return "${(value / 1000).toStringAsFixed(1)}K";
    } else {
      return value.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.sm),
      child: RoundedContainer(
        width: width,
        height: 100,
        padding: const EdgeInsets.all(Sizes.spaceBtwItems),
        backgroundColor: backgroundColor,
        radius: Sizes.cardRadiusXlg,
        child: LayoutBuilder(
          builder: (context, constraints) {
            // 👇 Decide compact or full based on available width
            final bool useCompact = constraints.maxWidth < 120; 
    
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
                const SizedBox(height: Sizes.sm),
                Text(
                  _formatAmount(amount, compact: useCompact),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.black,
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ).apply(letterSpacingDelta: 0.2),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

