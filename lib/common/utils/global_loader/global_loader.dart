import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearn_riverpod/pages/notifiers/register_state.dart';
part 'global_loader.g.dart';

@riverpod
class AppLoader extends _$AppLoader {
  @override
  bool build() {
    return false;
  }

  void setValue(bool value) {
    state = value;
  }
}
