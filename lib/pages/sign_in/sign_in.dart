import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/widgets/text_widgets.dart';
import 'package:ulearn_riverpod/pages/sign_in/widgets.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: Column(
          children: [
            //top login buttons
            thirdPartyLogin(),
            Text14Normal(text: 'Or use your email account to login'),
            appTextField()
          ],
        )
      )
    );
  }
}