import 'package:flutter/material.dart';

// Pages
import 'package:adopte_un_candidat/welcomepage.dart';

// Main function
void main() {
  runApp(const MyApp());
}

// app class
class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adopte un Candidat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomePage(),
    );
  }
}
