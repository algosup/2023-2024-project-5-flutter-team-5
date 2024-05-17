import 'package:flutter/material.dart';

import 'package:adopte_un_candidat/welcomepage.dart';
import 'package:adopte_un_candidat/matchingpage.dart';


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