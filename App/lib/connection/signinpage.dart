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
                title: const Text(
                  'Inscription',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
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
                child: SigninForm(),
              ),
            );
          },
        );
}

class SigninForm extends StatefulWidget {
  @override
  _SigninFormState createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _username;
  String? _email;
  String? _password;
  String? _phoneNumber;

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

  String? _validatePhoneNumber(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Un numéro de téléphone est requis.';
    }
    final RegExp phoneExp = RegExp(r'^\d+$');
    if (!phoneExp.hasMatch(value!)) {
      return 'Veuillez entrer un numéro de téléphone valide.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
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
                    _username = value;
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
                    _email = value;
                    print('email=$_email');
                  },
                ),
                const SizedBox(height: 24.0),
                // "PhoneNumber" form.
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    filled: true,
                    icon: Icon(Icons.phone),
                    labelText: 'Numéro de téléphone *',
                  ),
                  keyboardType: TextInputType.phone,
                  onSaved: (String? value) {
                    _phoneNumber = value;
                    print('Téléphone=$_phoneNumber');
                  },
                  validator: _validatePhoneNumber,
                ),
                const SizedBox(height: 24.0),
                // "Password" form.
                PasswordField(
                  fieldKey: GlobalKey<FormFieldState<String>>(),
                  helperText:
                      'Plus de 8 caractères.\nDoit contenir des lettres et des chiffres.',
                  labelText: 'Mot de passe *',
                  onFieldSubmitted: (String value) {
                    setState(() {
                      _password = value;
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
                    icon:
                        Icon(Icons.check_box_outline_blank, color: Colors.transparent),
                    labelText: 'Confirmer le mot de passe *',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
          Buttonsignin(
            formKey: _formKey,
            onSave: () {
              _formKey.currentState!.save();
              return SignInData(
                username: _username,
                email: _email,
                password: _password, // Ensure _password is correctly set
                phoneNumber: _phoneNumber,
              );
            },
          ),
        ],
      ),
    );
  }
}
class SignInData {
  final String? username;
  final String? email;
  final String? password;
  final String? phoneNumber;

  SignInData({this.username, this.email, this.password, this.phoneNumber});
}

class Buttonsignin extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final SignInData Function() onSave;

  const Buttonsignin({Key? key, required this.formKey, required this.onSave}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState != null && formKey.currentState!.validate()) {
          final signInData = onSave();
          if (signInData.username != null &&
              signInData.email != null &&
              signInData.phoneNumber != null) {
            Fluttertoast.showToast(
              msg: 'Inscription en cours...',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0,
            );
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MPage()));
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
      },
      child: const Text('S\'inscrire'),
    );
  }
}
