import 'package:flutter/material.dart';
import 'package:adopte_un_candidat/useful.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  Themes themes = Themes();

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
                  'Notifications',
                  style: TextStyle(
                    color: themes.currentTheme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
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
          _buildNotificationItem(
            title: 'Nouvelle candidature reçue',
            subtitle: 'Un candidat a postulé à votre offre.',
            timestamp: 'Il y a 5 minutes',
          ),
          _buildNotificationItem(
            title: 'Message de l\'entreprise',
            subtitle: 'Votre candidature a été retenue pour un entretien.',
            timestamp: 'Il y a 2 heures',
          ),
          // Ajoutez plus de notifications ici
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String subtitle,
    required String timestamp,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: themes.currentTheme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: themes.currentTheme.colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: TextStyle(
              color: themes.currentTheme.colorScheme.onPrimary,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            timestamp,
            style: TextStyle(
              color: themes.currentTheme.colorScheme.onPrimary,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
