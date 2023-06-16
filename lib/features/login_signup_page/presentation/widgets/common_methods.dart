import 'package:echo_chat/core/app_colors.dart';
import 'package:echo_chat/core/app_strings.dart';
import 'package:flutter/material.dart';

class CommonMethods{
  static  labelTextStyle(){
    return const TextStyle(
      fontSize: 12,
      color: AppColors.darkGreen,
      fontWeight: FontWeight.w600,
    );
  }

  static textFieldTextStyle(){
    return const TextStyle(
      color: AppColors.darkGreen,
      fontWeight: FontWeight.w500,
    );
  }

  static inputDecoration(String text){
    return InputDecoration(
      border: InputBorder.none,
      counterText: AppStrings.emptyString,
      hintText: text,
      hintStyle: TextStyle(
        color: Colors.grey.withOpacity(0.7),
      ),
    );
  }
}