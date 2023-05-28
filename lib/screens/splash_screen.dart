import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quiz_app/screens/login_screen.dart';
import 'package:quiz_app/screens/sign_up_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  navigateToHome() async {
    await Future.delayed(const Duration(seconds: 4)).then(
      (value) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const SignUpPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/splash_image.png'),
              SizedBox(
                height: size.height * .03,
              ),
              const Text(
                "Quizzo",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              const SpinKitCircle(
                color: Colors.purple,
              )
            ],
          ),
        ),
      ),
    );
  }
}
