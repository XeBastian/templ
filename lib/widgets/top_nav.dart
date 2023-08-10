import 'package:flutter/material.dart';
import 'package:templ/constants/style.dart';
import 'package:templ/helpers/responsiveness.dart';

import 'custom_text.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) => AppBar(
      leading: ResponsiveWidget.isSmallScreen(context)
          ? IconButton(
              onPressed: () {
                key.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ))
          : Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  child: Image.asset("assets/icons/logo.png"),
                )
              ],
            ),
      elevation: 0,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Visibility(
              child: CustomText(
            text: "Templ",
            color: AppColors.lightGrey,
            size: 18,
          )),
          Expanded(
            child: Container(),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            color: AppColors.dark.withOpacity(.7),
            onPressed: () {},
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
                color: AppColors.dark.withOpacity(.7),
              ),
            ],
          ),
          Container(
            width: 2,
            height: 20,
            color: AppColors.lightGrey.withOpacity(.3),
          ),
          const SizedBox(width: 4),
          const CustomText(text: "Ernest Sebastian"),
          const SizedBox(width: 16),
          Container(
            child: CircleAvatar(
              backgroundColor: AppColors.light.withOpacity(.9),
              radius: 23,
              child: const Center(
                child: Icon(Icons.person_outline),
              ),
            ),
          )
        ],
      ),
      iconTheme: IconThemeData(
        color: AppColors.dark,
      ),
    );
