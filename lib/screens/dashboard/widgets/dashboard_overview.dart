import 'package:flutter/material.dart';

import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/sizes.dart';

class DashboardOverview extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final String amount;
  const DashboardOverview({
    super.key,
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
          height: 100,
          padding: const EdgeInsets.all(Sizes.spaceBtwItems),
          backgroundColor: backgroundColor,
          radius: Sizes.cardRadiusLg,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: Colors.black),
              ),

              const SizedBox(height: Sizes.sm),
              Text(
                amount,
                style: Theme.of(context).textTheme.headlineSmall!
                    .copyWith(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',
                      fontWeight: FontWeight.bold,
                    )
                    .apply(letterSpacingDelta: 0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
