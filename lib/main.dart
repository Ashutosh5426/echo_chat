import 'package:echo_chat/features/chats_page/presentation/bloc/chat_page_bloc.dart';
import 'package:echo_chat/features/login_signup_page/presentation/bloc/login_signup_bloc.dart';
import 'package:echo_chat/features/login_signup_page/presentation/pages/signup_page.dart';
import 'package:echo_chat/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HomePage(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<ChatPageBloc>(
            create: (BuildContext context) => ChatPageBloc(),
          ),
          BlocProvider<LoginSignupBloc>(
            create: (BuildContext context) => LoginSignupBloc(),
          ),
        ],
        child: SignupPage(),
        // child: HomePage(),
      ),
    );
  }
}
