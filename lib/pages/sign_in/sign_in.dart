import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/app_colors.dart';
import 'package:ulearn_riverpod/common/widgets/app_bar.dart';
import 'package:ulearn_riverpod/common/widgets/app_textfield.dart';
import 'package:ulearn_riverpod/common/widgets/button_widgets.dart';
import 'package:ulearn_riverpod/common/widgets/text_widgets.dart';
import 'package:ulearn_riverpod/pages/sign_in/widgets.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(title: 'Login'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //top login buttons
                thirdPartyLogin(),
                Center(child: Text14Normal(text: 'Or use your email account to login')),
                SizedBox(height: 50,),
                appTextField(text: 'Email',iconName: 'user.png',hintText: 'Enter your email address'),
                SizedBox(height: 20,),
                appTextField(text: 'Password',iconName: 'lock.png',hintText: 'Enter your password',sensitive: true),
                SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: textUnderline(text: 'Forgot Password'),
                ),
                SizedBox(height: 130,),
                Center(
                  child: Column(
                    children: [
                      appTextButton(title: 'Login', ontap: ()=> print('Login')),
                      SizedBox(height: 15,),
                      appTextButton(title: 'Signup',backgroundcolor: AppColors.primaryBackground,textColor: AppColors.primaryText,hasBorder: true,
                      ontap: (){
                        Navigator.pushNamed(context, '/signup');
                      }
                      ),
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