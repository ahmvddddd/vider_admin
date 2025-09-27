import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/constants/routes.dart';
import '../utils/device/device_utility.dart';

/// State model for the sidebar
class SidebarState {
  final String activeItem;
  final String hoverItem;

  const SidebarState({
    required this.activeItem,
    required this.hoverItem,
  });

  SidebarState copyWith({
    String? activeItem,
    String? hoverItem,
  }) {
    return SidebarState(
      activeItem: activeItem ?? this.activeItem,
      hoverItem: hoverItem ?? this.hoverItem,
    );
  }
}

/// Notifier (controller) for sidebar state
class SidebarController extends StateNotifier<SidebarState> {
  SidebarController()
      : super(const SidebarState(
          activeItem: Routes.splash,
          hoverItem: '',
        ));

  void changeActiveItem(String route) {
    state = state.copyWith(activeItem: route);
  }

  void changeHoverItem(String route) {
    if (!isActive(route)) {
      state = state.copyWith(hoverItem: route);
    }
  }

  bool isActive(String route) => state.activeItem == route;

  bool isHovering(String route) => state.hoverItem == route;

  void menuOnTap(BuildContext context, String route) {
    if (!isActive(route)) {
      changeActiveItem(route);

      if (DeviceUtils.isMobileScreen(context)) {
        Navigator.of(context).pop(); // closes drawer
      }

      Navigator.of(context).pushNamed(route);
    }
  }
}

/// Riverpod provider
final sidebarControllerProvider =
    StateNotifierProvider<SidebarController, SidebarState>(
  (ref) => SidebarController(),
);
