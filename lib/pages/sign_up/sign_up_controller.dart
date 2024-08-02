import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearn_riverpod/common/widgets/pop_up_message.dart';
import 'package:ulearn_riverpod/pages/notifiers/register_notifier.dart';

class SignUpController {
  final WidgetRef ref;
  SignUpController(this.ref);

  void handleSignUp() {
    var state = ref.read(registerNotifierProvider);

    print('Your name is ${state.userName}');
    print('Your email is ${state.email}');
    print('Your password is ${state.password}');
    print('Your repassword is ${state.rePassword}');

    if (state.rePassword != state.password) {
      popupError('Passwords do not match');
    }
  }
}
