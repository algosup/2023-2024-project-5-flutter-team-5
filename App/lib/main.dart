// Imported packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Main function
void main() {
  runApp(const MyApp());
}

// Home Page
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NavDrawerExample(),
    );
  }
}

// Naviation Drawer
class NavDrawerExample extends StatelessWidget {
  const NavDrawerExample({super.key});

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
            onTap: () => Navigator.of(context).push(_PageTwo(1)),
        ),
        ListTile(
          title: const Text('Mon profile'),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Paramètres'),
          onTap: () {},
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 73, 7, 255),
        title: const Text('Prototype'),
      ),
      body: const Center(
        child: Text('Menu principal'),
      ),
      drawer: Drawer(
        child: drawerItems,
      ),
    );
  }
}

// Page Two (Connexion)
class _PageTwo extends MaterialPageRoute {
  _PageTwo(int id)
      : super(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Connexion'),
              ),
              body: Column(
                children: [
                  TextFormFieldExample(),
                  Buttonsignin(),
                ],
              ),
            );
          },
        );
}

// need to understand this part
class TextFormFieldExample extends StatefulWidget {
  const TextFormFieldExample({Key? key});

  @override
  State<StatefulWidget> createState() => _TextFormFieldExampleState();
}

// TextFormFieldExample State
class _TextFormFieldExampleState extends State<TextFormFieldExample> {
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();

  String? _lastname;
  String? _firstname;
  String? _email;
  String? _password;

  String? _validateName(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Un nom est requis.';
    }
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value!)) {
      return 'Veuillez entrer que des lettres et des espaces.';
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
          // "lastName" form.
          TextFormField(
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.person),
              labelText: 'Nom *',
            ),
            onSaved: (String? value) {
              this._lastname = value;
              print('Nom=$_lastname');
            },
            validator: _validateName,
          ),
          const SizedBox(height: 24.0),
          // "firstName" form.
          TextFormField(
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.person_2),
              labelText: 'Prénom *',
            ),
            onSaved: (String? value) {
              this._firstname = value;
              print('Prénom=$_firstname');
            },
            validator: _validateName,
          ),
          const SizedBox(height: 24.0),
          // "Email" form.
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
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
              border: UnderlineInputBorder(),
              filled: true,
              labelText: 'Confirmer le mot de passe *',
            ),
            obscureText: true,
          ),
        ],
      ),
    );
  }
}

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
        border: const UnderlineInputBorder(),
        filled: true,
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

// Sign In Button (with verification)
class Buttonsignin extends StatelessWidget {
  Buttonsignin({Key? key});
    String? _lastname;
    String? _firstname;
    String? _email;
    String? _password;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_lastname != null && _firstname != null && _email != null && _password != null) {
          Fluttertoast.showToast(
            msg: 'Connexion en cours...',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()), // Might be wrong
          ); 
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
