import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import 'package:taski_app/app/theme/app_colors.dart';

class TasksTitleWarning extends StatelessWidget {
  final String message;
  const TasksTitleWarning({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    if (message.isEmpty) {
      return const SizedBox();
    }
    return Padding(
      padding: EdgeInsets.only(top: 10.0, left: 6.w),
      child: Text(
        message,
        style: TextStyle(
          fontSize: 4.2.w,
          fontWeight: FontWeight.bold,
          color: AppColors.stateBlue,
        ),
      ),
    );
  }
}
