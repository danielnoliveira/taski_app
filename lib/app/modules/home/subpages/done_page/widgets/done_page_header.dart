import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taski_app/app/theme/app_colors.dart';

class DoneListHeader extends StatelessWidget {
  final VoidCallback deleteEveryTask;
  const DoneListHeader({super.key, required this.deleteEveryTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
      ).copyWith(bottom: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Completed Tasks',
            style: TextStyle(
              color: AppColors.statePurple,
              fontSize: 5.3.w,
              fontWeight: FontWeight.w700,
            ),
          ),
          GestureDetector(
            onTap: deleteEveryTask,
            behavior: HitTestBehavior.opaque,
            child: Text(
              'Delete all',
              style: TextStyle(
                color: AppColors.fireRed,
                fontSize: 4.7.w,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
