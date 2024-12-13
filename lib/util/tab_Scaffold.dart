import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flux_scaffold/util/tab_Navigator.dart';

import '../models/bottomNavItem.dart';
import 'widget/app_Scaffold.dart';

class TabScaffold extends StatefulWidget {
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final int numberTab;
  final String? backgroundImage;
  final Color? navigationBarBg;
  final List<Widget>? pages;
  final Widget? floatingActionButton;
  final List<BottomNavItem>? bottomNavItems;
  final bool? nested;
  final bool? topNavButtonBar;
  final EdgeInsetsGeometry? marginNavButtonBar;

  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final double? iconSize;
  final double? selectedFontSize;
  final TextStyle? selectedLabelStyle;
  final double? unselectedFontSize;
  final double? paddingValue;
  final TextStyle? unselectedLabelStyle;
  final bool? showSelectedLabels;
  final bool? showUnselectedLabels;
  final IconThemeData? selectedIconTheme;
  final IconThemeData? unselectedIconTheme;

  const TabScaffold({
    super.key,
    required this.numberTab,
    this.pages,
    this.bottomNavItems,
    this.nested,
    this.backgroundImage,
    this.navigationBarBg,
    this.floatingActionButton,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.iconSize,
    this.selectedFontSize,
    this.selectedLabelStyle,
    this.unselectedFontSize,
    this.unselectedLabelStyle,
    this.showSelectedLabels,
    this.showUnselectedLabels,
    this.selectedIconTheme,
    this.unselectedIconTheme,
    this.appBar,
    this.drawer,
    this.topNavButtonBar = false,
    this.marginNavButtonBar,
    this.paddingValue = 15.0,
  });

  @override
  State<TabScaffold> createState() => _TabScaffoldState();
}

class _TabScaffoldState extends State<TabScaffold> {
  int _currentIndex = 0;
  late final int numberTab;
  late final List<Widget> pages;
  late final List<BottomNavItem> bottomNavItems;

  late final List<GlobalKey<NavigatorState>> navigatorKeys;

  @override
  void initState() {
    super.initState();

    numberTab = (widget.numberTab ?? 2).clamp(2, double.infinity).toInt();
    pages = widget.pages ?? List.generate(numberTab, (_) => Scaffold());
    bottomNavItems = widget.bottomNavItems ??
        List.generate(
          numberTab,
          (index) => BottomNavItem(
            icon: Icons.circle,
            label: 'Tab $index',
            tooltip: 'Tab $index',
          ),
        );

    navigatorKeys = List.generate(
      numberTab,
      (_) => GlobalKey<NavigatorState>(),
    );
  }

  void _onTabTapped(int index) {
    if (_currentIndex != index) {
      navigatorKeys[_currentIndex]
          .currentState
          ?.popUntil((route) => route.isFirst);
      log('Switching to tab $index');
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (pages.length != numberTab || bottomNavItems.length != numberTab) {
      return Scaffold(
        body: Center(
          child: Text(
            'Error: Pages and BottomNavItems must match NumberTab.',
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }

    return AppScaffold(
      paddingValue: widget.paddingValue,
      topNavButtonBar: widget.topNavButtonBar,
      margin: widget.marginNavButtonBar,
      appBar: widget.appBar,
      floatingActionButton: widget.floatingActionButton,
      drawer: widget.drawer,
      backgroundImage: widget.backgroundImage,
      body: Stack(
        alignment: Alignment.center,
        children: List.generate(
          numberTab,
          (index) => _buildOffstageNavigator(
              index, pages[index], widget.nested ?? false),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: widget.navigationBarBg,
        selectedItemColor: widget.selectedItemColor,
        unselectedItemColor: widget.unselectedItemColor,
        elevation: widget.iconSize ?? 0,
        iconSize: widget.iconSize ?? 24.0,
        selectedFontSize: widget.selectedFontSize ?? 14.0,
        unselectedFontSize: widget.unselectedFontSize ?? 12.0,
        selectedLabelStyle: widget.selectedLabelStyle,
        unselectedLabelStyle: widget.unselectedLabelStyle,
        showSelectedLabels: widget.showSelectedLabels ?? true,
        showUnselectedLabels: widget.showUnselectedLabels ?? true,
        selectedIconTheme: widget.selectedIconTheme,
        unselectedIconTheme: widget.unselectedIconTheme,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: bottomNavItems
            .map((item) => BottomNavigationBarItem(
                  icon: Icon(item.icon),
                  activeIcon:
                      item.activeIcon != null ? Icon(item.activeIcon) : null,
                  label: item.label,
                  tooltip: item.tooltip,
                  backgroundColor: item.backgroundColor,
                ))
            .toList(),
      ),
    );
  }

  Widget _buildOffstageNavigator(int index, Widget child, bool nested) {
    return Offstage(
      offstage: _currentIndex != index,
      child: nested
          ? TabNavigator(navigatorKey: navigatorKeys[index], child: child)
          : child,
    );
  }
}
