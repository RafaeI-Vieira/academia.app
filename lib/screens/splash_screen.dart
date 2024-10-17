import 'dart:async';
import 'package:flutter/material.dart';
import 'intro_screen1.dart';
import 'intro_screen2.dart';
import 'intro_screen3.dart';
import 'intro_screen4.dart';
import 'intro_screen5.dart';
import 'login_screen.dart';
import 'reset_password_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoPageSwitch();
  }

  void _startAutoPageSwitch() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          IntroScreen1(),
          IntroScreen2(),
          IntroScreen3(controller: _pageController),
          IntroScreen4(controller: _pageController),
          IntroScreen5(controller: _pageController),
        ],
      ),
    );
  }
}
