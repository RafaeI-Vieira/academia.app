import 'package:flutter/material.dart';

class IntroScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/FITBODY.png'),
            SizedBox(height: 20),
            Image.asset('assets/images/fb.png'),
          ],
        ),
      ),
    );
  }
}
