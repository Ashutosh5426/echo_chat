import 'package:echo_chat/features/chats_page/presentation/pages/chat_page.dart';
import 'package:echo_chat/core/app_strings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text(AppStrings.echoChat),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Please select a user', style: TextStyle(fontSize: 16),),
            const SizedBox(height: 20),
            /// User 1- John Doe
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatPage(userId: 'JD1234'),
                    // builder: (context) => UserInformation(),
                  ),
                );
              },
              child: const SizedBox(
                width: 120,
                child: Text(
                  'John Doe',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1),
                ),
              ),
            ),

            /// User 2- Peter Russell
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatPage(userId: 'PR1234'),
                    // builder: (context) => UserInformation(),
                  ),
                );
              },
              child: const SizedBox(
                width: 120,
                child: Text(
                  AppStrings.peterRussell,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Image.asset('assets/images/echo_logo.png'),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}