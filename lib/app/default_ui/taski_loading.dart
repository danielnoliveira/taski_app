import 'package:flutter/material.dart';
import 'package:taski_app/app/theme/app_colors.dart';

class TaskiLoading extends StatelessWidget {
  const TaskiLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: 32,
        child: CircularProgressIndicator(
          color: AppColors.blue,
        ),
      ),
    );
  }
}
