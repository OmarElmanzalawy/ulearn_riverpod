import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ulearn_riverpod/common/widgets/text_widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 345,
                      height: 345,
                      child: Image.asset('assets/images/reading.png', fit: BoxFit.fitWidth,),
                    ),
                    Text24Normal(text: 'First See Learning', color: Colors.blue)
                  ],
                ),
                SizedBox(
                  width: 345,
                  height: 345,
                  child: Image.asset('assets/images/boy.png'),
                ),
                SizedBox(
                  width: 345,
                  height: 345,
                  child: Image.asset('assets/images/reading.png'),
                ),
              ],
            ),
            Positioned(
              child: Text('Widget one'),
              left: 20,
              bottom: 100,
              ),
          ],
        ),
      ),
    );
  }
}
