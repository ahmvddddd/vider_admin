import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/custom_colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/device/device_utility.dart';

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;

  const ResponsiveAppBar({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Breakpoints: Desktop >= 1024, Tablet >= 600
        if (constraints.maxWidth >= 1024) {
          // Desktop: show nav widgets directly
          return AppBar(
            title: const Text("d"),
            leadingWidth: 250, // enough space for widgets
            leading: Row(children: [const SizedBox(width: 8), ...actions]),
          );
        } else {
          // Tablet/Mobile: show menu icon
          return AppBar(
            title: const Text("m"),
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.red,
                size: Sizes.iconM,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          );
        }
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  
    final GlobalKey<ScaffoldState>? scaffoldKey;
  const CustomHeader({super.key, this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: CustomColors.darkGrey, width: 0.5),
        ),
      ),
      child: AppBar(
        leading: !DeviceUtils.isDeskTopScreen(context)
            ? IconButton(
                onPressed: () {
                  scaffoldKey?.currentState!.openDrawer();
                },
                icon: Icon(Iconsax.menu, color: Colors.red, size: Sizes.iconM),
              )
            : null,
        title: Text('title', style: Theme.of(context).textTheme.headlineSmall),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, size: Sizes.iconM),
          ),

          const SizedBox(width: Sizes.sm),
          CircleAvatar(
            radius: 13,
            child: Icon(Iconsax.user, size: Sizes.iconM),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight());
}
