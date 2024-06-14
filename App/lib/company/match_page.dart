import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

// Pages
import 'package:adopte_un_candidat/useful.dart';
import 'package:adopte_un_candidat/notification_page.dart';
import 'package:adopte_un_candidat/company/app_bar.dart';
import 'package:adopte_un_candidat/company/filter_page.dart';

class Profile {
  final String skills;
  final String location;
  final String? diplomas;
  final String? personality;

  Profile({
    required this.skills, 
    required this.location,
    this.diplomas,
    this.personality,
    });
}

class ExampleCard extends StatelessWidget {
  final Profile profile;
  final int cardIndex;
  final Themes themes = Themes();

  ExampleCard({
    super.key,
    required this.profile,
    required this.cardIndex,
  });

  // colors cards
  static final List<LinearGradient> cardGradients = [
    const LinearGradient(colors: [Colors.pink, Colors.redAccent]),
    const LinearGradient(colors: [Colors.blue, Colors.blueAccent]),
    const LinearGradient(colors: [Colors.orange, Colors.deepOrange]),
    const LinearGradient(colors: [Colors.purple, Colors.deepPurple]),
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
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white.withOpacity(0.8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _buildInfoBox(
                        'Skills',
                        profile.skills,
                        gradient
                      ),
                      const SizedBox(height: 10),
                      _buildInfoBox(
                        'Location',
                        profile.location,
                        gradient
                      ),
                      if (profile.diplomas != null) ...[
                        const SizedBox(height: 10),
                        _buildInfoBox(
                          'Diplomas',
                          profile.diplomas!,
                          gradient
                        ),
                      ],
                      if (profile.personality != null) ...[
                        const SizedBox(height: 10),
                        _buildInfoBox(
                          'Personality',
                          profile.personality!,
                          gradient
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox(String title, String content, LinearGradient gradient) {
    final List<String> titleLines = title.split('\n');
    final List<String> contentLines = content.split('\n');

    return Container(
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              gradient: gradient,
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 5),
          for (String line in contentLines)
            Text(
              line,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
        ],
      ),
    );
  }
}

class MPage extends StatefulWidget {
  const MPage({super.key});

  @override
  State<MPage> createState() => MatchingPage();
}

class MatchingPage extends State<MPage> {
  final GlobalKey cardSwiperHome = GlobalKey();
  final CardSwiperController controller = CardSwiperController();
  final List<Profile> candidates = [
    Profile(skills: '-créativité\n-résilience\n-audace\n', location: 'Vierzon', diplomas: 'Baccalauréat général', personality: 'Innovateur - ENTP'),
    Profile(skills: '-leadership\n-autonomie\n-persévérence\n', location: 'Paris', diplomas: 'Master\nBaccalauréat technologique', personality: 'Commandant - ENTJ'),
    Profile(skills: '-créativité\n-initiative\n-leadership\n', location: 'Le Mans', diplomas: 'Certificat d\'aptitude professionnelle (CAP)', personality: 'Architecte - INTJ'),
    Profile(skills: '-autonomie\n-audace\n-leadership\n', location: 'Tours', personality: 'Inspirateur - ENFP'),
  ];

  late final List<Widget> cards;
  final Themes themes = Themes();

  bool showSwipeEffect = false;
  bool isLeftSwipe = false;
  double swipeEffectOpacity = 0.0;
  double opacityLevel = 1.0;

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
    return Scaffold(
      backgroundColor: themes.currentTheme.colorScheme.primary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: TopAppBar(),
      ),
      body: Column(
        children: [
          Flexible(
            child: Stack(
              children: [
                CardSwiper(
                  key: cardSwiperHome,
                  allowedSwipeDirection: const AllowedSwipeDirection.only(right: true, left: true),
                  controller: controller,
                  cardsCount: cards.length,
                  onSwipe: _onSwipe,
                  onUndo: _onUndo,
                  numberOfCardsDisplayed: 2,
                  backCardOffset: const Offset(0, 45),
                  padding: const EdgeInsets.all(0.0),
                  cardBuilder: (
                    context,
                    index,
                    horizontalThresholdPercentage,
                    verticalThresholdPercentage,
                  ) {
                    return cards[index];
                  },
                ),
                if (showSwipeEffect) _buildSwipeEffect(),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(45.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
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
                            icon: Image.asset('assets/cross.png', width: 75, height: 75),
                            onPressed: () => controller.swipe(CardSwiperDirection.left),
                            iconSize: 50,
                          ),
                        ),
                        Container(
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
                            onPressed: () => controller.undo(),
                            icon: Image.asset('assets/backarrow.png', width: 70, height: 70),
                            iconSize: 50,
                          ),
                        ),
                        Container(
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
          BotAppBar(
            currentPage: 0,
          ),
        ],
      ),
    );
  }

  Widget _buildSwipeEffect() {
    return Positioned(
      left: isLeftSwipe ? 0 : null,
      right: isLeftSwipe ? null : 0,
      top: 0,
      bottom: 0,
      child: Center(
        child: Transform.translate(
          offset: Offset(isLeftSwipe ? -700 : 700, 0),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 700),
            opacity: opacityLevel,
            child: Container(
              width: showSwipeEffect ? 900 : 300,
              height: showSwipeEffect ? 1500 : 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isLeftSwipe ? Colors.red : Colors.blue,
              ),
              child: Align(
                alignment: isLeftSwipe ? const Alignment(0.65,0) : const Alignment(-0.65,0),
                child: Icon(
                  isLeftSwipe ? Icons.close : Icons.favorite,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _onSwipe(int previousIndex, int? currentIndex, CardSwiperDirection direction) {
    setState(() {
      showSwipeEffect = true;
      isLeftSwipe = direction == CardSwiperDirection.left;
      _changeOpacity(true);
    });
    return true;
  }

  bool _onUndo(int? previousIndex, int currentIndex, CardSwiperDirection direction) {
    setState(() {
    });
    return true;
  }


  void _changeOpacity(bool fadeIn) {
    if (fadeIn) {
      setState(() => opacityLevel = 1.0);
      Timer(const Duration(milliseconds: 400), () {
        setState(() => opacityLevel = 0.0);
      });
    } else {
      setState(() => opacityLevel = 0.0);
    }
  }
}

class TopAppBar extends StatelessWidget {
  final Themes themes = Themes();
  final GlobalKey buttonNotificationHome = GlobalKey();
  final GlobalKey buttonFilterHome = GlobalKey();
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
              themes.currentTheme.handshake,
              width: 80,
              height: 80,
            ),
          ),
          Row(
            children: [
              GestureDetector(
                key: buttonNotificationHome,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NotificationPage(),
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
              GestureDetector(
                key: buttonFilterHome,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SkillsFilterPage(),
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
