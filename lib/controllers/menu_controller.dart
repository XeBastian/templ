import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templ/constants/style.dart';
import 'package:templ/routing/routes.dart';

class AppMenuController extends GetxController {
  static AppMenuController instance = Get.put(AppMenuController());
  var activeItem = AppRoutes.OverViewPageRoute.obs;
  var hoverItem = "".obs;

  // keeps track of active name item
  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  // onHover
  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value = itemName;
  isHovering(String itemName) => hoverItem.value = itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case AppRoutes.OverViewPageRoute:
        return _customIcon(Icons.trending_up_outlined, itemName);
      case AppRoutes.DriversPageRoute:
        return _customIcon(Icons.drive_eta, itemName);
      case AppRoutes.ClientsPageRoute:
        return _customIcon(Icons.people_alt, itemName);
      case AppRoutes.AuthenticationPageRoute:
        return _customIcon(Icons.exit_to_app_rounded, itemName);

      default:
        return _customIcon(Icons.exit_to_app_rounded, itemName);
    }
  }

// when active an icon is bigger than the rest
// onHover, itemColor should change
  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 22, color: AppColors.dark);
    return Icon(icon, color: isHovering(itemName) ? AppColors.dark : AppColors.lightGrey);
  }
}
