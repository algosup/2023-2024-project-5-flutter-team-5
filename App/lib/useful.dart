import 'package:flutter/material.dart';
import 'package:adopte_un_candidat/profileview.dart';
import 'package:adopte_un_candidat/message.dart';
import 'package:adopte_un_candidat/matchpage.dart';


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

// Theme parameters
class _ThemeWithImages {
  final ColorScheme colorScheme;
  final String user;
  final String settings;
  final String message;
  final String handshake;
  final String filter;
  final String bell;
  final String home;

  _ThemeWithImages({
    required this.colorScheme, 
    required this.user,
    required this.settings,
    required this.message,
    required this.handshake,
    required this.filter,
    required this.bell,
    required this.home,
  });
}

class Themes {
  bool isLight;

  Themes({this.isLight = false});

// color scheme
// light mode
  static final light = _ThemeWithImages(
    colorScheme:  const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.white, // background color
    onPrimary: Colors.black, // text & icon color
    primaryContainer: Color(0xFF1FBAF7), // container color (ex.profile view)
    onPrimaryContainer: Colors.black, // container text color
    secondary: Colors.white, // other elements color
    onSecondary: Color(0xFFC4C4C4), // box color
    error: Color.fromARGB(70, 31, 186, 247), // shadow color
    onError: Color.fromARGB(255, 230, 230, 230), // profile picture
    surface: Colors.white,
    onSurface: Color.fromARGB(255, 200, 200, 200),
    ),
    user: 'assets/user_light.png',
    settings: 'assets/settings_light.png',
    message: 'assets/message_light.png',
    handshake: 'assets/handshake_light.png',
    filter: 'assets/filter_light.png',
    bell: 'assets/bell_light.png',
    home: 'assets/home_light.png',
  );

// dark mode
  static final dark = _ThemeWithImages(
    colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF161C23), // background color
    onPrimary: Colors.white, // text & icon color
    primaryContainer: Color(0xFF044082), // container color (ex.profile view)
    onPrimaryContainer: Color(0xFFAEAEAE), // container text color
    secondary: Color(0xFF363B44), // other elements color
    onSecondary: Color(0xFF363B44), // box color 
    error: Color.fromARGB(255, 3, 50, 100), // shadow color
    onError: Color(0x3F000000), // profile picture
    surface: Color(0xFF21262F),
    onSurface: Color.fromARGB(255, 55, 55, 55), // selected Page
    ),
    user: 'assets/user_dark.png',
    settings: 'assets/settings_dark.png',
    message: 'assets/message_dark.png',
    handshake: 'assets/handshake_dark.png',
    filter: 'assets/filter_dark.png',
    bell: 'assets/bell_dark.png',
    home: 'assets/home_dark.png',
  );

  _ThemeWithImages get currentTheme => isLight ? light : dark;

void toggleTheme() { // to toggle between light and dark mode
  isLight = !isLight;
}
}

// App Bar
class BotAppBar extends StatelessWidget {
  final Themes themes = Themes();
  final int currentPage;
  final GlobalKey button_profile_home = GlobalKey();
  final GlobalKey button_message_home = GlobalKey();
  final GlobalKey button_home_home = GlobalKey();
  BotAppBar({Key? key, required this.currentPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: themes.currentTheme.colorScheme.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(  // profile button
            key: button_profile_home, 
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileView()));
            },
            child: Container(
              width: 80,
              height: 80, 
              decoration: BoxDecoration(
                color: currentPage == 2 ? themes.currentTheme.colorScheme.onSurface : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  themes.currentTheme.user,
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          GestureDetector(  // message button
            key: button_message_home,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MessagePage()));
            },
            child: Container(
              width: 80,
              height: 80, 
              decoration: BoxDecoration(
                color: currentPage == 1 ? themes.currentTheme.colorScheme.onSurface : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  themes.currentTheme.message,
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          GestureDetector(  // home button
            key: button_home_home,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MPage()));
            },
            child: Container(
              width: 80,
              height: 80, 
              decoration: BoxDecoration(
                color: currentPage == 0 ? themes.currentTheme.colorScheme.onSurface : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  themes.currentTheme.home,
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}