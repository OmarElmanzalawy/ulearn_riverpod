import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearn_riverpod/pages/notifiers/register_state.dart';
part 'register_notifier.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier {
  @override
  RegisterState build() {
    return RegisterState();
  }

  void onUserNameChanged(String name) {
    state = state.copyWith(userName: name);
  }

  void onEmailChanged(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(password: password);
  }

  void onRePasswordChanged(String repassword) {
    state = state.copyWith(rePassword: repassword);
  }
}
