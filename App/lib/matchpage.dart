import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';


// Pages
import 'package:adopte_un_candidat/profileview.dart';
import 'package:adopte_un_candidat/useful.dart';
import 'package:adopte_un_candidat/message.dart';
import 'package:adopte_un_candidat/filterpage.dart';
import 'package:adopte_un_candidat/notification_page.dart';

class _Profile {
  final String name;
  final String location;

  _Profile({required this.name, required this.location});
}

class ExampleCard extends StatelessWidget {
  final _Profile profile;
  final int cardIndex;
  final Themes themes = Themes();

  ExampleCard({
    Key? key,
    required this.profile,
    required this.cardIndex,
  }) : super(key: key);

  // colors cards
  static final List<LinearGradient> cardGradients = [
    LinearGradient(colors: [Colors.pink, Colors.redAccent]),
    LinearGradient(colors: [Colors.blue, Colors.blueAccent]),
    LinearGradient(colors: [Colors.orange, Colors.deepOrange]),
    LinearGradient(colors: [Colors.purple, Colors.deepPurple]),
  ];

  @override
  Widget build(BuildContext context) {
    final gradient = cardGradients[cardIndex % cardGradients.length];

    return Container(
      width: MediaQuery.of(context).size.width, 
      height: MediaQuery.of(context).size.height - 330, 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: gradient, 
        boxShadow: [
          BoxShadow(
            color: themes.currentTheme.colorScheme.primary.withOpacity(1),
            spreadRadius: 10,
            blurRadius: 15,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Container( // text on card
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white.withOpacity(0.8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  profile.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Ville : ${profile.location}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MPage extends StatefulWidget {
  
  MPage({Key? key}) : super(key: key);

  @override
  State<MPage> createState() => MatchingPage();
}

class MatchingPage extends State<MPage> { // example of profile
  final GlobalKey cardSwiper_Home = GlobalKey();
  final GlobalKey buttonCross_Home = GlobalKey();
  final GlobalKey buttonUndo_Home = GlobalKey();
  final GlobalKey buttonHeart_Home = GlobalKey();
  final GlobalKey buttonProfile_Home = GlobalKey();
  final GlobalKey buttonMessage_Home = GlobalKey();
  final GlobalKey buttonHome_Home = GlobalKey();
  final GlobalKey buttonNotification_Home = GlobalKey();
  final GlobalKey buttonFilter_Home = GlobalKey();

  final CardSwiperController controller = CardSwiperController();
  final List<_Profile> candidates = [
    _Profile(name: 'Mac-Donald', location: 'Vierzon'),
    _Profile(name: 'Skill-Issue®', location: 'Paris'),
    _Profile(name: 'Rick-Roller', location: 'Never-Gonna'),
    _Profile(name: 'Ledger', location: 'Moscow'),
  ];

  late final List<Widget> cards;
  final Themes themes = Themes();

  @override
  void initState() {
    super.initState();
    cards = candidates
        .asMap()
        .entries
        .map((entry) => ExampleCard(profile: entry.value, cardIndex: entry.key))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // background
      backgroundColor: themes.currentTheme.colorScheme.primary,
      appBar: PreferredSize( // top app bar
        preferredSize: const Size.fromHeight(100),
        child: TopAppBar1(),
      ),
      body: Column(
        children: [
          Flexible(
            child: Stack(
              children: [
                CardSwiper( // card swiper parameters
                  key: cardSwiper_Home,
                  allowedSwipeDirection: const AllowedSwipeDirection.only(right: true, left: true),
                  controller: controller,
                  cardsCount: cards.length,
                  onSwipe: _onSwipe,
                  onUndo: _onUndo,
                  numberOfCardsDisplayed: 2,
                  backCardOffset: const Offset(00, 45),
                  padding: const EdgeInsets.all(0.0),
                  cardBuilder: (
                    context,
                    index,
                    horizontalThresholdPercentage,
                    verticalThresholdPercentage,
                  ) =>
                      cards[index],
                ),
                Positioned( // Buttons swiper
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(45.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(  // cross button (left)
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: themes.currentTheme.colorScheme.surface,
                          boxShadow: [
                            BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                            ),
                          ],
                          ),
                          child: IconButton(
                            key: buttonCross_Home,
                          icon: Image.asset('assets/cross.png', width: 75, height: 75),
                          onPressed: () => controller.swipe(CardSwiperDirection.left),
                          iconSize: 50,
                          ),
                        ),
                        Container(  // undo button (center)
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: themes.currentTheme.colorScheme.surface,
                          boxShadow: [
                            BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                            ),
                          ],
                          ),
                          child: IconButton(
                            key: buttonUndo_Home,
                          onPressed: () => controller.undo(),
                          icon: Image.asset('assets/backarrow.png', width: 70, height: 70),
                          iconSize: 50, 
                          ),
                        ),
                        Container(  // heart button (right)
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: themes.currentTheme.colorScheme.surface,
                          boxShadow: [
                            BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                            ),
                          ],
                          ),
                          child: IconButton(
                            key: buttonHeart_Home,
                          icon: Image.asset('assets/heart.png', width: 50, height: 50),
                          onPressed: () => controller.swipe(CardSwiperDirection.right),
                          iconSize: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BotAppBar( // Bottom app bar
            currentPage: 0,
          ), 
        ],
      ),
    );
  }
 // Swipe and undo functions
  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    return true;
  }
}


// ------------------------------------------------------------------
class TopAppBar1 extends StatelessWidget {
  final Themes themes = Themes();
  final GlobalKey buttonNotification_Home = GlobalKey();
  final GlobalKey buttonFilter_Home = GlobalKey();
  TopAppBar1({Key? key}) : super(key: key);
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
            Padding(  // logo
              padding: const EdgeInsets.only(left: 16),
              child: Image.asset(
                themes.currentTheme.handshake,
                width: 80,
                height: 80,
              ),
            ),
          Row(
            children: [
              GestureDetector(  // notification button
                key: buttonNotification_Home,
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NotificationPage(),
                    ),
                  ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Image.asset(
                    themes.currentTheme.bell,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              GestureDetector(  // filter button
                key: buttonFilter_Home,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SkillsFilterPage(),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Image.asset(
                    themes.currentTheme.filter,
                    width: 55,
                    height: 55,
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
