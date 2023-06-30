import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Incase/assats/colors/colors.dart';
import 'package:Incase/assats/constants/icons.dart';
import 'package:Incase/features/auth/presentation/pages/sign_up.dart';
import 'package:Incase/features/auth/presentation/widgets/sotial_media_item.dart';
import 'package:Incase/features/common/widgets/w_button.dart';
import 'package:Incase/features/common/widgets/w_scale.dart';
import 'package:Incase/features/common/widgets/navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: darkBlue,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light),
      child: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://myday.uz/userfiles/8/images/photo_2019-08-30_09-57-52.jpg'),
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
                        const Spacer(),
                        SizedBox(
                          width: 239,
                          child: Text(
                            'Step into a world of immersive 3D exploration',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '3D Exploration. Building Acquisition. Limitless Possibilities.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(letterSpacing: 1),
                        ),
                        const SizedBox(height: 40),
                        WButton(
                          onTap: () {
                            Navigator.pushReplacement(
                                context, fade(page: const SignUpScreen()));
                          },
                          text: 'Sign up free',
                          textStyle: Theme.of(context).textTheme.displayMedium,
                        ),
                        const SizedBox(height: 24),
                        SocialMediaItem(
                          onTap: () async {
                            // context.read<AuthenticationBloc>().add(LoginWithGoogle());
                          },
                          icon: SvgPicture.asset(AppIcons.google),
                          text: Text(
                            'Continue with Google',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(height: 17),
                        SocialMediaItem(
                          onTap: () async {
                            // context.read<AuthenticationBloc>().add(LoginWithAppLe());
                          },
                          icon: SvgPicture.asset(AppIcons.apple),
                          text: Text(
                            'Continue with Apple',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 30,
                              bottom:
                                  MediaQuery.of(context).padding.bottom + 16),
                          child: WScaleAnimation(
                              child: Text(
                                'Log in',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                              ),
                              onTap: () {}),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
