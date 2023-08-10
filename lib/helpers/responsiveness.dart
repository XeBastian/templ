import 'package:flutter/material.dart';

/// Screen breakpoints
/// START
const int largeScreenSize = 1366;
const int mediumScreenSize = 786;
const int smallScreenSize = 360;
const int customScreenSize = 1100;

///END

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveWidget({super.key, required this.largeScreen, this.mediumScreen, this.smallScreen});

// create static methods to determine the current view if small, medium or large.

//This is a small screen since its is less than the medium dimension breakpoint
  static bool isSmallScreen(BuildContext context) => MediaQuery.of(context).size.width < smallScreenSize;

  // medium is less than large and greater than small

  static bool iMediumScreen(BuildContext context) => MediaQuery.of(context).size.width >= mediumScreenSize && MediaQuery.of(context).size.width < largeScreenSize;
  // large is equal and greater than it

  static bool isLargeScreen(BuildContext context) => MediaQuery.of(context).size.width >= largeScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth;
      if (width >= largeScreenSize) return largeScreen;
      if (width < smallScreenSize) return smallScreen ?? largeScreen;
      if (width >= mediumScreenSize && width <= largeScreenSize) return mediumScreen ?? largeScreen;
      return smallScreen ?? largeScreen;
    });
  }
}
