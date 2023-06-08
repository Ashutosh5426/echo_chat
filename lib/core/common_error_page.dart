import 'package:echo_chat/core/app_strings.dart';
import 'package:flutter/material.dart';

class CommonErrorPage extends StatelessWidget {
  const CommonErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text(AppStrings.someWentWrong)),
    );
  }
}
