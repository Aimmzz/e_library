import 'package:e_library/features/welcome/welcome_page.dart';
import 'package:e_library/helper/shared_preference.dart';
import 'package:e_library/main.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _startSplashScreen();
  }

  Future<void> _startSplashScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    _checkFirstTime();
  }

  Future<void> _checkFirstTime() async {
    bool isFirstTime = await SharedPreferencesHelper.isFirstTime();

    if (isFirstTime) {
      await SharedPreferencesHelper.setFirstTime(false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomePage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomBar()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: 200, height: 200),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
