import 'package:echo_chat/core/app_colors.dart';
import 'package:flutter/material.dart';

class TextFieldDivider extends StatelessWidget {
  const TextFieldDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 2,
      color: AppColors.green,
    );
  }
}
