import 'package:flutter/material.dart';
import 'package:adopte_un_candidat/useful.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String dropdownValue = 'Clair';
  final Themes themes = Themes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themes.currentTheme.colorScheme.primary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: themes.currentTheme.colorScheme.secondary,
          title: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Paramètres',
                  style: TextStyle(
                    color: themes.currentTheme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),  // back button
                  child: Container(
                    margin: const EdgeInsets.only(right: 25),
                    child: const Text(
                      'ok',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          _buildSection(
            title: 'General',
            tiles: [
              _buildTile(
                context: context,
                title: 'Notifications',
                icon: Icons.notifications,
                onPressed: () {
                  // Handle notifications tile press
                },
              ),
              _buildTile(
                context: context,
                title: 'Language',
                icon: Icons.language,
                onPressed: () {
                  // Handle language tile press
                },
              ),
              _buildTile(
                context: context,
                title: 'Thèmes',
                icon: Icons.palette,
                dropdownButton: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: themes.currentTheme.colorScheme.onPrimary),
                  underline: Container(
                    height: 2,
                    color: themes.currentTheme.colorScheme.onPrimary,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      Provider.of<Themes>(context, listen: false).toggleTheme();
                    });
                  },
                  items: <String>['Clair', 'Sombre']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          _buildSection(
            title: 'Compte',
            tiles: [
              _buildTile(
                context: context,
                title: 'Modifier mon compte',
                icon: Icons.person,
                onPressed: () {
                  // Handle profile tile press
                },
              ),
              _buildTile(
                context: context,
                title: 'Visibilité dans les matchs',
                icon: Icons.remove_red_eye,
                onPressed: () {
                  // Handle privacy tile press
                },
              ),
            ],
          ),
          _buildSection(
            title: 'Mentions légales',
            tiles: [
              _buildTile(
                context: context,
                title: 'GDPR',
                icon: Icons.privacy_tip,
                onPressed: () {
                  // Handle profile tile press
                },
              ),
              _buildTile(
                context: context,
                title: 'Autre',
                icon: Icons.private_connectivity,
                onPressed: () {
                  // Handle privacy tile press
                },
              ),
            ],
          ),
          _buildSection(
            title: 'Assistance',
            tiles: [
              _buildTile(
                context: context,
                title: 'J\'ai besoin d\'aide',
                icon: Icons.help,
                onPressed: () {
                  // Handle profile tile press
                },
              ),
              _buildTile(
                context: context,
                title: 'J\'ai un problème de sécurité',
                icon: Icons.security,
                onPressed: () {
                  // Handle privacy tile press
                },
              ),
              _buildTile(
                context: context,
                title: 'J\'ai une question liée à la confidentialité',
                icon: Icons.privacy_tip,
                onPressed: () {
                  // Handle privacy tile press
                },
              ),
            ],
          ),
          _buildSection(
            title: '',
            tiles: [
              _buildTile(
                context: context,
                title: 'Déconnexion',
                icon: Icons.logout,
                onPressed: () {
                  // Handle profile tile press
                },
              ),
              _buildTile(
                context: context,
                title: 'Supprimer mon compte',
                icon: Icons.delete,
                onPressed: () {
                  // Handle privacy tile press
                },
                titleColor: Colors.red,
                iconColor: Colors.red,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BotAppBar(
        currentPage: 4,
        ),
    );
  }

  Widget _buildSection({required String title, required List<Widget> tiles}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40, top: 20, bottom: 5),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: themes.currentTheme.colorScheme.onPrimary, 
            ),
          ),
        ),
        DividerWidget(),
        for (int i = 0; i < tiles.length; i++)
        Column(
          children: [
            if (i != 0) HalfDividerWidget(),
            tiles[i],
          ],
        ),
      DividerWidget(),
      ],
    );
  }

  Widget _buildTile({
    required BuildContext context, 
    required String title, 
    required IconData icon, 
    VoidCallback ? onPressed, 
    Color ? titleColor, 
    Color ? iconColor, 
    DropdownButton<String>? dropdownButton
  }){
    return Container(
      height: 50,
      child: Stack(
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyle(
                color: titleColor ?? themes.currentTheme.colorScheme.onPrimary, 
              ),
            ),
            leading: Icon(
              icon,
              color: iconColor ?? themes.currentTheme.colorScheme.onPrimary,
            ),
            onTap: onPressed,
            tileColor: themes.currentTheme.colorScheme.secondary,
          ),
          if (dropdownButton != null)
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                child: dropdownButton,
              ),
            ),
        ],
      ),
    );
  }
}

class DividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 3,
      decoration: BoxDecoration(
        color: const Color(0xFFC3C3C3),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class HalfDividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1,),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 3,
      decoration: BoxDecoration(
        color: const Color(0xFFC3C3C3),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}