import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class Profile {
  const Profile({
    required this.id,
    required this.name,
    required this.age,
    required this.location,
  });
  final int id;
  final String name;
  final int age;
  final String location;
}

List<Profile> profiles = <Profile>[
  Profile(id: 1, name: 'Jean', age: 25, location: 'Paris'),
  Profile(id: 2, name: 'Marie', age: 30, location: 'Lyon'),
  Profile(id: 3, name: 'Pierre', age: 35, location: 'Marseille'),
  Profile(id: 4, name: 'Sophie', age: 40, location: 'Toulouse'),
  Profile(id: 5, name: 'Paul', age: 45, location: 'Bordeaux'),
];

class MatchPage extends StatefulWidget {
  MatchPage(int id) : super();

  @override
  _MatchPageState createState() => _MatchPageState();
}
class _MatchPageState extends State<MatchPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: TopAppBar1(),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: ShapeDecoration(
          color: const Color(0xFF161C23),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: PageView.builder(
                  itemCount: profiles.length,
                  itemBuilder: (context, index) {
                    Profile profile = profiles[index];
                    return Card(
                      color: const Color(0xFF252D40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox.shrink(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  profile.name,
                                  style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  profile.location,
                                  style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    if (currentIndex < profiles.length - 1) {
                      setState(() {
                        currentIndex++;
                      });
                    }
                  },
                  icon: const Icon(Icons.close),
                  iconSize: 50,
                  color: const Color.fromARGB(255, 190, 8, 8),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                IconButton(
                  onPressed: () {
                    if (currentIndex > 0) {
                      setState(() {
                        currentIndex--;
                      });
                    }
                  },
                  icon: const Icon(Icons.arrow_back),
                  iconSize: 50,
                  color: const Color.fromARGB(255, 118, 40, 125),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                IconButton(
                  onPressed: () {
                    if (currentIndex < profiles.length - 1) {
                      setState(() {
                        currentIndex++;
                      });
                    }
                  },
                  icon: const Icon(Icons.favorite),
                  iconSize: 50,
                  color: const Color.fromARGB(255, 45, 3, 184),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BotAppBar1(),
    );
  }
}

class BotAppBar1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xFF161C23),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              // Handle button 1 tap
            },
            child: Image.asset(
              'assets/icon_user.png',
              width: 45,
              height: 45,
              fit: BoxFit.cover,
            ),
          ),
          GestureDetector(
            onTap: () {
              // Handle button 2 tap
            },
            child: Image.asset(
              'assets/message.png',
              width: 45,
              height: 45,
              fit: BoxFit.cover,
            ),
          ),
          GestureDetector(
            onTap: () {
              // Handle button 3 tap
            },
            child: Image.asset(
              'assets/home_white.png',
              width: 45,
              height: 45,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class TopAppBar1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xFF161C23),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              // Handle left button tap
            },
            child: Padding(
              padding: EdgeInsets.only(left: 16),
              child: Image.asset(
                'assets/handshake_white.png',
                width: 80,
                height: 80,
              ),
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  // Handle right button 1 tap
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: Image.asset(
                    'assets/bell_white.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle right button 2 tap
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: Image.asset(
                    'assets/settings.png',
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
