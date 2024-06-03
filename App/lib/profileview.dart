import 'package:adopte_un_candidat/message.dart';
import 'package:flutter/material.dart'; 
// Pages
import 'package:adopte_un_candidat/useful.dart';
import 'package:adopte_un_candidat/matchpage.dart';

class ProfileView extends MaterialPageRoute {
  final Themes themes = Themes();
  ProfileView(int id)
      : super(
          builder: (BuildContext context) {
            final themes = Themes();
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(100),
                child: TopAppBar(),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ViewProfile(),
                  ),
                  Expanded(
                    child: Container(
                      color: themes.currentTheme.colorScheme.primaryContainer,
                      child: Center(
                        child: ScrollableBoxWidget(),
                      ),
                    ),
                  ),
                  BotAppBar(),
                ],
              ),
            );
          },
        );
}

class ViewProfile extends StatelessWidget {
  final button_editprofile_profile = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final themes = Themes();
    return Container( // Background (black/white)
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        color: themes.currentTheme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      child: Stack(
        children: [
          Positioned( // Background (blue)
        left: MediaQuery.of(context).size.width / 2 - 529.5,
        top: 182,
        child: Container(
          width: 1059,
          height: 814,
          decoration: ShapeDecoration(
            color: themes.currentTheme.colorScheme.primaryContainer,
            shape: OvalBorder(),
            shadows: [
          BoxShadow(
            color: themes.currentTheme.colorScheme.error,
            blurRadius: 1,
            offset: const Offset(0, 4),
            spreadRadius: 10,
          )
            ],
          ),
        ),
          ),
          Positioned( // Profile picture
            left: MediaQuery.of(context).size.width / 2 - 74.5,
            top: 147,
            child: Container(
              width: 149,
              height: 149,
              decoration: ShapeDecoration(
                color: themes.currentTheme.colorScheme.onSurface,
                shape: const OvalBorder(),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned( //name text
            left: MediaQuery.of(context).size.width / 2 - (268 / 2),
            top: 316,
            child: SizedBox(
              width: 268,
              height: 45,
              child: Text(
                'Pierre MARTIN, 33',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: themes.currentTheme.colorScheme.onPrimaryContainer,
                  fontSize: 26,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
            Positioned( // Edit Profile
              left: 260,
              top: 152,
              child: GestureDetector(
                key: button_editprofile_profile,
              onTap: () {
                              // Handle button tap
              },
              child: Container(
                width: 35,
                height: 35,
                decoration: const ShapeDecoration(
                color: Color.fromARGB(255, 204, 204, 204),
                shape: OvalBorder(),
                shadows: [
                  BoxShadow(
                  color: Color.fromARGB(61, 89, 89, 89),
                  blurRadius: 1,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                  )
                ],
                ),
                child: Image.asset(
                  filterQuality: FilterQuality.medium,
                'assets/edit_pen.png',
                width: 15,
                height: 15,
                ),
              ),
              ),
            ),
        ],
      ),
    );
  }
}

class BotAppBar extends StatelessWidget {
  final Themes themes = Themes();
  final button_message_profile = GlobalKey();
  final button_home_profile = GlobalKey();
  final button_profile_profile = GlobalKey();
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
            key: button_profile_profile,
            onTap: () => Navigator.of(context).push(ProfileView(0)),
            child: Container(
              width: 80,
              height: 80, 
              decoration: BoxDecoration(
                color: themes.currentTheme.colorScheme.onSurface,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  filterQuality: FilterQuality.medium,
                  themes.currentTheme.user,
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          GestureDetector(
            key: button_message_profile,
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MessagePage())),
            child: Container(
              width: 80,
              height: 80, 
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  filterQuality: FilterQuality.medium,
                  themes.currentTheme.message,
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          GestureDetector(
            key: button_home_profile,
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MPage())),
            child: Container(
              width: 80,
              height: 80, 
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  filterQuality: FilterQuality.medium,
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

class TopAppBar extends StatelessWidget {
  final Themes themes = Themes();
  final button_notification_profile = GlobalKey();
  final button_settings_profile = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: themes.currentTheme.colorScheme.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Image.asset(
                  filterQuality: FilterQuality.medium,
                themes.currentTheme.handshake,
                width: 80,
                height: 80,
              ),
            ),
          Row(
            children: [
              GestureDetector(
                key: button_notification_profile,
                onTap: () {
                                // Handle right button 1 tap
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Image.asset(
                  filterQuality: FilterQuality.medium,
                    themes.currentTheme.bell,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              GestureDetector(
                key: button_settings_profile,
                onTap: () {
                                // Handle right button 2 tap
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Image.asset(
                  filterQuality: FilterQuality.medium,
                    themes.currentTheme.settings,
                    width: 45,
                    height: 45,
                    fit: BoxFit.cover,
                ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ScrollableBoxWidget extends StatelessWidget {
  final scrollablebox_profile = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: scrollablebox_profile,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: BoxWidget(
              text: 'BlaBla',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: BoxWidget(
              text: 'BlouBlou',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: BoxWidget(
              text: 'BliBli',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: BoxWidget(
              text: 'BluBlu',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: BoxWidget(
              text: 'Never gonna give you up, \nNever gonna let you down, \nNever gonna run around and desert you, \nNever gonna make you cry, \nNever gonna say goodbye, \nNever gonna tell a lie and hurt you',
            ),
          ),
        ],
      ),
    );
  }
}


class BoxWidget extends StatelessWidget {
  final String text;
  final Themes themes = Themes();

  BoxWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 294,
          height: 221,
          decoration: ShapeDecoration(
            color: themes.currentTheme.colorScheme.secondary,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xD2191D24)),
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Center( // Wrap the text widget with Center
            child: Text(
              text,
              style: TextStyle(
                color: themes.currentTheme.colorScheme.onSecondary,
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
