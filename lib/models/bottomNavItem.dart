import 'package:flutter/material.dart';

class BottomNavItem {
  final IconData icon;
  final String label;
  final String? tooltip;
  final IconData? activeIcon;
  final Color? backgroundColor;

  BottomNavItem({
    required this.icon,
    required this.label,
    this.tooltip,
    this.activeIcon,
    this.backgroundColor,
  });
}