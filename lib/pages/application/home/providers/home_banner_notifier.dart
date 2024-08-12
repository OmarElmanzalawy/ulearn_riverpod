import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_banner_notifier.g.dart';

//keep alives ensures that the state is not disposed when moving across screens so in this case the index of the banner is preserved
@Riverpod(keepAlive: true)
class HomeBannerDots extends _$HomeBannerDots{

  @override
  int build() => 0;

  void setIndex(int index){
    state = index;
  }
}
