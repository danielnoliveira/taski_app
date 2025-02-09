import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:taski_app/app/theme/app_colors.dart';

class PaleDoneCheckbox extends StatelessWidget {
  final double size;
  const PaleDoneCheckbox({
    super.key,
    this.size = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mutedAzure,
        border: Border.all(width: 2, color: AppColors.mutedAzure),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Icon(
        MdiIcons.check,
        color: AppColors.paleWhite,
      ),
    );
  }
}
