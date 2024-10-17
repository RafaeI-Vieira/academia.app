import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'FitBody App',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fundo preto
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/fb.png', // Caminho para a imagem "FB"
              width: 150, // Ajuste o tamanho conforme necessário
            ),
            SizedBox(height: 20), // Espaçamento entre as imagens
            Image.asset(
              'assets/images/fitbody.png', // Caminho para a imagem "FITBODY"
              width: 150, // Ajuste o tamanho conforme necessário
            ),
          ],
        ),
      ),
    );
  }
}
