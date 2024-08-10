import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_banner_notifier.g.dart';

@riverpod
class HomeBannerDots extends _$HomeBannerDots{

  @override
  int build() => 0;

  void setIndex(int index){
    state = index;
  }
}
