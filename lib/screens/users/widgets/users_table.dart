import 'package:flutter/material.dart';

import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class UsersTable extends StatelessWidget {
  final List<Map<String, dynamic>> users;
  const UsersTable({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(Sizes.sm),
                  child: DataTable(
                    columnSpacing: 100,
                    border: TableBorder.all(color: Colors.transparent),
                    columns: [
                      DataColumn(label: RoundedContainer(
                        backgroundColor: dark ? CustomColors.alternate.withValues(alpha: 0.2) : CustomColors.primary.withValues(alpha: 0.2),
                        padding: const EdgeInsets.symmetric(vertical: Sizes.sm, horizontal: Sizes.md),
                        radius: Sizes.cardRadiusSm,
                        child: Text("Index",
                              style: Theme.of(context).textTheme.labelLarge!.copyWith(color: dark ? CustomColors.alternate : CustomColors.primary),),
                      )),
                      DataColumn(label: RoundedContainer(
                        backgroundColor: dark ? CustomColors.alternate.withValues(alpha: 0.2) : CustomColors.primary.withValues(alpha: 0.2),
                        padding: const EdgeInsets.symmetric(vertical: Sizes.sm, horizontal: Sizes.md),
                        radius: Sizes.cardRadiusSm,
                        child: Text("Sign Up Date",
                              style: Theme.of(context).textTheme.labelLarge!.copyWith(color: dark ? CustomColors.alternate : CustomColors.primary),),
                      )),
                      DataColumn(label: RoundedContainer(
                        backgroundColor: dark ? CustomColors.alternate.withValues(alpha: 0.2) : CustomColors.primary.withValues(alpha: 0.2),
                        padding: const EdgeInsets.symmetric(vertical: Sizes.sm, horizontal: Sizes.md),
                        radius: Sizes.cardRadiusSm,
                        child: Text("User ID",
                              style: Theme.of(context).textTheme.labelLarge!.copyWith(color: dark ? CustomColors.alternate : CustomColors.primary),),
                      )),
                      DataColumn(label: RoundedContainer(
                        backgroundColor: dark ? CustomColors.alternate.withValues(alpha: 0.2) : CustomColors.primary.withValues(alpha: 0.2),
                        padding: const EdgeInsets.symmetric(vertical: Sizes.sm, horizontal: Sizes.md),
                        radius: Sizes.cardRadiusSm,
                        child: Text("Profile Image",
                              style: Theme.of(context).textTheme.labelLarge!.copyWith(color: dark ? CustomColors.alternate : CustomColors.primary),),
                      )),
                      DataColumn(label: RoundedContainer(
                        backgroundColor: dark ? CustomColors.alternate.withValues(alpha: 0.2) : CustomColors.primary.withValues(alpha: 0.2),
                        padding: const EdgeInsets.symmetric(vertical: Sizes.sm, horizontal: Sizes.md),
                        radius: Sizes.cardRadiusSm,
                        child: Text("First Name",
                              style: Theme.of(context).textTheme.labelLarge!.copyWith(color: dark ? CustomColors.alternate : CustomColors.primary),),
                      )),
                      DataColumn(label: RoundedContainer(
                        backgroundColor: dark ? CustomColors.alternate.withValues(alpha: 0.2) : CustomColors.primary.withValues(alpha: 0.2),
                        padding: const EdgeInsets.symmetric(vertical: Sizes.sm, horizontal: Sizes.md),
                        radius: Sizes.cardRadiusSm,
                        child: Text("Last Name",
                              style: Theme.of(context).textTheme.labelLarge!.copyWith(color: dark ? CustomColors.alternate : CustomColors.primary),),
                      )),
                      DataColumn(label: RoundedContainer(
                        backgroundColor: dark ? CustomColors.alternate.withValues(alpha: 0.2) : CustomColors.primary.withValues(alpha: 0.5),
                        padding: const EdgeInsets.symmetric(vertical: Sizes.sm, horizontal: Sizes.md),
                        radius: Sizes.cardRadiusSm,
                        child: Text("Username",
                              style: Theme.of(context).textTheme.labelLarge!.copyWith(color: dark ? CustomColors.alternate : CustomColors.primary),),
                      )),
                      DataColumn(label: RoundedContainer(
                        backgroundColor: dark ? CustomColors.alternate.withValues(alpha: 0.2) : CustomColors.primary.withValues(alpha: 0.5),
                        padding: const EdgeInsets.symmetric(vertical: Sizes.sm, horizontal: Sizes.md),
                        radius: Sizes.cardRadiusSm,
                        child: Text("Email",
                              style: Theme.of(context).textTheme.labelLarge!.copyWith(color: dark ? CustomColors.alternate : CustomColors.primary),),
                      )),
                      DataColumn(label: RoundedContainer(
                        backgroundColor: dark ? CustomColors.alternate.withValues(alpha: 0.2) : CustomColors.primary.withValues(alpha: 0.2),
                        padding: const EdgeInsets.symmetric(vertical: Sizes.sm, horizontal: Sizes.md),
                        radius: Sizes.cardRadiusSm,
                        child: Text("Verified",
                              style: Theme.of(context).textTheme.labelLarge!.copyWith(color: dark ? CustomColors.alternate : CustomColors.primary),),
                      )),
                      DataColumn(label: RoundedContainer(
                        backgroundColor: dark ? CustomColors.alternate.withValues(alpha: 0.2) : CustomColors.primary.withValues(alpha: 0.2),
                        padding: const EdgeInsets.symmetric(vertical: Sizes.sm, horizontal: Sizes.md),
                        radius: Sizes.cardRadiusSm,
                        child: Text("User Type",
                              style: Theme.of(context).textTheme.labelLarge!.copyWith(color: dark ? CustomColors.alternate : CustomColors.primary),),
                      )),
                    ],
                    rows: List<DataRow>.generate(
                      users.length,
                      (index) {
                        final user = users[index];
                        return DataRow(
                          cells: [
                            DataCell(Text((index + 1).toString(),
                            style: Theme.of(context).textTheme.labelSmall,)),
                            DataCell(Text(user["date"].toString(),
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),)),
                            DataCell(Text(user["userId"].toString(),
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),)),
                            DataCell(CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.grey,
                              child: Icon(user["profileImage"],
                              color: Colors.white, size: Sizes.iconSm),)),
                            DataCell(Text(user["firstName"].toString(),
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),)),
                            DataCell(Text(user["lastName"].toString(),
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),)),
                            DataCell(Text(user["username"].toString(),
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),)),
                            DataCell(Text(user["email"].toString(),
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                            )),
                            DataCell(
                              Icon(
                                user["isVerified"] ? Icons.check_circle : Icons.cancel,
                                color: user["isVerified"] ? Colors.green : Colors.red,
                                size: Sizes.iconSm,
                              ),
                            ),
                            DataCell(Text(user["userType"].toString(),
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),)),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
  }
}