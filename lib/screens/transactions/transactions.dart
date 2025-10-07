import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../utils/constants/responsive_sizes.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_function.dart';
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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final dark = HelperFunction.isDarkMode(context);

    return ResponsiveScaffold(
      mobileBody: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(
                responsiveSize(context, Sizes.spaceBtwItems),
              ),
              child: SizedBox(
                height: screenHeight * 0.18,
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
            Padding(
              padding: const EdgeInsets.all(Sizes.spaceBtwItems),
              child: RoundedContainer(
                padding: const EdgeInsets.all(Sizes.sm),
                backgroundColor: Colors.transparent,
                showBorder: true,
                borderColor: dark ? Colors.white : Colors.black,
                child: TransactionsTable(transactions: transactions),
              ),
            ),
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
                height: responsiveSize(context, 120),
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
            Padding(
              padding: const EdgeInsets.all(Sizes.spaceBtwItems),
              child: RoundedContainer(
                padding: const EdgeInsets.all(Sizes.sm),
                backgroundColor: Colors.transparent,
                showBorder: true,
                borderColor: dark ? Colors.white : Colors.black,
                child: TransactionsTable(transactions: transactions),
              ),
            ),
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

            Padding(
              padding: const EdgeInsets.all(Sizes.spaceBtwSections),
              child: RoundedContainer(
                padding: const EdgeInsets.all(Sizes.sm),
                backgroundColor: Colors.transparent,
                showBorder: true,
                borderColor: dark ? Colors.white : Colors.black,
                child: TransactionsTable(transactions: transactions),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DesktopHeader extends StatelessWidget {
  const DesktopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.spaceBtwItems),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Page Name', style: Theme.of(context).textTheme.headlineSmall),

          Row(children: [Icon(Icons.notifications), Icon(Iconsax.user)]),
        ],
      ),
    );
  }
}
