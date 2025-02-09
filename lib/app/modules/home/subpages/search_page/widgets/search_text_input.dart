import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:taski_app/app/core/mixins/automatic_search_mixin.dart';
import 'package:taski_app/app/theme/app_colors.dart';

class SearchTextInput extends StatefulWidget {
  final TextEditingController textEditingController;
  final void Function(String text) onChangedAutomaticSearch;
  const SearchTextInput(
      {super.key,
      required this.textEditingController,
      required this.onChangedAutomaticSearch});

  static final defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(
      width: 1,
      color: AppColors.blue,
    ),
  );

  @override
  State<SearchTextInput> createState() => _SearchTextInputState();
}

class _SearchTextInputState extends State<SearchTextInput> {
  TextEditingController get mainTextController => widget.textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w).copyWith(bottom: 6),
      child: TextField(
        controller: mainTextController,
        onChanged: (value) {
          setState(() {});
          widget.onChangedAutomaticSearch(value);
        },
        decoration: InputDecoration(
          hintText: 'Name or description of the task...',
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 14, right: 8),
            child: Icon(
              Icons.search,
              size: 24,
            ),
          ),
          suffixIcon: mainTextController.text.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(right: 14, left: 8),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      mainTextController.clear();
                    },
                    child: Icon(
                      MdiIcons.closeCircle,
                      size: 24,
                      color: AppColors.mutedAzure,
                    ),
                  ),
                )
              : null,
          prefixIconColor: AppColors.blue,
          prefixIconConstraints: BoxConstraints.loose(Size(46, 24)),
          suffixIconConstraints: BoxConstraints.loose(Size(46, 24)),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          fillColor: AppColors.paleWhite,
          isDense: true,
          hintStyle: TextStyle(
            fontSize: 4.2.w,
            fontWeight: FontWeight.w400,
            color: AppColors.mutedAzure,
          ),
          border: SearchTextInput.defaultBorder,
          focusedBorder: SearchTextInput.defaultBorder,
          enabledBorder: SearchTextInput.defaultBorder,
        ),
        cursorHeight: 4.2.w,
        style: TextStyle(
          fontSize: 4.2.w,
          fontWeight: FontWeight.w500,
          color: AppColors.statePurple,
        ),
      ),
    );
  }
}
