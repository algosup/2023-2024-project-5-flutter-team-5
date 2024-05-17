// Imported packages
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      home: WelcomePage(),
    );
  }
}
// ------------------- //

// Home Page
class HomePage extends MaterialPageRoute {
  HomePage(int id)
      : super(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Prototype'),
                backgroundColor: const Color.fromARGB(255, 73, 7, 255),
              ),
              body: const Center(
                child: Text('Bienvenue sur la page principale'),
              ),
              drawer: const NavDrawerHome(),
            );
          },
        );
}

// Naviation Drawer
class NavDrawerHome extends StatelessWidget {
  const NavDrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    const drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('Pseudo'),
      accountEmail: Text('user.name@email.com'),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text('P'),
      ),
    );
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          title: const Text('Mon compte'),
            onTap: () => Navigator.of(context).push(NewPage(0)),
        ),
        ListTile(
          title: const Text('Mon profile'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => WelcomePage())),
        ),
        ListTile(
          title: const Text('Paramètres'),
          onTap: () {},
        ),
      ],
    );
    return Drawer(
      child: drawerItems,
    );
  }
}

// ------------------- //
// Welcome Page
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

// ------------------- //
// Sign in Page (Inscription)
class SigninPage extends MaterialPageRoute {
  SigninPage(int id)
      : super(
          builder: (BuildContext context) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                title: const Text('Inscription'),
                backgroundColor: Color.fromARGB(0, 73, 7, 255)
              ),
              body: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 252, 255, 46), Color.fromARGB(255, 216, 59, 255)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormFieldSignin(),
                    const SizedBox(height: 24.0),
                    Buttonsignin(),
                  ],
                ),
              ),
            );
          },
        );
}

// TextFormFieldSignin State          
class TextFormFieldSignin extends StatefulWidget {
  const TextFormFieldSignin({Key? key});

  @override
  State<StatefulWidget> createState() => _TextFormFieldSigninState();
}

class _TextFormFieldSigninState extends State<TextFormFieldSignin> {
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();

  String? _username;
  String? _email;
  String? _password;

  String? _validateName(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Un nom d\'utilisateur est requis.';
    }
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value!)) {
      return 'Veuillez entrer que des lettres et des chiffres.';
    }
    return null;
  }

  // Sign In Form
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 24.0),
          // "UserName" form.
          TextFormField(
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ), 
              filled: true,
              icon: Icon(Icons.person),
              labelText: 'Nom d\'utilisateur *',
            ),
            onSaved: (String? value) {
              this._username = value;
              print('Nom=$_username');
            },
            validator: _validateName,
          ),
          const SizedBox(height: 24.0),
          // "Email" form.
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ), 
              filled: true,
              icon: Icon(Icons.email),
              hintText: 'Votre adresse e-mail',
              labelText: 'E-mail *',
            ),
            keyboardType: TextInputType.emailAddress,
            onSaved: (String? value) {
              this._email = value;
              print('email=$_email');
            },
          ),
          const SizedBox(height: 24.0),
          // "Password" form.
          PasswordField(
            fieldKey: _passwordFieldKey,
            helperText: 'Plus de 8 caractères.\nDoit contenir des lettres et des chiffres.',
            labelText: 'Mot de passe *',
            onFieldSubmitted: (String value) {
              setState(() {
                this._password = value;
              });
            },
          ),
          const SizedBox(height: 24.0),
          // "Re-type password" form.
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ), 
              filled: true,
                icon: Icon(Icons.check_box_outline_blank, color: Colors.transparent),
              labelText: 'Confirmer le mot de passe *',
            ),
            obscureText: true,
          ),
        ],
      ),
    );
  }
}

// Sign In Button (with verification)
class Buttonsignin extends StatelessWidget {
  Buttonsignin({Key? key});
    String? _username;
    String? _email;
    String? _password;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_username != null && _email != null && _password != null) {
          Fluttertoast.showToast(
            msg: 'Connexion en cours...',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.of(context).push(HomePage(0));
        } else {
          Fluttertoast.showToast(
            msg: 'Veuillez remplir tous les champs correctement.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      child: const Text('S\'inscrire'),
    );
  }
}

