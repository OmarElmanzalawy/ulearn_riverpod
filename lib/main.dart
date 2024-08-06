import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/routes/route_names.dart';
import 'package:ulearn_riverpod/common/utils/app_styles.dart';
import 'package:ulearn_riverpod/firebase_options.dart';
import 'package:ulearn_riverpod/global.dart';
import 'package:ulearn_riverpod/pages/home/home.dart';
import 'package:ulearn_riverpod/pages/sign_in/sign_in.dart';
import 'package:ulearn_riverpod/pages/sign_up/sign_up.dart';
import 'package:ulearn_riverpod/pages/welcome/welcome.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  await Global.init();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appThemeData,
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? RouteNames.WELCOME : RouteNames.HOME,
      routes: {
        RouteNames.WELCOME: (context) => WelcomeScreen(),
        RouteNames.SIGN_IN: (context) => const SignIn(),
        RouteNames.SIGN_UP: (context) => const SignUp(),
       RouteNames.HOME: (context) => const Home(),
      },
    );
  }
}
