import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/widgets/app_shadow.dart';
import 'package:ulearn_riverpod/common/widgets/text_widgets.dart';

Widget WelcomePageElement(
  PageController controller, {
  double index = 0,
  String title = '',
  String subtitle = '',
  String imagepath = '',
}) {
  return Column(
    children: [
      Container(
        width: 345,
        height: 345,
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
        padding: const EdgeInsets.only(left: 15, top: 15.0, right: 15),
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
      if (index < 3) {
        controller.animateTo(index + 1,
            duration: Duration(milliseconds: 300), curve: Curves.bounceIn);
      }
    },
    child: Container(
      width: 325,
      height: 50,
      margin: EdgeInsets.only(top: 100, left: 25, right: 25),
      decoration: appBoxShadow(),
      child: Center(child: Text16Normal(text: 'Next', color: Colors.white)),
    ),
  );
}
