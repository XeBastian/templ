import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templ/widgets/custom_text.dart';

import '../constants/controllers.dart';
import '../constants/style.dart';

class VerticalMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback? onTap;
  const VerticalMenuItem({super.key, required this.itemName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHover: (hoverValue) {
        hoverValue ? menuController.onHover(itemName) : menuController.onHover("cannot hover");
      },
      child: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: menuController.isHovering(itemName) ? AppColors.lightGrey : AppColors.transparent,
          ),
          child: Row(
            children: [
              Visibility(
                visible: menuController.isHovering(itemName) || menuController.isActive(itemName),
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
                child: Container(
                  width: 3,
                  height: 72,
                  color: AppColors.dark,
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: menuController.returnIconFor(itemName),
                  ),
                  if (menuController.isActive(itemName))
                    Flexible(
                      child: CustomText(
                        text: itemName,
                        color: menuController.isHovering(itemName) ? AppColors.dark : AppColors.lightGrey,
                      ),
                    )
                  else
                    Flexible(
                      child: CustomText(
                        text: itemName,
                        color: AppColors.dark,
                        size: 18,
                      ),
                    ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
