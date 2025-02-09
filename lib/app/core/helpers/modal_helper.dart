import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taski_app/app/app_widget.dart';
import 'package:taski_app/app/modules/home/widgets/create_task_modal.dart';

class ModalHelper {
  static void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      constraints: BoxConstraints(
        minWidth: 100.w,
        maxWidth: 100.w,
        minHeight: 45.h,
      ),
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (context) {
        return const CreateTaskModal();
      },
    );
  }

  static Future<void> createModalLoadingDialog(
      {Color colorCircularLoading = Colors.white}) async {
    return showDialog(
      barrierDismissible: false,
      context: navKey.currentContext!,
      builder: (context) {
        return Center(
            child: SizedBox(
          width: 64,
          height: 64,
          child: CircularProgressIndicator(
            color: colorCircularLoading,
            strokeWidth: 6,
          ),
        ));
      },
    );
  }
}
