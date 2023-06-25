import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:incase_app/assats/colors/colors.dart';
import 'package:incase_app/assats/themes/theme.dart';
import 'package:incase_app/features/auth/presentation/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: darkBlue,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'InCase',
        theme: AppTheme.theme(),
        // builder: (context, child) {
        //  return  navigator.push(
        //     fade(
        //       page: const LoginScreen(),
        //     ),
        //   );
        // },
        home: const SplashScreen(),
        // onGenerateRoute: (_) => MaterialPageRoute(
        //   builder: (_) => const SplashScreen(),
        // ),
      ),
    );
  }
}
