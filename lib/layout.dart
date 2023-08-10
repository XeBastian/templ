import 'package:flutter/material.dart';
import 'package:templ/helpers/responsiveness.dart';
import 'package:templ/widgets/large_screen.dart';
import 'package:templ/widgets/small_screen.dart';
import 'package:templ/widgets/top_nav.dart';

class SiteLayout extends StatelessWidget {
  SiteLayout({super.key});
  final GlobalKey<ScaffoldState> scaffoldStateKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigationBar(context, scaffoldStateKey),
      body: const ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
      ),
    );
  }
}
