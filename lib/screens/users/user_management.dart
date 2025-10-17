import 'package:flutter/material.dart';
import '../../screens/reponsive/responsive_appbar.dart';
import '../../utils/constants/custom_colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_function.dart';

class UserManagementPage extends StatelessWidget {
  const UserManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeader(),
            Row(
              children: [
                // Main Content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'User',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Row(
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.file_download_outlined,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    'Export',
                                    style: Theme.of(context).textTheme.labelSmall!
                                        .copyWith(color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: CustomColors.primary,
                                    padding: const EdgeInsets.all(Sizes.sm),
                                    side: const BorderSide(color: Colors.indigo),
                                  ),
                                ),
                                const SizedBox(width: Sizes.spaceBtwItems),
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add, color: Colors.white),
                                  label: Text(
                                    'Add User',
                                    style: Theme.of(context).textTheme.labelSmall,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(Sizes.sm),
                                    backgroundColor: CustomColors.alternate,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
            
                        const SizedBox(height: Sizes.spaceBtwItems),
            
                        // Filters
                        Row(
                          children: [
                            SizedBox(
                              width: 260,
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.search),
                                  hintText: 'Search Username',
                                  hintStyle: Theme.of(context).textTheme.labelSmall,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: Sizes.spaceBtwItems),
                            DropdownButton<String>(
                              value: 'All Status',
                              items: [
                                DropdownMenuItem(
                                  value: 'All Status',
                                  child: Text(
                                    'All Status',
                                    style: Theme.of(context).textTheme.labelMedium,
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'Active',
                                  child: Text(
                                    'Active',
                                    style: Theme.of(context).textTheme.labelMedium,
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'Inactive',
                                  child: Text(
                                    'Inactive',
                                    style: Theme.of(context).textTheme.labelMedium,
                                  ),
                                ),
                              ],
                              onChanged: (_) {},
                            ),
                          ],
                        ),
            
                        const SizedBox(height: Sizes.spaceBtwItems),
            
                        // Table
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(Sizes.sm),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: dark
                                  ? Colors.white.withValues(alpha: 0.1)
                                  : Colors.black.withValues(alpha: 0.1),
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: DataTable(
                                columnSpacing: 32,
                                columns: [
                                  DataColumn(
                                    label: Text(
                                      'Role',
                                      style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Full Name',
                                      style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Username',
                                      style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Email',
                                      style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Phone Number',
                                      style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Date Created',
                                      style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Status',
                                      style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Actions',
                                      style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                  ),
                                ],
                                rows: _userData
                                    .map(
                                      (user) => DataRow(
                                        cells: [
                                          DataCell(
                                            Text(
                                              user['role']!,
                                              style: Theme.of(
                                                context,
                                              ).textTheme.labelSmall,
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              user['name']!,
                                              style: Theme.of(
                                                context,
                                              ).textTheme.labelSmall,
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              user['username']!,
                                              style: Theme.of(
                                                context,
                                              ).textTheme.labelSmall,
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              user['email']!,
                                              style: Theme.of(
                                                context,
                                              ).textTheme.labelSmall,
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              user['phone']!,
                                              style: Theme.of(
                                                context,
                                              ).textTheme.labelSmall,
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              user['created']!,
                                              style: Theme.of(
                                                context,
                                              ).textTheme.labelSmall,
                                            ),
                                          ),
                                          DataCell(
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.circle,
                                                  color: user['status'] == 'Active'
                                                      ? Colors.green
                                                      : Colors.red,
                                                  size: 10,
                                                ),
                                                const SizedBox(width: 6),
                                                Text(
                                                  user['status']!,
                                                  style: Theme.of(
                                                    context,
                                                  ).textTheme.labelSmall,
                                                ),
                                              ],
                                            ),
                                          ),
                                          DataCell(
                                            Row(
                                              children: const [
                                                Icon(
                                                  Icons.visibility_outlined,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(width: Sizes.sm),
                                                Icon(
                                                  Icons.edit_outlined,
                                                  color: Colors.indigo,
                                                ),
                                                SizedBox(width: Sizes.sm),
                                                Icon(
                                                  Icons.delete_outline,
                                                  color: Colors.red,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, String>> _userData = [
  {
    'role': 'Super Admin',
    'name': 'John Doe',
    'username': 'johndoe12',
    'email': 'johndoe12@email.com',
    'phone': '0813-2222-8899',
    'created': '27 Mar 2024 18:45',
    'status': 'Active',
  },
  {
    'role': 'Engineering',
    'name': 'Abizar Alghfary',
    'username': 'abizar33',
    'email': 'abizar33@email.com',
    'phone': '0813-4729-1056',
    'created': '26 Mar 2024 14:22',
    'status': 'Inactive',
  },
  {
    'role': 'Housekeeping',
    'name': 'Raffi Ahmad',
    'username': 'raffiahmad',
    'email': 'raffiahmad@email.com',
    'phone': '0821-0394-7682',
    'created': '25 Mar 2024 09:57',
    'status': 'Active',
  },
  {
    'role': 'Receptionist',
    'name': 'Putri Amaliah',
    'username': 'putri211099',
    'email': 'putri211099@email.com',
    'phone': '0812-5583-9217',
    'created': '24 Mar 2024 20:10',
    'status': 'Active',
  },
  {
    'role': 'Purchasing',
    'name': 'Zheperd Edward',
    'username': 'zheperd',
    'email': 'zheperd77@email.com',
    'phone': '0852-7741-3320',
    'created': '23 Mar 2024 16:33',
    'status': 'Inactive',
  },
  {
    'role': 'Accounting',
    'name': 'Exel Sudarso',
    'username': 'exellkl',
    'email': 'exellkl99@email.com',
    'phone': '0813-6902-4815',
    'created': '22 Mar 2024 11:48',
    'status': 'Active',
  },
  {
    'role': 'Marketing',
    'name': 'Edward Newgate',
    'username': 'siriohgeprts',
    'email': 'siriohgeprts@email.com',
    'phone': '0821-8173-0469',
    'created': '21 Mar 2024 08:15',
    'status': 'Active',
  },
  {
    'role': 'Housekeeping',
    'name': 'Jack Sparrow',
    'username': 'jacksparrow',
    'email': 'jacksparrow@email.com',
    'phone': '0812-2057-6884',
    'created': '20 Mar 2024 19:27',
    'status': 'Active',
  },
  {
    'role': 'Cost Control',
    'name': 'Peter Parker',
    'username': 'peterparker',
    'email': 'peterparker@email.com',
    'phone': '0852-9316-2580',
    'created': '19 Mar 2024 17:06',
    'status': 'Inactive',
  },
  {
    'role': 'Marketing',
    'name': 'Zuki Kato',
    'username': 'zukizuki',
    'email': 'zukizuki@email.com',
    'phone': '0821-4680-1133',
    'created': '18 Mar 2024 12:06',
    'status': 'Inactive',
  },
];


class UsersDesktop extends StatelessWidget {
  const UsersDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeader(),
        SingleChildScrollView(
          child: Row(
            children: [
              // Main Content
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'User',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.file_download_outlined,
                                color: Colors.white,
                              ),
                              label: Text(
                                'Export',
                                style: Theme.of(context).textTheme.labelSmall!
                                    .copyWith(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: CustomColors.primary,
                                padding: const EdgeInsets.all(Sizes.sm),
                                side: const BorderSide(color: Colors.indigo),
                              ),
                            ),
                            const SizedBox(width: Sizes.spaceBtwItems),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.add, color: Colors.white),
                              label: Text(
                                'Add User',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(Sizes.sm),
                                backgroundColor: CustomColors.alternate,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                          
                    const SizedBox(height: Sizes.spaceBtwItems),
                          
                    // Filters
                    Row(
                      children: [
                        SizedBox(
                          width: 260,
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              hintText: 'Search Username',
                              hintStyle: Theme.of(context).textTheme.labelSmall,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: Sizes.spaceBtwItems),
                        DropdownButton<String>(
                          value: 'All Status',
                          items: [
                            DropdownMenuItem(
                              value: 'All Status',
                              child: Text(
                                'All Status',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'Active',
                              child: Text(
                                'Active',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'Inactive',
                              child: Text(
                                'Inactive',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                          ],
                          onChanged: (_) {},
                        ),
                      ],
                    ),
                          
                    const SizedBox(height: Sizes.spaceBtwItems),
                          
                    // Table
                    Container(
                      padding: const EdgeInsets.all(Sizes.sm),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: dark
                            ? Colors.white.withValues(alpha: 0.1)
                            : Colors.black.withValues(alpha: 0.1),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: DataTable(
                          columnSpacing: 32,
                          columns: [
                            DataColumn(
                              label: Text(
                                'Role',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Full Name',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Username',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Email',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Phone Number',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Date Created',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Status',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Actions',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                          ],
                          rows: _userData
                              .map(
                                (user) => DataRow(
                                  cells: [
                                    DataCell(
                                      Text(
                                        user['role']!,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelSmall,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        user['name']!,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelSmall,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        user['username']!,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelSmall,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        user['email']!,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelSmall,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        user['phone']!,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelSmall,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        user['created']!,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelSmall,
                                      ),
                                    ),
                                    DataCell(
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            color: user['status'] == 'Active'
                                                ? Colors.green
                                                : Colors.red,
                                            size: 10,
                                          ),
                                          const SizedBox(width: 6),
                                          Text(
                                            user['status']!,
                                            style: Theme.of(
                                              context,
                                            ).textTheme.labelSmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                    DataCell(
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.visibility_outlined,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(width: Sizes.sm),
                                          Icon(
                                            Icons.edit_outlined,
                                            color: Colors.indigo,
                                          ),
                                          SizedBox(width: Sizes.sm),
                                          Icon(
                                            Icons.delete_outline,
                                            color: Colors.red,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}