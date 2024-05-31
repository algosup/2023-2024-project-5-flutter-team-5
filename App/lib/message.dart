import 'package:flutter/material.dart';

// Pages
import 'package:adopte_un_candidat/useful.dart';
import 'package:adopte_un_candidat/matchpage.dart';
import 'package:adopte_un_candidat/profileview.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<StatefulWidget> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final Themes themes = Themes();
  final GlobalKey hidablebar_lastmatches_message = GlobalKey();
  final GlobalKey list_messages_messages = GlobalKey();
  final GlobalKey scrollhorizontal_lastmatches_message = GlobalKey();
  final GlobalKey button_profile_message = GlobalKey();
  final GlobalKey button_message_message = GlobalKey();
  final GlobalKey button_home_message = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themes.currentTheme.colorScheme.primary,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            key: hidablebar_lastmatches_message,
            backgroundColor: themes.currentTheme.colorScheme.primary,
            automaticallyImplyLeading: false,
            expandedHeight: 350.0,
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: themes.currentTheme.colorScheme.primary,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.asset(
                            themes.currentTheme.handshake,
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ),
                          Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                            'Les dernières entreprises qui t\'ont match',
                            style: TextStyle(
                              color: themes.currentTheme.colorScheme.onPrimary.withOpacity(0.8),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            ),
                          ),
                          ),
                      ScrollableBoxWidget1(),
                    ],
                  ),
                ),
            ),
          ),
            SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
              'Messages',
              style: TextStyle(
                color: themes.currentTheme.colorScheme.onPrimary.withOpacity(0.8),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              ),
            ),
            ),
          SliverList(
            key: list_messages_messages,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      color: themes.currentTheme.colorScheme.primary,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: themes.currentTheme.colorScheme.onSecondary,
                            radius: 60,
                          ),
                          SizedBox(width: 20), 
                          Text(
                            'Entreprise $index',
                            style: TextStyle(
                              color: themes.currentTheme.colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3,),
                      height: 3,
                      width: MediaQuery.of(context).size.width * 0.7, 
                      decoration: BoxDecoration(
                        color: const Color(0xFFC3C3C3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BotAppBar2(),
    );
  }
}

class BotAppBar2 extends StatelessWidget {
  final Themes themes = Themes();
  final GlobalKey button_profile_message = GlobalKey();
  final GlobalKey button_message_message = GlobalKey();
  final GlobalKey button_home_message = GlobalKey();

  BotAppBar2({Key? key}) : super(key: key);
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
            key: button_profile_message,
            onTap: () => Navigator.of(context).push(ProfileView(0)),
            child: Container(
              width: 80,
              height: 80, 
              decoration: const BoxDecoration(
                color: Colors.transparent,
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
            key: button_message_message,
            onTap: () {
              // Handle button 2 tap
            },
            child: Container(
              width: 80,
              height: 80, 
              decoration: BoxDecoration(
                color: themes.currentTheme.colorScheme.onSurface,
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
            key: button_home_message,
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MPage())),
            child: Container(
              width: 80,
              height: 80, 
              decoration: const BoxDecoration(
                color: Colors.transparent,
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

class ScrollableBoxWidget1 extends StatelessWidget {
  final GlobalKey scrollhorizontal_lastmatches_message = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: scrollhorizontal_lastmatches_message,
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0, top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: BoxWidget(text: 'Entreprise 1'),
            ),
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: BoxWidget(text: 'Entreprise 2'),
            ),
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: BoxWidget(text: 'Entreprise 3'),
            ),
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: BoxWidget(text: 'Entreprise 4'),
            ),
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: BoxWidget(text: 'Entreprise 5'),
            ),
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: BoxWidget(text: 'Entreprise 6'),
            ),
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: BoxWidget(text: 'Entreprise 7'),
            ),
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: BoxWidget(text: 'Entreprise 8'),
            ),
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: BoxWidget(text: 'Entreprise 9'),
            ),
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: BoxWidget(text: 'Entreprise 10'),
            ),
          ],
        ),
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
    return Container(
      height: 160, 
      width: 125, 
      
      decoration: BoxDecoration(
        color: themes.currentTheme.colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
        ],
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(text),
      ),
    );
  }
}