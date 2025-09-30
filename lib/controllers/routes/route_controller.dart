// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';

// import '../../screens/dashboard/dashboard.dart';
// import '../../utils/constants/routes.dart';

// final routerProvider = Provider<GoRouter>((ref) {
//   final authState = ref.watch(authProvider);

//   return GoRouter(
//     initialLocation: '/',
//     refreshListenable: GoRouterRefreshStream(ref.watch(authProvider.notifier).stream),
//     redirect: (context, state) {
//       final loggedIn = authState;
//       final loggingIn = state.matchedLocation == '/login';

//       if (!loggedIn && !loggingIn) {
//         // 🚨 Middleware: if not logged in, force login
//         return '/login';
//       }
//       if (loggedIn && loggingIn) {
//         // 🚨 Middleware: if already logged in, go home
//         return '/';
//       }
//       return null; // no redirect
//     },
//     routes: [
//       GoRoute(
//         path: Routes.dashboard,
//         builder: (context, state) => const DashboardScreen(),
//       ),
//       // GoRoute(
//       //   path: '/login',
//       //   builder: (context, state) => const LoginScreen(),
//       // ),
//       // GoRoute(
//       //   path: '/profile',
//       //   builder: (context, state) => const ProfileScreen(),
//       // ),
//     ],
//   );
// });

// final authProvider = StateProvider<bool>((ref) => false);
// // false = user is not logged in, true = logged in