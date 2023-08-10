import 'package:flutter/material.dart';
import 'package:templ/helpers/responsiveness.dart';
import 'package:templ/widgets/horizontal_menu_item.dart';
import 'package:templ/widgets/vertical_menu_item.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback? onTap;
  const SideMenuItem({super.key, required this.itemName, this.onTap});

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.iMediumScreen(context)) {
      return VerticalMenuItem(itemName: itemName, onTap: () {});
    }

    return HorizontalMenuItem(itemName: itemName, onTap: () {});
  }
}
