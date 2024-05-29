import 'package:flutter/material.dart';

// Pages
import 'package:adopte_un_candidat/connection/welcomepage.dart';
import 'package:adopte_un_candidat/useful.dart';

// Main function
void main() {
  runApp(MyApp());
}

// app class
class MyApp extends StatelessWidget {
  MyApp({Key? key});
  final Themes themes = Themes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adopte un Candidat',
      home: const WelcomePage(),
    );
  }
}
