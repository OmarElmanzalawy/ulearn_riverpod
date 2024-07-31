import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/pages/sign_in/widgets.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: Container(),
      )
    );
  }
}