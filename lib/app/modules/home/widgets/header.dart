import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import 'package:taski_app/app/theme/app_colors.dart';
import 'package:taski_app/resources/resources.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 24)
          .copyWith(bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            Images.logo,
            width: 22.5.w,
            fit: BoxFit.contain,
          ),
          Row(
            children: [
              Text(
                'John',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 4.8.w,
                  color: AppColors.statePurple,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image.asset(
                  Images.avatar,
                  width: 9.6.w,
                  height: 9.6.w,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
