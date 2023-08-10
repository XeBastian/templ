import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templ/widgets/custom_text.dart';

import '../constants/controllers.dart';
import '../constants/style.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback? onTap;
  const HorizontalMenuItem({super.key, required this.itemName, this.onTap});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      onHover: (hoverValue) {
        hoverValue ? AppControllers.menuController.onHover(itemName) : AppControllers.menuController.onHover("cannot hover");
      },
      child: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: AppControllers.menuController.isHovering(itemName) ? AppColors.lightGrey : AppColors.transparent,
          ),
          child: Row(
            children: [
              Visibility(
                visible: AppControllers.menuController.isHovering(itemName) || AppControllers.menuController.isActive(itemName),
                child: Container(
                  width: 6,
                  height: 40,
                  color: AppColors.dark,
                ),
              ),
              SizedBox(width: width / 80),
              Padding(
                padding: const EdgeInsets.all(16),
                child: AppControllers.menuController.returnIconFor(itemName),
              ),
              if (AppControllers.menuController.isActive(itemName))
                Flexible(
                  child: CustomText(
                    text: itemName,
                    color: AppControllers.menuController.isHovering(itemName) ? AppColors.dark : AppColors.lightGrey,
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
          ),
        ),
      ),
    );
  }
}
