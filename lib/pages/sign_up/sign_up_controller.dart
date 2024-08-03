import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearn_riverpod/common/utils/global_loader/global_loader.dart';
import 'package:ulearn_riverpod/common/widgets/pop_up_message.dart';
import 'package:ulearn_riverpod/pages/notifiers/register_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpController {
  final WidgetRef ref;
  SignUpController(this.ref);

  void handleSignUp() async {
    var state = ref.read(registerNotifierProvider);

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

    if (state.password.length <= 5) {
      popupInfo('Password is too short');
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
    } catch (e) {
      print('error: $e');
    }
    ref.read(appLoaderProvider.notifier).setValue(false);
  }
}
