import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearn_riverpod/pages/notifiers/register_state.dart';
part 'register_notifier.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier{

  @override
  RegisterState build(){

    return RegisterState();
    
  }
}