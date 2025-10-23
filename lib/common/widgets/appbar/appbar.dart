import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  const CustomAppbar({super.key, required this.title, this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.transparent, width: 0.5),
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
        title: Text(title, style: Theme.of(context).textTheme.headlineSmall),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, size: Sizes.iconM),
          ),

          const SizedBox(width: Sizes.sm),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              radius: 13,
              child: Icon(Iconsax.user, size: Sizes.iconM),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight());
}
