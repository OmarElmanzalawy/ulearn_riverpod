import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ulearn_riverpod/common/widgets/text_widgets.dart';
import 'package:ulearn_riverpod/pages/welcome/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: [
                WelcomePageElement(_pageController,
                    index: 0,
                    title: 'First See Learning',
                    subtitle: 'Forget about of paper knowledge in one learning',
                    imagepath: 'assets/images/reading.png'),
                WelcomePageElement(_pageController,
                    index: 1,
                    title: 'Connect with Everyone',
                    subtitle:
                        'Always keep in touch with your tutor and friends. Let\'s get connected!',
                    imagepath: 'assets/images/man.png'),
                WelcomePageElement(_pageController,
                    index: 2,
                    title: 'Always Fascinated Learning',
                    subtitle:
                        'Anywhere, Anytime. Time is at your discretion. So study wherever you want',
                    imagepath: 'assets/images/boy.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
