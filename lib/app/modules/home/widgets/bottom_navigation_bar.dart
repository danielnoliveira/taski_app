import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sizer/sizer.dart';
import 'package:taski_app/app/core/enums/bottom_nav_page_type.dart';
import 'package:taski_app/app/core/helpers/modal_helper.dart';
import 'package:taski_app/app/core/utils/home_store_util.dart';
import 'package:taski_app/app/modules/home/widgets/bottom_navigation_bar_item_image.dart';
import 'package:taski_app/app/theme/app_colors.dart';

class TaskiBottomNavigationBar extends StatefulWidget {
  const TaskiBottomNavigationBar({super.key});

  @override
  State<TaskiBottomNavigationBar> createState() =>
      _TaskiBottomNavigationBarState();
}

class _TaskiBottomNavigationBarState
    extends HomeStoreStateFulWidget<TaskiBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return SafeArea(
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Container(
            padding: EdgeInsets.only(bottom: 10),
            child: BottomNavigationBar(
              enableFeedback: false,
              elevation: 0,
              backgroundColor: Colors.white,
              currentIndex: homeStore.bottomNavPageType.index,
              onTap: (index) {
                var pageType = BottomNavPageType.values[index];
                if (pageType == BottomNavPageType.create) {
                  ModalHelper.showBottomSheet(context);
                } else {
                  homeStore
                      .setBottomNavPageType(BottomNavPageType.values[index]);
                }
              },
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 3.75.w,
                color: AppColors.blue,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 3.75.w,
                color: AppColors.mutedAzure,
              ),
              selectedItemColor: AppColors.blue,
              unselectedItemColor: AppColors.mutedAzure,
              items: BottomNavPageType.values
                  .map(
                    (e) => BottomNavigationBarItem(
                        backgroundColor: Colors.white,
                        icon: BottomNavigationBarItemImage(
                            assetPath: e.icon,
                            active: e == homeStore.bottomNavPageType),
                        label: e.name),
                  )
                  .toList(),
            ),
          ),
        ),
      );
    });
  }
}
