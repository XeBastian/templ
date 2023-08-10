import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templ/constants/controllers.dart';
import 'package:templ/constants/style.dart';
import 'package:templ/helpers/responsiveness.dart';
import 'package:templ/routing/routes.dart';
import 'package:templ/widgets/side_menu_item.dart';

import 'custom_text.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.light,
      ),
      child: ListView(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Image.asset("assets/icons/logo.png"),
              ),
              Flexible(
                child: CustomText(
                  text: 'Dash',
                  size: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.active,
                ),
              ),
              SizedBox(
                width: width / 48,
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
          Divider(
            color: AppColors.lightGrey.withOpacity(.2),
          ),
          Column(
            children: AppRoutes.sideMenuItems
                .map((itemName) => SideMenuItem(
                      itemName: itemName == AppRoutes.AuthenticationPageRoute ? "Log Out" : itemName,
                      onTap: () {
                        if (itemName == AppRoutes.AuthenticationPageRoute) {
                          //TODO:: Go to auth page
                        }
                        if (!menuController.isActive(itemName)) {
                          menuController.changeActiveItemTo(itemName);
                          if (ResponsiveWidget.isSmallScreen(context)) Get.back();
                          // TODO:: use named route
                        }
                      },
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
