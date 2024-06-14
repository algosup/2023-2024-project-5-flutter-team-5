import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Pages
import 'package:adopte_un_candidat/connection/welcome_page.dart';
import 'package:adopte_un_candidat/useful.dart';

// Main function
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Themes(),
      child: const MyApp(),
    ),
  );
}

// app class
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentPage = 0;
  final Themes themes = Themes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adopte un Candidat',
      home: Scaffold(
        body: IndexedStack(
          index: currentPage,
          children: const [
            WelcomePage(),
          ],
        ),
      ),
    );
  }
}
