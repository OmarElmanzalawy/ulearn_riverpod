import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/app_colors.dart';
import 'package:ulearn_riverpod/common/utils/global_loader/global_loader.dart';
import 'package:ulearn_riverpod/common/widgets/app_bar.dart';
import 'package:ulearn_riverpod/common/widgets/app_textfield.dart';
import 'package:ulearn_riverpod/common/widgets/button_widgets.dart';
import 'package:ulearn_riverpod/common/widgets/text_widgets.dart';
import 'package:ulearn_riverpod/pages/notifiers/register_notifier.dart';
import 'package:ulearn_riverpod/pages/sign_in/widgets.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearn_riverpod/pages/sign_up/sign_up_controller.dart';

/* 
Difference between ConsumerWidget and ConsumerStatefulWidget:
ConsumerWidget: A stateless widget that allows you to read providers and rebuild when their state changes.
ConsumerStatefulWidget: A stateful widget that integrates with flutter_riverpod to read providers while allowing for local state management.
*/
class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late SignUpController _controller;

  @override
  void initState() {
    _controller = SignUpController(ref);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final registerProvider = ref.watch(registerNotifierProvider);
    final isLoading = ref.watch(appLoaderProvider);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(title: 'Signup'),
            body: !isLoading
                ? SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: Text14Normal(
                                  text:
                                      'Enter your details below & free sign up')),
                          const SizedBox(
                            height: 50,
                          ),
                          appTextField(
                            controller: _controller.userNameController,
                            text: 'Username',
                            iconName: 'user.png',
                            hintText: 'Enter your username',
                            onChanged: (value) {
                              ref
                                  .read(registerNotifierProvider.notifier)
                                  .onUserNameChanged(value);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          appTextField(
                            controller: _controller.emailController,
                            text: 'Email',
                            iconName: 'lock.png',
                            hintText: 'Enter your email',
                            onChanged: (value) {
                              ref
                                  .read(registerNotifierProvider.notifier)
                                  .onEmailChanged(value);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          appTextField(
                            controller:  _controller.passwordController,
                            text: 'Password',
                            iconName: 'lock.png',
                            hintText: 'Enter your password',
                            sensitive: true,
                            onChanged: (value) {
                              ref
                                  .read(registerNotifierProvider.notifier)
                                  .onPasswordChanged(value);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          appTextField(
                            controller: _controller.rePasswordController,
                            text: 'Confirm Password',
                            iconName: 'lock.png',
                            hintText: 'Confirm your password',
                            sensitive: true,
                            onChanged: (value) {
                              ref
                                  .read(registerNotifierProvider.notifier)
                                  .onRePasswordChanged(value);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: Text14Normal(
                                  text:
                                      'By creating an account you have to agree with our terms & conditions',
                                  alignment: TextAlign.start)),
                          const SizedBox(
                            height: 80,
                          ),
                          Center(
                            child: Column(
                              children: [
                                appTextButton(
                                    title: 'Register',
                                    ontap: () {
                                      _controller.handleSignUp();
                                    }),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                    backgroundColor: AppColors.primaryElement,
                  ))));
  }
}
