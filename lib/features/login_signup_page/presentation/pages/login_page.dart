import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(14, 27, 35, 0.5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 100),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 10),
                  hintText: 'enter your username',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: () {},
              elevation: 10,
              color: Colors.green.withOpacity(0.2),
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.2,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
