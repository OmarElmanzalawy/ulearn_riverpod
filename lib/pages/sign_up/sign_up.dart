import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/app_colors.dart';
import 'package:ulearn_riverpod/common/widgets/app_bar.dart';
import 'package:ulearn_riverpod/common/widgets/app_textfield.dart';
import 'package:ulearn_riverpod/common/widgets/button_widgets.dart';
import 'package:ulearn_riverpod/common/widgets/text_widgets.dart';
import 'package:ulearn_riverpod/pages/sign_in/widgets.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(title: 'Signup'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
                Center(child: Text14Normal(text: 'Enter your details below & free sign up')),
                const SizedBox(height: 50,),
                appTextField(text: 'Username',iconName: 'user.png',hintText: 'Enter your username'),
                const SizedBox(height: 20,),
                appTextField(text: 'Email',iconName: 'lock.png',hintText: 'Enter your email'),
                const SizedBox(height: 20,),
                appTextField(text: 'Password',iconName: 'lock.png',hintText: 'Enter your password',sensitive: true),
                const SizedBox(height: 20,),
                appTextField(text: 'Confirm Password',iconName: 'lock.png',hintText: 'Confirm your password',sensitive: true),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text14Normal(text: 'By creating an account you have to agree with our terms & conditions',alignment: TextAlign.start)
                ),
                const SizedBox(height: 80,),
                Center(
                  child: Column(
                    children: [
                      appTextButton(title: 'Register', ontap: ()=> print('Register')),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      )
    );
  }
}