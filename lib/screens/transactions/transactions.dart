import 'package:flutter/material.dart';
import '../../utils/constants/responsive_sizes.dart';
import '../../utils/constants/sizes.dart';
import '../dashboard/widgets/dashboard_overview.dart';
import '../reponsive/responsive_appbar.dart';
import '../reponsive/responsive_scaffold.dart';
import 'widgets/transactions_table.dart';

class TransactionsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {
      "id": "001",
      "transactionType": "Transfer",
      "amount": "\$100.00",
      "transactionStatus": "successfull",
      "description": "Job payment",
      "reference": "000111absjjsyuuxx",
      "date": DateTime.now(),
    },
    {
      "id": "002",
      "transactionType": "Withdrawal",
      "amount": "\$100.00",
      "transactionStatus": "successfull",
      "description": "Job pament",
      "reference": "000111absjjsyuuxx",
      "date": DateTime.now(),
    },
    {
      "id": "003",
      "transactionType": "Deposit",
      "amount": "\$100.00",
      "transactionStatus": "successfull",
      "description": "Job payment",
      "reference": "000111absjjsyuuxx",
      "date": DateTime.now(),
    },
  ];

  TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return ResponsiveScaffold(
      mobileBody: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(
                responsiveSize(context, Sizes.spaceBtwItems),
              ),
              child: SizedBox(
                height: screenHeight * 0.15,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(responsiveSize(context, 4)),
                      child: DashboardOverview(
                        width: screenWidth * 0.70,
                        backgroundColor: Color(0xFF7DBBFF),
                        title: 'Deposits',
                        amount: 100525000,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(responsiveSize(context, 4)),
                      child: DashboardOverview(
                        width: screenWidth * 0.70,
                        backgroundColor: Color(0xFFB899EB),
                        title: 'Withdrawals',
                        amount: 75605230,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(responsiveSize(context, 4)),
                      child: DashboardOverview(
                        width: screenWidth * 0.70,
                        backgroundColor: Color(0xFF7DBBFF),
                        title: 'Transfer',
                        amount: 100525000,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
            TransactionsTable(transactions: transactions),
          ],
        ),
      ),
      tabletBody: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(
                responsiveSize(context, Sizes.spaceBtwItems),
              ),
              child: SizedBox(
                height: responsiveSize(context, 100),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(responsiveSize(context, 4)),
                      child: DashboardOverview(
                        width: screenWidth * 0.30,
                        backgroundColor: Color(0xFF7DBBFF),
                        title: 'Deposits',
                        amount: 100525000,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(responsiveSize(context, 4)),
                      child: DashboardOverview(
                        width: screenWidth * 0.30,
                        backgroundColor: Color(0xFFB899EB),
                        title: 'Withdrawals',
                        amount: 75605230,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(responsiveSize(context, 4)),
                      child: DashboardOverview(
                        width: screenWidth * 0.30,
                        backgroundColor: Color(0xFF7DBBFF),
                        title: 'Transfer',
                        amount: 100525000,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: responsiveSize(context, Sizes.spaceBtwItems)),
            TransactionsTable(transactions: transactions),
          ],
        ),
      ),
      desktopBody: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeader(),

            Padding(
              padding: const EdgeInsets.all(Sizes.spaceBtwSections),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: DashboardOverview(
                      width: 200,
                      backgroundColor: Color(0xFF7DBBFF),
                      title: 'Deposits',
                      amount: 100525000,
                    ),
                  ),

                  Expanded(
                    child: DashboardOverview(
                      width: 200,
                      backgroundColor: Color(0xFFB899EB),
                      title: 'Withdrawals',
                      amount: 75605230,
                    ),
                  ),

                  Expanded(
                    child: DashboardOverview(
                      width: responsiveSize(context, 200),
                      backgroundColor: Color(0xFF7DBBFF),
                      title: 'Transfers',
                      amount: 100525000,
                    ),
                  ),
                ],
              ),
            ),

            TransactionsTable(transactions: transactions),
          ],
        ),
      ),
    );
  }
}
