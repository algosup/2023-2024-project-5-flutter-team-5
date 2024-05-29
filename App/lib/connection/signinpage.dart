import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../matchpage.dart';
import '../useful.dart';

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
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MPage()));
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