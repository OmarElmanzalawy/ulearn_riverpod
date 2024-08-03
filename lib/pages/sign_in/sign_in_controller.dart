import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearn_riverpod/common/widgets/pop_up_message.dart';
import 'package:ulearn_riverpod/pages/notifiers/sign_in_notifier.dart';

class SignInController{

  WidgetRef ref;
  SignInController(this.ref);

  void handleSignIn()async{
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;

    print('my email is $email');
    print('my password is $password');


    if (state.password.length <= 5) {
      popupInfo('Password is too short');
      return;
    }

    if (!state.email.contains('@')) {
      popupInfo('Invalid Email');
      return;
    }

    try{

      final UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      if(credential.user==null){
        popupInfo('User not found');
      }

      if(!credential.user!.emailVerified){
        popupInfo('You must verify email first');
      }

      var user = credential.user;
      if(user!=null){
        String? displayName = user.displayName;
        String? photoUrl = user.photoURL;
        String? id = user.uid;
        
      }
    }
    catch(e){

    }

  }
}