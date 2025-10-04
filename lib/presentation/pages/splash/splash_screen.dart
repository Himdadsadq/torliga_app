import 'package:flutter/material.dart';
import 'package:torliga_app/presentation/pages/home/home_page.dart';

import 'package:torliga_app/core/services/token_service.dart';
import 'package:torliga_app/presentation/injections.dart';
import 'package:torliga_app/presentation/pages/auth/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _tokenService = getIt<TokenService>();

  Future<void> navigateToNextScreen() async {
    final token = await _tokenService.getToken();

    if (token != null) {
      // Navigate to the main app screen if token exists
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
    } else {
      // Navigate to the login screen if no token
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const LoginPage()));
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), navigateToNextScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/login_background.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
