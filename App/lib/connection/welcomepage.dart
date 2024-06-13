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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background_welcomepage.png'),
                fit: BoxFit.cover, // Cover ensures the image covers the entire container
                alignment: Alignment.center,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
              ),
            ),
            width: double.infinity, // Ensure the container takes up the entire width of the screen
            height: double.infinity, // Ensure the container takes up the entire height of the screen
          ),
          // Gradient overlay at the bottom
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  const Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 500,
                  height: 300,
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 250.0,
                        height: 40.0,
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).push(SigninPage(0)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shadowColor: Colors.transparent,
                            elevation: 5,
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
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 35, 35, 35)),
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
