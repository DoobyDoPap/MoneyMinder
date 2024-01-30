// import 'package:finku_clone_slicing/Utils/main.dart';
import 'package:flutter/material.dart';

class SplitBillsPage extends StatefulWidget {
  @override
  SplitBillsPageState createState() => SplitBillsPageState();
}

class SplitBillsPageState extends State<SplitBillsPage> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 91, 150), //color1
      body: Stack(
        children: [
          Positioned(
            top: 90,
            left: 30,
            child: Text(
              "Split Bills",
              style: TextStyle(
                color: Color.fromARGB(255, 227, 172, 7), //Color2
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.05,
            right: size.width * 0.05,
            child: profilePicture(size),
          ),
          Positioned(
            top: size.height * 0.2,
            left: size.width * 0.05,
            child: billedContainer(size),
          ),
          Positioned(
            top: size.height * 0.56,
            left: size.width * 0.05,
            child: previousSplit(size),
          ),
          Positioned(
            top: size.height * 0.31,
            right: size.width * 0.09,
            child: Material(
              color: Color.fromARGB(255, 245, 221, 151),
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: size.height / 3.6,
                width: size.width / 5,
                child: Stack(
                  children: [
                    Positioned(
                      top: size.height * 0.01,
                      left: size.width * 0.05,
                      child: image(size, "assets/images/1.png"),
                    ),
                    Positioned(
                      top: size.height * 0.09,
                      left: size.width * 0.05,
                      child: image(size, "assets/images/2.png"),
                    ),
                    Positioned(
                      left: size.width * 0.05,
                      bottom: size.height * 0.01,
                      child: image(size, "assets/images/3.png"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 25,
            child: nearbyFriends(size),
          ),
          Positioned(
            bottom: 165,
            left: 22,
            child: Material(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 227, 172, 7),
              elevation: 10,
              child: Container(
                height: size.height / 11,
                width: size.width / 5,
                child: Icon(
                  Icons.search,
                  color: const Color.fromARGB(255, 18, 91, 150),
                  size: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget nearbyFriends(Size size) {
    double containerHeight = size.height / 3.7;
  double containerWidth = size.width / 1.15;

  if (MediaQuery.of(context).size.width < 600) {
    containerHeight = size.height / 4;
    containerWidth = size.width / 1.5;
  }
    return Container(
      height: size.height / 3.7,
      width: size.width / 1.15,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 90, 146, 192),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            top: size.height * 0.02,
            left: size.width * 0.35,
            child: Text(
              "Nearby Friends",
              style: TextStyle(
                color: Color.fromARGB(255, 227, 172, 7),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 20,
            child: Text(
              "See all",
              style: TextStyle(
                color: Color.fromARGB(255, 227, 172, 7),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.07,
            left: size.width * 0.1,
            child: previousParticipants(size, "assets/images/2.png", "user"),
          ),
          Positioned(
            top: size.height * 0.07,
            left: size.width * 0.375,
            child: previousParticipants(size, "assets/images/1.png", "me"),
          ),
          Positioned(
            top: size.height * 0.07,
           right: size.width * 0.1,
            child: previousParticipants(size, "assets/images/3.png", "user2"),
          ),
          Positioned(
            bottom: 7,
            left: 12,
            child: Text(
              "Recently \n Splits",
              style: TextStyle(
                color: Color.fromARGB(255, 227, 172, 7),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
  left: size.width * 0.1,   // Adjust the multiplier as needed
  bottom: size.height * 0.02,  // Adjust the multiplier as needed
  child: recentSplits(size, "assets/images/1.png", "user1"),
  
),
Positioned(
  left: size.width * 0.25,  // Adjust the multiplier as needed
  bottom: size.height * 0.02,  // Adjust the multiplier as needed
  child: recentSplits(size, "assets/images/2.png", "user2"),
),
Positioned(
  right: size.width * 0.25,  // Adjust the multiplier as needed
  bottom: size.height * 0.02,  // Adjust the multiplier as needed
  child: recentSplits(size, "assets/images/1.png", "user3"),
),
Positioned(
  right: size.width * 0.05,  // Adjust the multiplier as needed
  bottom: size.height * 0.02,  // Adjust the multiplier as needed
  child: recentSplits(size, "assets/images/3.png", "user4"),
),

        ],
      ),
    );
  }

  Widget recentSplits(Size size, String imageUrl, String name) {
    return Container(
      height: size.height / 10,
      width: size.width / 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: size.height / 20,
            width: size.height / 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imageUrl),
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(
              color: Color.fromARGB(255, 227, 172, 7),
            ),
          )
        ],
      ),
    );
  }

  Widget previousParticipants(Size size, String imageUrl, String name) {
    return Container(
      height: size.height / 10,
      width: size.width / 7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromARGB(255, 18, 91, 150),
      ),
      child: Column(
        children: [
          Container(
            height: size.width < 600 ? size.height / 18 : size.height / 14.5,
          width: size.width < 600 ? size.width / 18 : size.width / 14.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(
              color: Color.fromARGB(255, 227, 172, 7),
            ),
          )
        ],
      ),
    );
  }

  Widget previousSplit(Size size) {
    return Container(
      height: size.height / 9,
      width: size.width / 1.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 90, 146, 192),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 10,
            top: 0.5,
            bottom: 0.5,
            child: Container(
              height: size.height / 7,
              width: size.width / 7,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 18, 91, 150),
              ),
              child: Icon(
                Icons.timer,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.03,
            left: size.width * 0.3,
            child: Text(
              "Your Previous Splits",
              style: TextStyle(
                color: Color.fromARGB(255, 227, 172, 7),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.06,
            left: size.width * 0.3,
            child: Text(
              "678.56",
              style: TextStyle(
                color: Color.fromARGB(255, 227, 172, 7),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget billedContainer(Size size) {
    return Container(
      height: size.height / 3,
      width: size.width / 1.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 227, 172, 7),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 30,
            left: 30,
            child: Text(
              "Total Bill",
              style: TextStyle(
                color: const Color.fromARGB(255, 18, 91, 150),
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 30,
            child: Text(
              "Split With",
              style: TextStyle(
                color: const Color.fromARGB(255, 18, 91, 150),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 55,
            left: 30,
            child: Text(
              "750.86",
              style: TextStyle(
                color: const Color.fromARGB(255, 18, 91, 150),
                fontSize: 34,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 30,
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => SecondScreen(),
                ),
              ),
              child: Material(
                color: const Color.fromARGB(255, 18, 91, 150),
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: size.height / 12,
                  width: size.width / 3.5,
                  alignment: Alignment.center,
                  child: Text(
                    "Split Now",
                    style: TextStyle(
                      color: Color.fromARGB(255, 227, 172, 7),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget image(Size size, String imageUrl) {
    return Container(
      height: size.height / 10,
      width: size.width / 10,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.contain,
          )),
    );
  }

  Widget profilePicture(Size size) {
    return Container(
      height: size.height / 9.5,
      width: size.width / 4.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 90, 146, 192),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: size.height / 19,
              width: size.width / 5,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/1.png"))),
            ),
          ),
          Text(
            "User 1",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 227, 172, 7),
            ),
          )
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      // Add your SecondScreen body here,
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplitBillsPage(),
  ));
}
