import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/services/storage.dart';
import 'package:ulearn_riverpod/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class Global{
  static late StorageService storageService;

  static Future init() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print('firebase initialized');
    storageService = await StorageService().init();
  }

}