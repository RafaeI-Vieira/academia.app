import 'package:flutter/material.dart';

class IntroScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/muie.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Image.asset('assets/images/fb.png', height: 80),
                SizedBox(height: 10),
                Image.asset('assets/images/FITBODY.png', height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
