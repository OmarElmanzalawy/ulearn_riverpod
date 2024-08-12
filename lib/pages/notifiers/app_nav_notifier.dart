import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_nav_notifier.g.dart';

@riverpod
class HomeNavNotifier extends _$HomeNavNotifier{

  @override
  int build(){
    return 0;
  }
   
  void updateValue(int value){
    state = value;
  }

}