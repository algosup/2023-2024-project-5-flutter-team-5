import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'homepage.dart';
import 'useful.dart';


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
                    const TextFormFieldLogin(),
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