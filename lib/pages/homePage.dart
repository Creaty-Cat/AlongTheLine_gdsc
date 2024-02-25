import 'package:flutter/material.dart';
import 'package:flutter_home/pages/AddAppointment.dart';
import 'package:flutter_home/pages/dateAndTime.dart';
import 'package:flutter_home/pages/tracker.dart'; 
import 'package:flutter_home/pages/cameraPage.dart'; 
import 'package:flutter_home/pages/graph.dart'; 
import 'package:flutter_home/pages/maps.dart'; 
import 'package:flutter_home/pages/profilePage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  List<List<dynamic>> optionsList = [
    ["Scanner", "assets/images/camera.png", true],
    ["Tracker", "assets/images/tracker.png", false],
    ["Maps", "assets/images/maps.png", false],
    ["Tickets", "assets/images/tickets.png", false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          //title: Text('App Name or Logo'),
          backgroundColor: Color.fromARGB(92, 137, 212, 247),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // CLOCK
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddAppointment()),
                    );
                  },

                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    height: 200,
                    alignment: Alignment.center,
                    
                    child: Image.asset(
                      'assets/images/placeholder.png',
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ),

                //WIDGETS
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildWidgets('assets/images/camera.png', 'Scanner'),
                            buildWidgets('assets/images/tracker.png', 'Tracker'), 
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildWidgets('assets/images/maps.png', 'Maps'),
                            buildWidgets('assets/images/tickets.png', 'Tickets'),                        
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home, size: 35),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search, size: 35),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite, size: 35),
                    label: 'Favorites',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle, size: 35),
                    label: 'Profile',
                  ),
                ],
                currentIndex: 0,
                onTap: (int index) {
                  switch (index) {
                    case 0:
                      // Home
                      break;
                    case 1:
                      // Search page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchPage()),
                      );
                      break;
                    case 2:
                      //  Favorites page
                      break;
                    case 3:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                      break;
                    default:
                      // Do nothing
                  }
                },
                unselectedItemColor: Colors.black,
                selectedItemColor: Colors.blue[900],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildWidgets(String image, String text) {
  late Widget destinationPage; // Die Variable wird als 'late' deklariert, um ihre Initialisierung zu verzögern.

  switch (text) {
    case 'Scanner':
      destinationPage = TextDetectionPage();
      break;
    case 'Tracker':
      destinationPage = TrackerPage();
      break;
    case 'Maps':
      //destinationPage = MapsPage();
      break;
    case 'Tickets':
      //destinationPage = TicketsPage();
      break;
    default:
      destinationPage = DateTimePicker();
  }

  return Expanded(
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destinationPage),
          );
        },
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              color: Color.fromARGB(92, 137, 212, 247),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                SizedBox(height: 20,),
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
}