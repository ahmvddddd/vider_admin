import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/routes.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import 'sidebar_widget.dart';

class CustomSideBar extends StatelessWidget {
  const CustomSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return Drawer(
      width: 250,
      shape: BeveledRectangleBorder(),
      child: Container(
        decoration: BoxDecoration(
          color: dark ? Colors.black : Colors.white,
          border: Border(
            right: BorderSide(color: CustomColors.darkGrey, width: 0.3),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox(height: Sizes.spaceBtwSections),
              Padding(
                padding: const EdgeInsets.all(Sizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    const SizedBox(height: Sizes.spaceBtwSections),
                    SideBarWidget(
                      title: 'Dashboard',
                      icon: Iconsax.activity,
                      route: Routes.dashboard,
                    ),

                    const SizedBox(height: Sizes.md),
                    SideBarWidget(
                      title: 'Users',
                      icon: Iconsax.user,
                      route: Routes.users,
                    ),

                    const SizedBox(height: Sizes.md),
                    SideBarWidget(
                      title: 'Jobs',
                      icon: Icons.cases_rounded,
                      route: Routes.register,
                    ),

                    const SizedBox(height: Sizes.md),
                    SideBarWidget(
                      title: 'Transactions',
                      icon: Iconsax.bank,
                      route: '/transactions',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
