import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taski_app/app/theme/app_colors.dart';

class BottomNavigationBarItemImage extends StatelessWidget {
  final String assetPath;
  final bool active;
  const BottomNavigationBarItemImage({
    super.key,
    required this.assetPath,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Image.asset(
        assetPath,
        width: 24,
        height: 24,
        color: active ? AppColors.blue : AppColors.mutedAzure,
        fit: BoxFit.contain,
      ),
    );
  }
}
