import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/responsive_sizes.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../sidebar/sidebar_widget.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: CustomColors.darkGrey, width: 0.3),
        ),
      ),
      child: Drawer(
        width: responsiveSize(context, 300),
        backgroundColor: dark ? Colors.black : Colors.white,
        shape: BeveledRectangleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(Sizes.spaceBtwItems),
          child: ListView(
            children: [
              SizedBox(height: responsiveSize(context, Sizes.spaceBtwSections)),
              SideBarWidget(route: '/', icon: Iconsax.activity, title: 'Dashboard'),
              
              SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
              SideBarWidget(route: '/', icon: Iconsax.user, title: 'Users'),
          
              SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
              SideBarWidget(route: '/', icon: Icons.cases_rounded, title: 'Jobs'),
          
              SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
              SideBarWidget(route: '/', icon: Iconsax.bank, title: 'Transactions'),
          
              SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
              SideBarWidget(route: '/', icon: Iconsax.check, title: 'Approvals'),
          
              SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
              SideBarWidget(route: '/', icon: Icons.notifications, title: 'Notifications'),
          
              SizedBox(height: responsiveSize(context, Sizes.spaceBtwSections)),
              SideBarWidget(route: '/', icon: Iconsax.logout, title: 'Sign Out'),
              ListTile(
                title: Text(
                  "Settings",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}