// ------------------- //
// Log in Page
class LoginPage extends MaterialPageRoute {
  LoginPage(int id)
      : super(
          builder: (BuildContext context) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                title: const Text('Connexion'),
                backgroundColor: Color.fromARGB(0, 73, 7, 255)
              ),
              body: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 243, 33, 236), Color.fromARGB(255, 2, 187, 255)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormFieldLogin(),
                    const SizedBox(height: 24.0),
                    ButtonLogin(),
                  ],
                ),
              ),
            );
          },
        );
}

// TextFormFieldLogin State          
class TextFormFieldLogin extends StatefulWidget {
  const TextFormFieldLogin({Key? key});

  @override
  State<StatefulWidget> createState() => _TextFormFieldLogin();
}

class _TextFormFieldLogin extends State<TextFormFieldLogin> {
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();

  String? _username;
  String? _email;
  String? _password;

  String? _validateName(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Un nom d\'utilisateur est requis.';
    }
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value!)) {
      return 'Veuillez entrer que des lettres et des chiffres.';
    }
    return null;
  }

  // Login In Form
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 24.0),
          // "UserName" form.
          TextFormField(
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ), 
              filled: true,
              icon: Icon(Icons.person),
              labelText: 'Nom d\'utilisateur',
            ),
            onSaved: (String? value) {
              this._username = value;
              print('Nom=$_username');
            },
            validator: _validateName,
          ),
          const SizedBox(height: 24.0),
          // "Password" form.
          PasswordField(
            fieldKey: _passwordFieldKey,
            labelText: 'Mot de passe',
            onFieldSubmitted: (String value) {
              setState(() {
                this._password = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class ButtonLogin extends StatelessWidget {
  ButtonLogin({Key? key});
    String? _username;
    String? _email;
    String? _password;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_username != null && _password != null) {
          Fluttertoast.showToast(
            msg: 'Connexion en cours...',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.of(context).push(HomePage(0));
        } else {
          Fluttertoast.showToast(
            msg: 'Veuillez remplir tous les champs correctement.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      child: const Text('Se connecter'),
    );
  }
}

// ------------------- //
// Other Functions

// Password Field
class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key? fieldKey;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

// PasswordField State
class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      onSaved: widget.onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mot de passe requis.';
        }
        if (value.length < 8) {
          return 'Le mot de passe doit contenir au moins 8 caractères.';
        }
        if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])').hasMatch(value)) {
          return 'Le mot de passe doit contenir des lettres et des chiffres.';
        }
        return null;
      },
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        filled: true,
        icon: const Icon(Icons.lock),
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}

// ------------------- //

class NewPage extends MaterialPageRoute {
  NewPage(int id)
      : super(
          builder: (BuildContext context) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                title: const Text('Home1'),
                backgroundColor: Color.fromARGB(0, 255, 255, 255),
                actions: [
                  IconButton(
                    icon: Icon(Icons.notifications, size: 40,),
                    onPressed: () {
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.filter_list, size: 40,),
                    onPressed: () {
                    },
                  ),
                ],
              ),
              body: const Center(
                child: Text('Bienvenue sur la page test'),
              ),
              drawer: const NavDrawerHome(),
              bottomNavigationBar: const AppBarNav(),
            );
          },
        );
}

// Bottom App Bar
class AppBarNav extends StatelessWidget {
  const AppBarNav({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomCenter,
        child: BottomAppBar(
          height: 115,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TransparentButton(icon: Icons.account_circle),
              TransparentButton(icon: Icons.home),
              TransparentButton(icon: Icons.settings),
            ],
          ),
        ),
      );
  }
}

class TransparentButton extends StatelessWidget {
  final IconData icon;

  const TransparentButton({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent, 
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
        ),
      child: Icon(icon, color: const Color.fromARGB(255, 60, 60, 60), size: 60.0),
        ),
      );
  }
}