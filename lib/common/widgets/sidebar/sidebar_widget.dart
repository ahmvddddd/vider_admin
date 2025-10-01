import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../controllers/sidebar_controller.dart';
import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../custom_shapes/containers/rounded_container.dart';

class SideBarWidget extends ConsumerWidget {
  final String route;
  final IconData icon;
  final String title;
  const SideBarWidget({
    super.key,
    required this.route,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dark = HelperFunction.isDarkMode(context);
    final state = ref.watch(sidebarControllerProvider);
    final controller = ref.read(sidebarControllerProvider.notifier);

    final isActive = state.activeItem == route;
    final isHovering = state.hoverItem == route;

    return InkWell(
      onHover: (hovering) => hovering ? controller.changeHoverItem(route) : controller.changeActiveItem(''),
      onTap: () => controller.menuOnTap(context, route),
      child: RoundedContainer(
        width: 300,
        backgroundColor: isActive || isHovering
        ? CustomColors.primary
            : dark ? Colors.white.withValues(alpha: 0.1)
                  : Colors.black.withValues(alpha: 0.1),
        radius: Sizes.cardRadiusMd,
        padding: const EdgeInsets.all(Sizes.md),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: Sizes.iconSm,
                color: isActive || isHovering
                    ? Colors.white
                    : dark
                    ? Colors.white
                    : Colors.black,
              ),
              const SizedBox(width: Sizes.md),
          
              if (isActive || isHovering)
                Flexible(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodySmall!.apply(
                      color: isActive || isHovering
                          ? Colors.white
                          : dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                )
              else
                Flexible(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.labelMedium!.apply(
                      color: isActive || isHovering
                          ? Colors.white
                          : dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
