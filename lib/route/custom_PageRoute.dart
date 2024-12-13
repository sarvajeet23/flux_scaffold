import 'package:flutter/material.dart';

import '../enum/transition_Style.dart';

class CustomPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  final TransitionStyle transitionStyle;
  final Offset beginOffset; // Slide direction customization
  final bool zoomIn; // For zoom in/out effect
  final Duration duration;

  CustomPageRoute({
    required this.page,
    this.transitionStyle = TransitionStyle.slide, // Default is Slide
    this.beginOffset = const Offset(1.0, 0.0), // Slide from right by default
    this.zoomIn = false, // Zoom in by default
    this.duration = const Duration(milliseconds: 300), // Transition duration
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: duration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            switch (transitionStyle) {
              case TransitionStyle.slide:
                return _buildSlideTransition(animation, child);

              case TransitionStyle.bottomSheet:
                return _buildBottomSheetTransition(animation, child);

              case TransitionStyle.zoomOut:
                return _buildZoomOutTransition(animation, child);

              default:
                return _buildSlideTransition(
                    animation, child); // Default to Slide
            }
          },
        );

  // Slide transition (from any direction)
  static Widget _buildSlideTransition(
      Animation<double> animation, Widget child) {
    var slideTween = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Slide from right by default
      end: Offset.zero,
    ).chain(CurveTween(curve: Curves.easeInOut));

    var slideAnimation = animation.drive(slideTween);
    return SlideTransition(
      position: slideAnimation,
      child: child,
    );
  }

  // BottomSheet-like transition (slide from bottom)
  static Widget _buildBottomSheetTransition(
      Animation<double> animation, Widget child) {
    var slideTween = Tween<Offset>(
      begin: Offset(0.0, 1.0), // Start below the screen
      end: Offset.zero, // End at the normal position
    ).chain(CurveTween(curve: Curves.easeInOut));

    var slideAnimation = animation.drive(slideTween);

    // Optional zoom effect
    var zoomAnimation = Tween<double>(begin: 0.8, end: 1.0)
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(animation);

    return Transform(
      transform: Matrix4.identity()..scale(zoomAnimation.value),
      alignment: Alignment.center,
      child: SlideTransition(
        position: slideAnimation,
        child: child,
      ),
    );
  }

  // Zoom-out transition (zoom in from center and zoom out)
  static Widget _buildZoomOutTransition(
      Animation<double> animation, Widget child) {
    var zoomTween = Tween<double>(begin: 1.2, end: 1.0) // Zoom out
        .chain(CurveTween(curve: Curves.easeInOut));
    var zoomAnimation = animation.drive(zoomTween);

    return Transform(
      transform: Matrix4.identity()..scale(zoomAnimation.value),
      alignment: Alignment.center,
      child: child,
    );
  }
}
