import 'package:flutter/material.dart';
import '../../utils/constants/sizes.dart';
import '../reponsive/responsive_appbar.dart';
import '../reponsive/responsive_scaffold.dart';

class UsersScreen extends StatelessWidget {
  final List<Map<String, dynamic>> users = [
    {
      "userId": "001",
      "firstName": "John",
      "lastName": "Doe",
      "username": "johndoe",
      "isVerified": true,
      "userType": "Provider"
    },
    {
      "userId": "002",
      "firstName": "Jane",
      "lastName": "Smith",
      "username": "janesmith",
      "isVerified": false,
      "userType": "Employer"
    },
    {
      "userId": "003",
      "firstName": "Michael",
      "lastName": "Brown",
      "username": "mikeb",
      "isVerified": true,
      "userType": "Provider"
    },
  ];

  UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      desktopBody: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            CustomHeader(),
            
          SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(Sizes.spaceBtwSections),
                  child: DataTable(
                    columnSpacing: 30,
                    border: TableBorder.all(color: Colors.transparent),
                    columns: const [
                      DataColumn(label: Text("Index")),
                      DataColumn(label: Text("User ID")),
                      DataColumn(label: Text("First Name")),
                      DataColumn(label: Text("Last Name")),
                      DataColumn(label: Text("Username")),
                      DataColumn(label: Text("Verified")),
                      DataColumn(label: Text("User Type")),
                    ],
                    rows: List<DataRow>.generate(
                      users.length,
                      (index) {
                        final user = users[index];
                        return DataRow(
                          cells: [
                            DataCell(Text((index + 1).toString())), // index on Y axis
                            DataCell(Text(user["userId"].toString())),
                            DataCell(Text(user["firstName"].toString())),
                            DataCell(Text(user["lastName"].toString())),
                            DataCell(Text(user["username"].toString())),
                            DataCell(
                              Icon(
                                user["isVerified"] ? Icons.check_circle : Icons.cancel,
                                color: user["isVerified"] ? Colors.green : Colors.red,
                              ),
                            ),
                            DataCell(Text(user["userType"].toString())),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
        tabletBody: Text('data'),
        mobileBody: Text('data'),
    );
  }
}
