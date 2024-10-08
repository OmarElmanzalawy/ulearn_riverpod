import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/routes/route_names.dart';
import 'package:ulearn_riverpod/common/widgets/app_shadow.dart';
import 'package:ulearn_riverpod/common/widgets/text_widgets.dart';

Widget welcomePageElement(
  PageController controller, {
  required BuildContext context,
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
      _nextButton(index, controller, context),
    ],
  );
}

Widget _nextButton(
    double index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      print(index);
      if (index < 3) {
        controller.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      } else {
        Navigator.pushNamed(context, RouteNames.SIGN_IN);
      }
    },
    child: Container(
      width: 325,
      height: 50,
      margin: const EdgeInsets.only(top: 100, left: 25, right: 25),
      decoration: appBoxShadow(),
      child: Center(
          child: Text16Normal(
              text: index == 3 ? 'Get Started' : 'Next', color: Colors.white)),
    ),
  );
}
