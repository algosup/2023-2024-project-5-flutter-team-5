import 'dart:ui';

import 'package:flutter/material.dart';
import './loginpage.dart';
import './signinpage.dart';
import '../matchpage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image with blur
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background_welcomepage.png'),
                fit: BoxFit.contain, // Cover ensures the image covers the entire container
                alignment: Alignment.topCenter,
              ),
            ),
            width: double.infinity, // Ensure the container takes up the entire width of the screen
            height: double.infinity,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
              child: Container(
                color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
              ),
            ), // Ensure the container takes up the entire height of the screen
          ),
          // Gradient overlay at the bottom
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.topCenter,
                colors: [
                  Color.fromARGB(255, 255, 255, 255).withOpacity(0.95),
                  Colors.transparent,
                ],
              ),
            ),
            width: double.infinity,
            height: double.infinity,
          ),
          // Centered content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 100.0),
                const Text(
                  'Bienvenue sur',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const Text(
                  'Adopte 1 Candidat',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const Spacer(),
                Container(
                  width: 500,
                  height: 300,
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 250.0,
                        height: 45.0,
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).push(SigninPage(0)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            foregroundColor: Colors.black,
                            shadowColor: Color.fromARGB(255, 0, 0, 0),
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),  
                          ),
                          child: const Text('Créer un compte', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      SizedBox(
                        width: 200.0,
                        height: 25,
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).push(LoginPage(0)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            shadowColor: Colors.transparent,
                            elevation: 5,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),  
                          ),
                          child: const Text(
                            'Se connecter',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 72, 72, 72)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50.0), // dev button
                SizedBox(
                  width: 200.0,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MPage())),
                    child: const Text('Passer(dev)'),
                  ),
                ),
                const SizedBox(height: 20.0), // end dev button
              ],
            ),
          ),
        ],
      ),
    );
  }
}