import 'package:flutter/material.dart';
import '../reponsive/responsive_scaffold.dart';
import 'widgets/transactions_desktop.dart';
import 'widgets/transactions_mobile.dart';
import 'widgets/transactions_tablet.dart';

class TransactionsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {
      "id": "001",
      "transactionType": "Transfer",
      "amount": "\$100.00",
      "transactionStatus": "successful",
      "description": "Job payment",
      "reference": "000111absjjsyuuxx",
      "date": DateTime.now(),
    },
    {
      "id": "002",
      "transactionType": "Withdrawal",
      "amount": "\$100.00",
      "transactionStatus": "successful",
      "description": "Job pament",
      "reference": "000111absjjsyuuxx",
      "date": DateTime.now(),
    },
    {
      "id": "003",
      "transactionType": "Deposit",
      "amount": "\$100.00",
      "transactionStatus": "successful",
      "description": "Job payment",
      "reference": "000111absjjsyuuxx",
      "date": DateTime.now(),
    },
  ];

  TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      title: 'Transactions',
      mobileBody: TransactionsMobile(transactions: transactions),
      tabletBody: TransactionsTablet(transactions: transactions),
      desktopBody: TransactionsDesktop(transactions: transactions),
    );
  }
}
