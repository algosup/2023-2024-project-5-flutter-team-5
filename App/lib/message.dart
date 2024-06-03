import 'package:flutter/material.dart';

// Pages
import 'package:adopte_un_candidat/useful.dart';
import 'package:adopte_un_candidat/matchpage.dart';
import 'package:adopte_un_candidat/profileview.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final Themes themes = Themes();
  final GlobalKey hidableBarLastMatches_Message = GlobalKey();
  final GlobalKey listMessages_Messages = GlobalKey();
  final GlobalKey scrollHorizontalLastMatches_Message = GlobalKey();
  final GlobalKey buttonProfile_Message = GlobalKey();
  final GlobalKey buttonMessage_Message = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themes.currentTheme.colorScheme.primary,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            key: hidableBarLastMatches_Message,
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
            key: listMessages_Messages,
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
      bottomNavigationBar: BotAppBar(
        currentPage: 1,
      ),
    );
  }
}

class ScrollableBoxWidget1 extends StatelessWidget {
  final GlobalKey scrollHorizontalLastMatches_Message = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: scrollHorizontalLastMatches_Message,
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