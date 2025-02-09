import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taski_app/app/core/helpers/modal_helper.dart';
import 'package:taski_app/app/theme/app_colors.dart';
import 'package:taski_app/resources/resources.dart';

class NoTasksListed extends StatelessWidget {
  final bool showCreateTaskButton;
  const NoTasksListed({super.key, this.showCreateTaskButton = true});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Images.undraw,
            width: 25.w,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Text(
              'You have no task listed',
              style: TextStyle(
                color: AppColors.stateBlue,
                fontWeight: FontWeight.w500,
                fontSize: 4.2.w,
              ),
            ),
          ),
          if (showCreateTaskButton)
            GestureDetector(
              onTap: () {
                ModalHelper.showBottomSheet(context);
              },
              child: Container(
                margin: EdgeInsets.only(top: 28),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.blue.withAlpha(19),
                ),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.add,
                      size: 4.7.w,
                      color: AppColors.blue,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        'Create Task',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.blue,
                          fontSize: 4.65.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
