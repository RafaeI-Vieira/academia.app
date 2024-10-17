import 'package:flutter/material.dart';
import 'package:p1_diogo/screens/login_screen.dart';

class IntroScreen5 extends StatelessWidget {
  final PageController controller;

  IntroScreen5({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/muie.png',
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Color(0xFFB3A0FF).withOpacity(0.7),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Image.asset('assets/images/Community.png'),
                    SizedBox(height: 20),
                    Text(
                      'A community for you, challenge yourself',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(width: 20, height: 2, color: const Color.fromARGB(255, 132, 132, 132)),
                        SizedBox(width: 2),
                        Container(width: 20, height: 2, color: const Color.fromARGB(255, 132, 132, 132)),
                        SizedBox(width: 2),
                        Container(width: 20, height: 2, color: const Color.fromARGB(255, 255, 255, 255)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  side: BorderSide(color: Colors.white),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
