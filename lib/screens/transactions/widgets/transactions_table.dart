import 'package:flutter/material.dart';
import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class TransactionsTable extends StatelessWidget {
  final List<Map<String, dynamic>> transactions;
  const TransactionsTable({super.key, required this.transactions});

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
            columnSpacing: 30,
            border: TableBorder.all(color: Colors.transparent),
            columns: [
              DataColumn(
                label: Text(
                  "Index",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              DataColumn(
                label: Text(
                  "ID",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              DataColumn(
                label: Text(
                  "Transaction Type",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              DataColumn(
                label: Text(
                  "Amount",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              DataColumn(
                label: Text(
                  "Status",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              DataColumn(
                label: Text(
                  "Description",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              DataColumn(
                label: Text(
                  "Reference",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              DataColumn(
                label: Text(
                  "Date",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
            rows: List<DataRow>.generate(transactions.length, (index) {
              final user = transactions[index];
              return DataRow(
                cells: [
                  DataCell(
                    Text(
                      (index + 1).toString(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ), // index on Y axis
                  DataCell(
                    Text(
                      user["id"].toString(),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataCell(
                    Text(
                      user["transactionType"].toString(),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: user['transactionType'] == 'Transfer'
                            ? dark
                                  ? CustomColors.alternate
                                  : CustomColors.primary
                            : user['transactionType'] == 'Withdrawal'
                            ? Colors.red
                            : user['transactionType'] == 'Deposit'
                            ? Colors.green
                            : Colors.transparent,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      user["amount"].toString(),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataCell(
                    Text(
                      user["transactionStatus"].toString(),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataCell(
                    Text(
                      user["description"].toString(),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataCell(
                    Text(
                      user["reference"].toString(),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataCell(
                    Text(
                      user["date"].toString(),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
