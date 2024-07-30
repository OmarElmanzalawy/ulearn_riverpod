import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ulearn_riverpod/common/widgets/text_widgets.dart';
import 'package:ulearn_riverpod/pages/welcome/widgets.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final indexProvider = StateProvider<int>((ref)=>0);

class WelcomeScreen extends ConsumerWidget {
  WelcomeScreen({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final index = ref.watch(indexProvider);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            PageView(
              onPageChanged: (value){
                ref.read(indexProvider.notifier).state = value;
              },
              controller: _pageController,
              children: [
                welcomePageElement(_pageController,
                    index: 1,
                    title: 'First See Learning',
                    subtitle: 'Forget about of paper knowledge in one learning',
                    imagepath: 'assets/images/reading.png'),
                welcomePageElement(_pageController,
                    index: 2,
                    title: 'Connect with Everyone',
                    subtitle:
                        'Always keep in touch with your tutor and friends. Let\'s get connected!',
                    imagepath: 'assets/images/man.png'),
                welcomePageElement(_pageController,
                    index: 3,
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
