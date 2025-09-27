import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../controllers/sidebar_controller.dart';
import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/routes.dart';
import '../../../utils/constants/sizes.dart';
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
  final state = ref.watch(sidebarControllerProvider);
  final controller = ref.read(sidebarControllerProvider.notifier);

  final isActive = state.activeItem == Routes.splash;
  final isHovering = state.hoverItem == Routes.splash;

  return InkWell(
    onHover: (hovering) {
      controller.changeHoverItem(hovering ? route : '');
    },
    onTap: () => controller.menuOnTap(context, route),
    child: RoundedContainer(
      backgroundColor: isActive || isHovering
          ? CustomColors.primary
          : Colors.transparent,
      radius: Sizes.cardRadiusMd,
      padding: const EdgeInsets.all(Sizes.md),
      child: Row(
        children: [
          Icon(icon, 
          size: Sizes.iconSm,
          color: isActive || isHovering
          ? Colors.white
          : CustomColors.darkGrey,),
          const SizedBox(width: Sizes.md),

          if(isActive || isHovering)
          Flexible(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: Colors.white),
            ),
          )
          else
          Flexible(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: CustomColors.darkGrey),
            ),
          ),
        ],
      ),
    ),
  );
}

}
