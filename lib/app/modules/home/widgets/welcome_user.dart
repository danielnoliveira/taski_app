import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import 'package:taski_app/app/theme/app_colors.dart';

class WelcomeUser extends StatelessWidget {
  const WelcomeUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: RichText(
        text: TextSpan(
          text: 'Welcome, ',
          style: TextStyle(
            fontSize: 5.3.w,
            fontWeight: FontWeight.bold,
            color: AppColors.statePurple,
          ),
          children: [
            TextSpan(
              text: 'John',
              style: TextStyle(
                color: AppColors.blue,
              ),
            ),
            TextSpan(text: '.'),
          ],
        ),
      ),
    );
  }
}
