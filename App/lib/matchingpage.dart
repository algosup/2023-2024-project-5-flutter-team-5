import 'package:flutter/material.dart'; 

class NewPage extends MaterialPageRoute {
  NewPage(int id)
      : super(
          builder: (BuildContext context) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(100),
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
                      color: Color(0xFF044082),
                      child: Center(
                        child: ScrollableBoxWidget(),
                      ),
                    ),
                  ),
                  BottomAppBar(),
                ],
              ),
            );
          },
        );
}

class ViewProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container( // Background (black)
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        color: Color(0xFF161C23),
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
            color: Color(0xFF044082),
            shape: OvalBorder(),
            shadows: [
          BoxShadow(
            color: Color.fromARGB(255, 3, 50, 100),
            blurRadius: 1,
            offset: Offset(0, 4),
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
                color: Color(0xFF272D39),
                shape: OvalBorder(),
                shadows: [
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
                  color: Color(0xFFAEAEAE),
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
              onTap: () {
                              // Handle button tap
              },
              child: Container(
                width: 35,
                height: 35,
                decoration: ShapeDecoration(
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

class BottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 35, 22, 22),
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

class TopAppBar extends StatelessWidget {
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

class ScrollableBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: BoxWidget(
              text: 'BlaBla',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: BoxWidget(
              text: 'BlouBlou',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: BoxWidget(
              text: 'BliBli',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: BoxWidget(
              text: 'BluBlu',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15),
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

  BoxWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 294,
          height: 221,
          decoration: ShapeDecoration(
            color: Color(0xFF363B44),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xD2191D24)),
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: [
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
                color: Colors.white,
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
