import 'package:flutter/material.dart';
// Pages
import 'package:adopte_un_candidat/useful.dart';
import 'package:adopte_un_candidat/matchpage.dart';
import 'package:adopte_un_candidat/message.dart';
import 'package:adopte_un_candidat/settings.dart';
import 'package:adopte_un_candidat/job_seeker_side/edit_profil_page.dart';
import 'package:adopte_un_candidat/notification_page.dart';

class ProfileViewRoute extends MaterialPageRoute {
  ProfileViewRoute()
      : super(
          builder: (BuildContext context) => ProfileView(),
        );
}

class ProfileView extends StatelessWidget {
  final Themes themes = Themes();

  @override
  Widget build(BuildContext context) {
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
          BotAppBar(
            currentPage: 2,
          ),
        ],
      ),
    );
  }
}

class ViewProfile extends StatelessWidget {
  final buttonEditProfile_Profile = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final themes = Themes();
    return Container(
      // Background (black/white)
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        color: themes.currentTheme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            // Background (blue)
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
          Positioned(
            // Profile picture
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
          Positioned(
            //name text
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
          Positioned(
            // Edit Profile
            left: 260,
            top: 152,
            child: GestureDetector(
              key: buttonEditProfile_Profile,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditProfilPage(),
                ),
              ),
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
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NotificationPage(),
                    ),
                ),
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
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage())),
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
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: BoxWidget(
              field: const ["Email", "Ville"],
              values: const [
                ["Pierre.Martin@mail.com"],
                ["Tours"]
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: BoxWidget(
              field: const ["Competence", "Personalité"],
              values: const [
                [
                  "esprit critique",
                  "responsabilité",
                  "négociation",
                  "initiative"
                ],
                ["Innovateur"],
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: BoxWidget(
              field: const ["Diplome(s)"],
              values: const [
                ['Baccalauréat général', 'Licence'],
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: BoxWidget(
              field: const [
                "Secteur(s) d'activité recherché",
                "Type de contrats recherchés",
              ],
              values: const [
                [
                  'Énergie',
                  'Industries',
                  'Logistique et transport',
                  'Automobile'
                ],
                ["CDI", "CDD"],
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: BoxWidget(
              field: const ["Categorie d'entreprise recherchée"],
              values: const [
                [
                  'Grande entreprise',
                  'Entreprise de taille intermédiaire',
                  'Petite et moyenne entreprise',
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BoxWidget extends StatelessWidget {
  List<String> field;
  List<List<String>> values;
  final Themes themes = Themes();

  FieldsAndValue fieldsAndValue = FieldsAndValue();

  BoxWidget({required this.field, required this.values});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 320,
          height: 220,
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
          child: Center(
              // Wrap the text widget with Center
              child: Column(
            children: [
              ...values.asMap().entries.map((entry) =>
                  fieldsAndValue.getField(field[entry.key], values[entry.key])),
            ],
          )),
        ),
      ],
    );
  }
}

class FieldsAndValue {
  final Themes themes = Themes();

  getField(String field, List<String> values) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 4),
            padding:
                const EdgeInsets.only(left: 4, right: 4, top: 0.5, bottom: 0.5),
            decoration: BoxDecoration(
              color: themes.currentTheme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Text(
              "$field:",
              style: TextStyle(
                  color: themes.currentTheme.colorScheme.onPrimary,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: [
              ...values.asMap().entries.map(
                    (str) => Container(
                      padding: const EdgeInsets.only(
                          left: 4, right: 4, top: 0.5, bottom: 0.5),
                      decoration: BoxDecoration(
                        color: themes.currentTheme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        str.value,
                        style: TextStyle(
                          color: themes.currentTheme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
            ],
          )
        ],
      ),
    );
  }
}
