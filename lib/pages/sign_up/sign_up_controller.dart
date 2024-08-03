import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearn_riverpod/common/utils/global_loader/global_loader.dart';
import 'package:ulearn_riverpod/common/widgets/pop_up_message.dart';
import 'package:ulearn_riverpod/pages/notifiers/register_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpController {
  final WidgetRef ref;
  SignUpController(this.ref);

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  void handleSignUp() async {
    var state = ref.read(registerNotifierProvider);

    //To preserve text inside textfields if ui get rebuilt so user doesn't have to retype it again
    userNameController.text = state.userName;
    emailController.text = state.email;
    passwordController.text = state.password;
    rePasswordController.text = state.rePassword;

    print('Your name is ${state.userName}');
    print('Your email is ${state.email}');
    print('Your password is ${state.password}');
    print('Your repassword is ${state.rePassword}');

    if (state.userName.isEmpty) {
      popupInfo('Fill user name');
      return;
    }

    if (state.userName.length < 4) {
      popupInfo('User name is too short');
      return;
    }

    if (state.password.isEmpty || state.rePassword.isEmpty) {
      popupInfo('Fill password');
      return;
    }

    if (!state.email.contains('@')) {
      popupInfo('Invalid Email');
      return;
    }

    if (state.rePassword != state.password) {
      popupInfo('Passwords do not match');
      return;
    }

    ref.read(appLoaderProvider.notifier).setValue(true);

    var context = Navigator.of(ref.context);
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: state.email, password: state.password);

      if (credential != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(state.userName);

        popupInfo('A verification email has been sent to you.');
        context.pop();
      }
    }
    on FirebaseAuthException catch(e){

      if(e.code=='weak-password'){
        popupInfo('This password is too weak');
      }
      else if(e.code=='email-already-in-use'){
        popupInfo('This email has already been registered with an account');
      }
      else if(e.code=='invalid-email'){
        popupInfo('Invalid Email');
      }

    }
     catch (e) {
      print('error: $e');
    }
    ref.read(appLoaderProvider.notifier).setValue(false);
  }
}
