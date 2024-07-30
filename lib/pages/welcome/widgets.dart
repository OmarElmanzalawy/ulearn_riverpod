import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/widgets/app_shadow.dart';
import 'package:ulearn_riverpod/common/widgets/text_widgets.dart';

Widget welcomePageElement(
  PageController controller, {
  double index = 0,
  String title = '',
  String subtitle = '',
  String imagepath = '',
}) {
  return Column(
    children: [
      Container(
        child: Image.asset(
          imagepath,
          fit: BoxFit.fitWidth,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Text24Normal(text: title),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30, top: 15.0, right: 30),
        child: Text16Normal(text: subtitle),
      ),
      _nextButton(index, controller),
    ],
  );
}

Widget _nextButton(double index, PageController controller) {
  return GestureDetector(
    onTap: () {
      print(index);
      if (index <= 3) {
        controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.linear);
      }
    },
    child: Container(
      width: 325,
      height: 50,
      margin: EdgeInsets.only(top: 100, left: 25, right: 25),
      decoration: appBoxShadow(),
      child: Center(child: Text16Normal(text: index == 3 ? 'Get Started' : 'Next', color: Colors.white)),
    ),
  );
}
