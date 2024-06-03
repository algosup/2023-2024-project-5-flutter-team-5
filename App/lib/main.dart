import 'package:flutter/material.dart';

// Pages
import 'package:adopte_un_candidat/connection/welcomepage.dart';
import 'package:adopte_un_candidat/useful.dart';
import 'package:adopte_un_candidat/profileview.dart';
import 'package:adopte_un_candidat/message.dart';
import 'package:adopte_un_candidat/matchpage.dart';

// Main function
void main() {
  runApp(MyApp());
}

// app class
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
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
          children: [
            ProfileView(),
            MessagePage(),
            MPage(),
          ],
        ),
        bottomNavigationBar: BotAppBar(
          currentPage: currentPage,
        ),
      ),
    );
  }
}