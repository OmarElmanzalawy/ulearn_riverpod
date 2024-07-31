import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'welcome_notifier.g.dart';

@riverpod
class IndexDot extends _$IndexDot{

  @override
  int build(){
    return 0;
  }

  void updateValue(int value){
    state = value;
  }

}