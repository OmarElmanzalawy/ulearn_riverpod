import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/app_styles.dart';
import 'package:ulearn_riverpod/firebase_options.dart';
import 'package:ulearn_riverpod/pages/sign_in/sign_in.dart';
import 'package:ulearn_riverpod/pages/sign_up/sign_up.dart';
import 'package:ulearn_riverpod/pages/welcome/welcome.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appThemeData,
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/signin': (context) => const SignIn(),
        '/signup': (context) => const SignUp(),
      },
    );
  }
}
