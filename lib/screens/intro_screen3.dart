import 'package:flutter/material.dart';

class IntroScreen3 extends StatelessWidget {
  final PageController controller;

  IntroScreen3({required this.controller});

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
                    Image.asset('assets/images/Work Out.png'),
                    SizedBox(height: 20),
                    Text(
                      'Start Your Journey Towards A More Active Lifestyle',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(width: 20, height: 2, color: const Color.fromARGB(255, 255, 255, 255)),
                        SizedBox(width: 2),
                        Container(width: 20, height: 2, color: const Color.fromARGB(255, 132, 132, 132)),
                        SizedBox(width: 2),
                        Container(width: 20, height: 2, color: const Color.fromARGB(255, 132, 132, 132)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  side: BorderSide(color: Colors.white),
                ),
                child: Text(
                  'Next',
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
