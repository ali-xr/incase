import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Incase/assats/colors/colors.dart';
import 'package:Incase/features/building/pages/select_flat.dart';
import 'package:Incase/features/common/widgets/navigation.dart';
import 'package:Incase/features/common/widgets/password_text_field.dart';
import 'package:Incase/features/common/widgets/w_button.dart';
import 'package:Incase/features/common/widgets/w_scale.dart';
import 'package:Incase/features/common/widgets/default_text_field.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController fullNameController;
  late TextEditingController mailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    fullNameController = TextEditingController();
    mailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    mailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: darkBlue,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarIconBrightness: Brightness.light),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://nestone.uz/img/apartments-gallery/gallery-block-2/2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Color.fromRGBO(32, 41, 51, 0.32),
                          Color(0xFF202933)
                        ])),
                  ),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          const Spacer(flex: 2),
                          Text(
                            'Hello!\nReady to explore?',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const Spacer(),
                          DefaultTextField(
                            maxLines: 1,
                            onChanged: (value) {
                              setState(() {});
                            },
                            title: 'Full name',
                            controller: fullNameController,
                          ),
                          const SizedBox(height: 22),
                          DefaultTextField(
                            maxLines: 1,
                            onChanged: (value) {
                              setState(() {});
                            },
                            title: 'Email address',
                            controller: mailController,
                          ),
                          const SizedBox(height: 22),
                          PasswordTextField(
                            title: 'Password',
                            onChanged: (value) {
                              // setState(() {
                              //
                              // });
                              // if (hasLoginError) {
                              //   setState(() {
                              //     hasLoginError = false;
                              //   });
                              // }
                            },
                            controller: passwordController,
                          ),
                          const SizedBox(height: 27.73),
                          WButton(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context, fade(page: const SelectFlat()));
                            },
                            text: 'Create account',
                            textStyle:
                                Theme.of(context).textTheme.displayMedium,
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: WScaleAnimation(
                              onTap: () {
                                // Navigator.of(context)
                                //     .push(fade(page: const SendPhoneNumberPage()));
                              },
                              child: Text(
                                'You have account? Sign in',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                              ),
                            ),
                          ),
                          const Spacer(flex: 2),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
