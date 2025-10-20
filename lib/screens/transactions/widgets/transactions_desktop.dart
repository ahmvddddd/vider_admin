import 'package:flutter/material.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/responsive_sizes.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../../dashboard/widgets/dashboard_overview.dart';
import '../../reponsive/responsive_appbar.dart';
import 'transactions_table.dart';

class TransactionsDesktop extends StatelessWidget {
  const TransactionsDesktop({
    super.key,
    required this.transactions,
  });

  final List<Map<String, dynamic>> transactions;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeader(
          title: 'Transactions',
        ),
    
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Sizes.spaceBtwItems),
              child: Column(
                children: [
                  Row(
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
    
                  const SizedBox(height: Sizes.spaceBtwSections,),
                  RoundedContainer(
            padding: const EdgeInsets.all(Sizes.sm),
            radius: Sizes.cardRadiusSm,
            backgroundColor: dark
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.black.withValues(alpha: 0.1),
                    child: TransactionsTable(transactions: transactions),
                  ),
                ],
              ),
            ),
          ),
        ),
    
        
      ],
    );
  }
}
