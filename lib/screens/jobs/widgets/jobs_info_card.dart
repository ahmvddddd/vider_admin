import 'package:flutter/material.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class JobsInfoCard extends StatelessWidget {
  final double? width;
  final Color color;
  final String title;
  final String subtitle;
  final String value;

  const JobsInfoCard({
    super.key,
    this.width,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.value,
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
      radius: Sizes.cardRadiusMd,
      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
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
                child: Icon(Icons.cases_rounded, color: color),
              ),
              const SizedBox(width: Sizes.sm),
              Text(title, style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
          const SizedBox(height: Sizes.spaceBtwItems),
          Text(value, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: Sizes.sm),
          Text(subtitle, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
