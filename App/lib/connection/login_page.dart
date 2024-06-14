import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// pages
import '../job_seeker/match_page.dart';

class LoginPage extends MaterialPageRoute<void> {
  LoginPage(int id)
      : super(
          builder: (BuildContext context) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                title: const Text(
                  'Connexion',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                backgroundColor: const Color.fromARGB(0, 73, 7, 255),
              ),
              body: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 255, 255, 255)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: LoginForm(),
                    ),
                  ),
                ),
              ),
            );
          },
        );
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();

  String? _username;
  String? _password;

  // Hardcoded credentials
  final String _correctUsername = "AdminTeam5";
  final String _correctPassword = "Admin5";

  String? _validateName(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Un nom d\'utilisateur est requis.';
    }
    final RegExp nameExp = RegExp(r'^[A-Za-z0-9]+$');
    if (!nameExp.hasMatch(value!)) {
      return 'Veuillez entrer que des lettres et des chiffres.';
    }
    return null;
  }

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      if (_username == _correctUsername && _password == _correctPassword) {
        Fluttertoast.showToast(
          msg: 'Connexion en cours...',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MPage()));
      } else {
        Fluttertoast.showToast(
          msg: 'Nom d\'utilisateur ou mot de passe incorrect.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
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
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 24.0),
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
              _username = value;
            },
            validator: _validateName,
          ),
          const SizedBox(height: 24.0),
          TextFormField(
            key: _passwordFieldKey,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
              filled: true,
              icon: Icon(Icons.lock),
              labelText: 'Mot de passe',
            ),
            onSaved: (String? value) {
              _password = value;
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Un mot de passe est requis.';
              }
              return null;
            },
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: _login,
            child: const Text('Se connecter'),
          ),
        ],
      ),
    );
  }
}
