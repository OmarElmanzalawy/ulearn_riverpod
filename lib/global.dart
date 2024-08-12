import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/services/storage.dart';
import 'package:ulearn_riverpod/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

//TODO: FIX APP CRASHING WHEN IT DOESN'T FIND USERPROFILE DATA FROM SHARED STORAGE
class Global {
  static late StorageService storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    print('firebase initialized');
    var auth =
        FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      print('User: $user');

      if (user == null) {
        print('User is currently signed out');
      } else {
        print('User is signed in');
        await FirebaseAuth.instance.signOut();
        print('signed out');
      }
    });
    storageService = await StorageService().init();
  }
}
