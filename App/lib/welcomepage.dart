import 'package:flutter/material.dart';

import 'package:adopte_un_candidat/loginpage.dart';
import 'package:adopte_un_candidat/signinpage.dart';
import 'package:adopte_un_candidat/homepage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(   // Background
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.yellow],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center( 
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container( // White box
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 300,
                        height: 250,
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [ // Buttons
                            SizedBox(
                              width: 200.0,
                              child: ElevatedButton(
                                onPressed: () => Navigator.of(context).push(LoginPage(0)),
                                child: const Text('Se connecter'),
                              ),
                            ),
                            const SizedBox(height: 40.0),
                            SizedBox(
                              width: 200.0,
                              child: ElevatedButton(
                                onPressed: () => Navigator.of(context).push(SigninPage(0)),
                                child: const Text('S\'inscrire'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40.0), // dev button
                      SizedBox(
                        width: 200.0,
                        child: ElevatedButton(
                            onPressed: () => Navigator.of(context).push(HomePage(0)),
                          child: const Text('Passer(dev)'),
                        ),
                      ), // end dev button
                    ],
                  ),
                ),
              ),
            );
          }
}