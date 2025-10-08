import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../screens/transactions/transactions.dart';
import '../../screens/users/users.dart';
import '../../screens/dashboard/dashboard.dart';
import '../../screens/jobs/jobs.dart';
import '../../utils/constants/routes.dart';

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this.ref) {
    ref.listen<bool>(authProvider, (_, __) => notifyListeners());
  }

  final Ref ref;
}

final routerProvider = Provider<GoRouter>((ref) {
  final notifier = RouterNotifier(ref);

  return GoRouter(
    initialLocation: '/login',
    refreshListenable: notifier,
    redirect: (context, state) {
      final authState = ref.read(authProvider);
      final loggedIn = authState;
      final loggingIn = state.matchedLocation == '/login';

      if (!loggedIn && !loggingIn) {
        // 🚨 Middleware: if not logged in, force login
        // return '/login';
        return Routes.dashboard;
      }
      if (loggedIn && loggingIn) {
        // 🚨 Middleware: if already logged in, go home
        // return '/';
        return Routes.dashboard;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: Routes.dashboard,
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(path: Routes.users, builder: (context, state) => UsersScreen()),
      GoRoute(path: Routes.jobs, builder: (context, state) => JobsScreen()),
      GoRoute(
        path: Routes.transactions,
        builder: (context, state) => TransactionsScreen(),
      ),
    ],
  );
});

final authProvider = StateProvider<bool>((ref) => false);
// false = user is not logged in, true = logged in
