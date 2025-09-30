import 'package:flutter/material.dart';

import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/sizes.dart';

class DashboardOverview extends StatelessWidget {
  final double? width;
  final Color backgroundColor;
  final String title;
  final String amount;
  const DashboardOverview({
    super.key,
    this.width,
    required this.backgroundColor,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.sm),
        child: RoundedContainer(
          width: width,
          height: 100,
          padding: const EdgeInsets.all(Sizes.spaceBtwItems),
          backgroundColor: backgroundColor,
          radius: Sizes.cardRadiusXlg,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis
                  ),
              ),

              const SizedBox(height: Sizes.sm),
              Text(
                amount,
                style: Theme.of(context).textTheme.bodySmall!
                    .copyWith(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis
                    )
                    .apply(letterSpacingDelta: 0.2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
