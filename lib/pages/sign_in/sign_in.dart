import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/app_colors.dart';
import 'package:ulearn_riverpod/common/widgets/app_bar.dart';
import 'package:ulearn_riverpod/common/widgets/app_textfield.dart';
import 'package:ulearn_riverpod/common/widgets/button_widgets.dart';
import 'package:ulearn_riverpod/common/widgets/text_widgets.dart';
import 'package:ulearn_riverpod/pages/notifiers/sign_in_notifier.dart';
import 'package:ulearn_riverpod/pages/sign_in/sign_in_controller.dart';
import 'package:ulearn_riverpod/pages/sign_in/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  
  late SignInController _controller;

  @override
  void initState() {
    _controller = SignInController(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInNotifierProvider);
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
                appTextField(text: 'Email',iconName: 'user.png',hintText: 'Enter your email address',
                onChanged: (value) {
                  ref.read(signInNotifierProvider.notifier).onEmailChanged(value);
                },
                ),
                SizedBox(height: 20,),
                appTextField(text: 'Password',iconName: 'lock.png',hintText: 'Enter your password',sensitive: true,
                  onChanged: (value) {
                  ref.read(signInNotifierProvider.notifier).onPasswordChanged(value);
                },
                ),
                SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: textUnderline(text: 'Forgot Password'),
                ),
                SizedBox(height: 130,),
                Center(
                  child: Column(
                    children: [
                      appTextButton(title: 'Login', ontap: (){
                        _controller.handleSignIn();
                      }),
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