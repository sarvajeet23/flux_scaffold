// test/flux_scaffold_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flux_scaffold/flux_scaffold.dart';

void main() {
  test('test bottom navigation item creation', () {
    final bottomNavItem = BottomNavItem(
      icon: Icons.home,
      label: 'Home',
    );
    expect(bottomNavItem.label, 'Home');
  });
}
