import 'package:flutter/material.dart';

import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/responsive_sizes.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../../dashboard/widgets/dashboard_overview.dart';
import 'transactions_table.dart';

class TransactionsTablet extends StatelessWidget {
  const TransactionsTablet({
    super.key,
    required this.transactions,
  });

  final List<Map<String, dynamic>> transactions;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final dark = HelperFunction.isDarkMode(context);
    return SingleChildScrollView(
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
            radius: Sizes.cardRadiusSm,
            backgroundColor: dark
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.black.withValues(alpha: 0.1),
            showBorder: true,
              child: TransactionsTable(transactions: transactions),
            ),
          ),
        ],
      ),
    );
  }
}

