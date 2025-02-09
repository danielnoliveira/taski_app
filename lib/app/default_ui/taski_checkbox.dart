import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:taski_app/app/theme/app_colors.dart';

class TaskiCheckbox extends StatelessWidget {
  final double size;
  final bool isChecked;
  const TaskiCheckbox({super.key, this.size = 32, required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isChecked ? AppColors.blue : AppColors.paleWhite,
        border: Border.all(
            width: 2, color: isChecked ? AppColors.blue : AppColors.mutedAzure),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Icon(
        MdiIcons.check,
        color: isChecked ? Colors.white : AppColors.paleWhite,
      ),
    );
  }
}
