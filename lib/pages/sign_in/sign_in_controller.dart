import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearn_riverpod/common/entities/entities.dart';
import 'package:ulearn_riverpod/common/utils/global_loader/global_loader.dart';
import 'package:ulearn_riverpod/common/widgets/pop_up_message.dart';
import 'package:ulearn_riverpod/pages/notifiers/sign_in_notifier.dart';

class SignInController{

  WidgetRef ref;
  SignInController(this.ref);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleSignIn()async{
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;

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

    ref.read(appLoaderProvider.notifier).setValue(true);
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
        String? email = user.email;
        String? photoUrl = user.photoURL;
        String? id = user.uid;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();

        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.email = email;
        loginRequestEntity.name = displayName;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;
        asyncPostAllData(loginRequestEntity);
        print('User logged in');
        
      }
      else{
        popupError('Login Error');
      }
      
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        popupError('No user found for that email.') ;
      } else if (e.code == 'wrong-password') {
        popupError('Wrong Password');
      } else if (e.code == 'invalid-email') {
        popupError('Invalid Email') ;
      } else if (e.code == 'wrong-password') {
        popupError('Wrong Password') ;
      } else if (e.code == 'too-many-requests') {
        popupError('Stop Spamming!') ;    
      } 
      else if (e.code == 'invalid-credential') {
        popupError('Invalid Details') ;
      }
      else {
        print('Code: ${e.code}');
        popupError('Unkown Error Occured');
      }
    }
    catch(e){
      print(e.toString());
      //ref.read(appLoaderProvider.notifier).setValue(false);
    }
    ref.read(appLoaderProvider.notifier).setValue(false);

  }
      void asyncPostAllData(LoginRequestEntity loginRequestEntity){
      

     
    }

}