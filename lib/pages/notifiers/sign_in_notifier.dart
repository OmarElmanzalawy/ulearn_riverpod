import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearn_riverpod/pages/notifiers/sign_in_state.dart';

class SignInNotifier extends StateNotifier<SignInState>{

  SignInNotifier():super(const SignInState());
  
  void onEmailChanged(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(password: password);
  }

}

  final signInNotifierProvider = StateNotifierProvider<SignInNotifier,SignInState>((ref) {
    return SignInNotifier();
  });