import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/pages/sign_in/sign_in.dart';
import 'package:ulearn_riverpod/pages/welcome/welcome.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //Changes default back button icon
        actionIconTheme: ActionIconThemeData(
          backButtonIconBuilder: (context) {
            return const Icon(Icons.arrow_back_ios);
          },
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true
      ),
      initialRoute: '/',
      routes: {
        '/':(context) =>  WelcomeScreen(),
        '/signin':(context) => const SignIn()
      },
    );
  }
}
