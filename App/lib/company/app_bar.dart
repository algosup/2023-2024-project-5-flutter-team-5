import 'package:flutter/material.dart';

//page
import 'package:adopte_un_candidat/company/match_page.dart';
import 'package:adopte_un_candidat/company/message.dart';
import 'package:adopte_un_candidat/company/profile_view.dart';
import 'package:adopte_un_candidat/useful.dart';

class BotAppBar extends StatelessWidget {
  final Themes themes = Themes();
  final int currentPage;
  final GlobalKey buttonProfile = GlobalKey();
  final GlobalKey buttonMessage = GlobalKey();
  final GlobalKey buttonHome = GlobalKey();
  BotAppBar({super.key, required this.currentPage});

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
          GestureDetector(
            // profile button
            key: buttonProfile,
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ProfileView()));
            },
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: currentPage == 2
                    ? themes.currentTheme.colorScheme.onSurface
                    : Colors.transparent,
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
          GestureDetector(
            // message button
            key: buttonMessage,
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MessagePage()));
            },
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: currentPage == 1
                    ? themes.currentTheme.colorScheme.onSurface
                    : Colors.transparent,
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
          GestureDetector(
            // home button
            key: buttonHome,
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const MPage()));
            },
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: currentPage == 0
                    ? themes.currentTheme.colorScheme.onSurface
                    : Colors.transparent,
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
