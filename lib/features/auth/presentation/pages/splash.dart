import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:incase_app/assats/colors/colors.dart';
import 'package:incase_app/assats/constants/icons.dart';
import 'package:incase_app/features/auth/presentation/pages/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    // _navigateToSecondPage(context);
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: grey,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: grey,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(242, 236, 227, 0.11),
              grey,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppIcons.logo,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text('Case',
                        style: Theme.of(context).textTheme.displayLarge),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'Visualize. Explore. Indulge',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

// Future<void> _navigateToSecondPage(BuildContext context) async {
//  await Future.delayed(const Duration(seconds: 3));
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => const LoginScreen()),
//   );
// }
}
