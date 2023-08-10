import 'package:flutter/material.dart';
import 'package:templ/helpers/responsiveness.dart';
import 'package:templ/widgets/large_screen.dart';
import 'package:templ/widgets/small_screen.dart';
import 'package:templ/widgets/top_nav.dart';

import 'widgets/side_menu.dart';

class SiteLayout extends StatelessWidget {
  SiteLayout({super.key});
  final GlobalKey<ScaffoldState> scaffoldStateKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigationBar(context, scaffoldStateKey),
      key: scaffoldStateKey,
      drawer: const Drawer(
        child: SideMenu(),
      ),
      body: const ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
      ),
    );
  }
}
