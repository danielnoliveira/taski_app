import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ValidatorFunction = String? Function(String?)?;

class TaskiTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final FocusNode? nextFocus;
  final Widget leftIcon;
  final String hintText;
  final ValidatorFunction validator;
  const TaskiTextField(
      {super.key,
      required this.textEditingController,
      required this.focusNode,
      this.nextFocus,
      required this.leftIcon,
      required this.hintText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      focusNode: focusNode,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: leftIcon,
      ),
      onFieldSubmitted: (value) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
    );
  }
}
