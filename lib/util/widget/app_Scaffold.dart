import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppScaffold extends StatelessWidget {
  final bool? topNavButtonBar;
  final EdgeInsetsGeometry? margin;
  final Widget body;
  final String? backgroundImage;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final List<Widget>? actions;
  final PreferredSizeWidget? appBar;
  final String? title;
  final bool centerTitle;
  final Color? statusBarColor;
  final Gradient? customGradientBackground;
  final bool isKeyboardAware;
  final EdgeInsets? padding;
  final bool scrollableBody;
  final Color? backgroundColor;
  final double appBarElevation;
  final Widget? bottomSheet;
  final ScrollPhysics? scrollPhysics;
  final bool showDrawerIcon;
  final SystemUiOverlayStyle? preferredStatusBarStyle;
  final bool hasBottomSafeAreaPadding;
  final double toolbarHeight;
  final Color? bottomSheetBackgroundColor;
  final List<Widget>? actionButtons;
  final bool scrollToTopButton;
  final double? paddingValue;

  const AppScaffold({
    Key? key,
    required this.body,
    this.backgroundImage,
    this.floatingActionButton,
    this.actions,
    this.bottomNavigationBar,
    this.drawer,
    this.appBar,
    this.title,
    this.centerTitle = true,
    this.statusBarColor,
    this.customGradientBackground,
    this.isKeyboardAware = false,
    this.padding,
    this.scrollableBody = false,
    this.backgroundColor,
    this.appBarElevation = 4.0,
    this.bottomSheet,
    this.scrollPhysics,
    this.showDrawerIcon = true,
    this.preferredStatusBarStyle,
    this.hasBottomSafeAreaPadding = true,
    this.toolbarHeight = 20.0,
    this.bottomSheetBackgroundColor,
    this.actionButtons,
    this.scrollToTopButton = false,
    this.margin,
    this.topNavButtonBar = false,
    this.paddingValue = 15.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set the status bar color if provided
    if (statusBarColor != null) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: statusBarColor,
          statusBarIconBrightness: statusBarColor!.computeLuminance() > 0.5
              ? Brightness.dark
              : Brightness.light,
        ),
      );
    }

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double statusBarHeight = MediaQuery.of(context).padding.top;

    double horizontalPadding = screenWidth * 0.04;
    double bottomPadding = screenHeight * 0.05;

    double effectiveBottomPadding = isKeyboardAware
        ? MediaQuery.of(context).viewInsets.bottom + bottomPadding
        : bottomPadding;

    Widget content = scrollableBody ? SingleChildScrollView(child: body) : body;

    return Scaffold(
      appBar: appBar,
      drawer: showDrawerIcon && drawer != null ? drawer : null,
      bottomSheet: bottomSheet,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          if (backgroundImage != null)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(backgroundImage ?? " "),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4),
                      BlendMode.darken,
                    ),
                  ),
                ),
              ),
            ),
          if (customGradientBackground != null)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: customGradientBackground,
                ),
              ),
            ),
          if (backgroundColor != null && backgroundImage == null)
            Positioned.fill(
              child: Container(color: backgroundColor),
            ),
          Padding(
            padding: backgroundImage != null
                ? margin ?? EdgeInsets.all(paddingValue!)
                : const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: backgroundImage != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(paddingValue!),
                    child: content)
                : content,
          ),
          if (backgroundImage != null ||
              bottomNavigationBar != null ||
              margin != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: backgroundImage != null ||
                        topNavButtonBar! ||
                        margin != null
                    ? margin ??
                        EdgeInsets.symmetric(
                            horizontal: paddingValue!, vertical: paddingValue!)
                    : ((margin != null ||
                            (topNavButtonBar != null && topNavButtonBar!))
                        ? EdgeInsets.all(paddingValue!) // when margin on
                        : EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: (margin != null ||
                            backgroundImage != null ||
                            topNavButtonBar != null && topNavButtonBar!)
                        ? (topNavButtonBar != null && topNavButtonBar!
                            ? Radius.circular(paddingValue!)
                            : backgroundImage != null
                                ? Radius.circular(paddingValue!)
                                : Radius.circular(
                                    paddingValue!)) // when margin on
                        : Radius.circular(0),
                    bottomRight: (margin != null ||
                            backgroundImage != null ||
                            topNavButtonBar != null && topNavButtonBar!)
                        ? (topNavButtonBar != null && topNavButtonBar!
                            ? Radius.circular(paddingValue!)
                            : backgroundImage != null
                                ? Radius.circular(paddingValue!)
                                : Radius.circular(paddingValue!))
                        : Radius.circular(0),
                    topLeft: (margin != null ||
                            backgroundImage != null ||
                            topNavButtonBar != null && topNavButtonBar!)
                        ? (topNavButtonBar != null && topNavButtonBar!
                            ? Radius.circular(paddingValue!)
                            : Radius.circular(paddingValue!))
                        : Radius.circular(0),
                    topRight: (margin != null ||
                            backgroundImage != null ||
                            topNavButtonBar != null && topNavButtonBar!)
                        ? (topNavButtonBar != null && topNavButtonBar!
                            ? Radius.circular(paddingValue!)
                            : Radius.circular(paddingValue!))
                        : Radius.circular(0),
                  ),
                  child: bottomNavigationBar!,
                ),
              ),
            ),
          if (floatingActionButton != null)
            Positioned(
              bottom: effectiveBottomPadding + 40,
              right: 25,
              child: floatingActionButton!,
            ),
          if (scrollToTopButton)
            Positioned(
              bottom: effectiveBottomPadding + 80,
              right: horizontalPadding,
              child: FloatingActionButton(
                onPressed: () {
                  // Implement scroll to top logic
                },
                child: Icon(Icons.arrow_upward),
              ),
            ),
        ],
      ),
    );
  }
}