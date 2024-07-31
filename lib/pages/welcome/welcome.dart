import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ulearn_riverpod/common/widgets/text_widgets.dart';
import 'package:ulearn_riverpod/pages/notifiers/welcome_notifier.dart';
import 'package:ulearn_riverpod/pages/welcome/widgets.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//replaced this provider with indexDotProvider auto-generated in notifiers folder
final indexProvider = StateProvider<int>((ref)=>0);

class WelcomeScreen extends ConsumerWidget {
  WelcomeScreen({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final index = ref.watch(indexDotProvider);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            PageView(
              onPageChanged: (value){
                ref.read(indexDotProvider.notifier).updateValue(value);
              },
              controller: _pageController,
              children: [
                welcomePageElement(_pageController,
                    index: 1,
                    context: context,
                    title: 'First See Learning',
                    subtitle: 'Forget about of paper knowledge in one learning',
                    imagepath: 'assets/images/reading.png'),
                welcomePageElement(_pageController,
                    index: 2,
                    context: context,
                    title: 'Connect with Everyone',
                    subtitle:
                        'Always keep in touch with your tutor and friends. Let\'s get connected!',
                    imagepath: 'assets/images/man.png'),
                welcomePageElement(_pageController,
                    index: 3,
                    context: context,
                    title: 'Always Fascinated Learning',
                    subtitle:
                        'Anywhere, Anytime. Time is at your discretion. So study wherever you want',
                    imagepath: 'assets/images/boy.png'),
              ],
            ),
          Positioned(
            bottom: 50,
            child: DotsIndicator(
              position: index,
              dotsCount: 3,
              mainAxisAlignment: MainAxisAlignment.center,
            decorator: DotsDecorator(
              color: Colors.blue,
              size: const Size.square(9),
              activeSize: Size(24,8),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              )
            ),
            )
            ),
          ],
        ),
      ),
    );
  }
}
