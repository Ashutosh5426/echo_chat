import 'package:flutter/material.dart';

class ChatPageShimmer extends StatelessWidget {
  const ChatPageShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(14, 27, 35, 0.5),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
