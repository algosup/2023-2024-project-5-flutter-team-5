import 'package:adopte_un_candidat/company/app_bar.dart';
import 'package:adopte_un_candidat/company/edit_profile_page.dart';
import 'package:flutter/material.dart';

// Pages
import 'package:adopte_un_candidat/useful.dart';
import 'package:adopte_un_candidat/notification_page.dart';

import 'settings.dart';

class ProfileViewRoute extends MaterialPageRoute {
  ProfileViewRoute()
      : super(
          builder: (BuildContext context) => ProfileView(),
        );
}

class ProfileView extends StatelessWidget {
  final Themes themes = Themes();

  ProfileView({super.key});

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
  final buttonEditProfileProfile = GlobalKey();

  ViewProfile({super.key});
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
                shape: const OvalBorder(),
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
            top: 100,
            child: SizedBox(
              width: 268,
              height: 45,
              child: Text(
                'Hotel à Tours',
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
              key: buttonEditProfileProfile,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EditProfilPage(),
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
  final buttonNotificationProfile = GlobalKey();
  final buttonSettingsProfile = GlobalKey();

  TopAppBar({super.key});
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
                key: buttonNotificationProfile,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NotificationPage(),
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
                key: buttonSettingsProfile,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage())),
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
  final scrollableboxProfile = GlobalKey();

  ScrollableBoxWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: scrollableboxProfile,
      scrollDirection: Axis.horizontal,
      child: const Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 15, left: 15),
            child: BoxWidget(
              field: ["Email", "Ville"],
              values: [
                ["hotel.Toursn@mail.com"],
                ["Tours"]
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15, left: 15),
            child: BoxWidget(
              field: ["Emploi proposé", "Dans un rayon de"],
              values: [
                ["Valet de Chambre"],
                ["20km"]
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15, left: 15),
            child: BoxWidget(
              field: ["Secteur(s) d'activité", "Catégorie d'entreprise"],
              values: [
                [
                  'Hôtellerie et restauration',
                ],
                ['Petite et moyenne entreprise']
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15, left: 15),
            child: BoxWidget(
              field: [
                "Type de contrats proposés",
              ],
              values: [
                ["CDI", "CDD"],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BoxWidget extends StatefulWidget {
  final List<String> field;
  final List<List<String>> values;

  const BoxWidget({super.key, required this.field, required this.values});

  @override
  State<BoxWidget> createState() => _BoxWidgetState();
}

class _BoxWidgetState extends State<BoxWidget> {
  final Themes themes = Themes();
  FieldsAndValue fieldsAndValue = FieldsAndValue();

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
              ...widget.values.asMap().entries.map((entry) => fieldsAndValue
                  .getField(widget.field[entry.key], widget.values[entry.key])),
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
