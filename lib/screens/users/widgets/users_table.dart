import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class UsersTable extends StatelessWidget {
  final List<Map<String, dynamic>> users;
  const UsersTable({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(Sizes.sm),
                  child: DataTable(
                    columnSpacing: 30,
                    border: TableBorder.all(color: Colors.transparent),
                    columns: [
                      DataColumn(label: Text("Index",
                            style: Theme.of(context).textTheme.labelLarge,)),
                      DataColumn(label: Text("User ID",
                            style: Theme.of(context).textTheme.labelLarge,)),
                      DataColumn(label: Text("Profile Image",
                            style: Theme.of(context).textTheme.labelLarge,)),
                      DataColumn(label: Text("First Name",
                            style: Theme.of(context).textTheme.labelLarge,)),
                      DataColumn(label: Text("Last Name",
                            style: Theme.of(context).textTheme.labelLarge,)),
                      DataColumn(label: Text("Username",
                            style: Theme.of(context).textTheme.labelLarge,)),
                      DataColumn(label: Text("Email",
                            style: Theme.of(context).textTheme.labelLarge,)),
                      DataColumn(label: Text("Verified",
                            style: Theme.of(context).textTheme.labelLarge,)),
                      DataColumn(label: Text("User Type",
                            style: Theme.of(context).textTheme.labelLarge,)),
                    ],
                    rows: List<DataRow>.generate(
                      users.length,
                      (index) {
                        final user = users[index];
                        return DataRow(
                          cells: [
                            DataCell(Text((index + 1).toString(),
                            style: Theme.of(context).textTheme.labelSmall,)), // index on Y axis
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