// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_home/pages/clockFormular.dart'; 
import 'package:flutter_home/util/OptionsBox.dart'; 
import 'package:flutter_home/pages/cameraPage.dart'; 
import 'package:flutter_home/pages/graph.dart'; 
import 'package:flutter_home/pages/maps.dart'; 

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
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(92, 137, 212, 247),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  //PROFILE + NAME
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  
                  Image.asset('assets/images/user.png', height: 100, alignment: Alignment.center,),
                  
                  Text('Name', textAlign: TextAlign.left,)
                  //name

              ]),
            ),
           //CLOCK
             GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyForm()),
                );
              },
                child: Container(
                height: 180,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Image.asset(
                  'assets/images/placeholder.png',
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: GridView.builder(
                      itemCount: optionsList.length,
                      padding: EdgeInsets.all(25),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                        onTap: () {
                          switch (index) {
                            case 0:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TextDetectionPage(),
                                ),
                              );
                              break;
                            case 1:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TextDetectionPage(),
                                ),
                              );
                              break;
                            case 2:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyForm(),
                                ),
                              );
                              break;
                            case 3:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyForm(),
                                ),
                              );
                              break;
                          }
                        },
                          child: OptionsBox(
                            optionsName: optionsList[index][0],
                            iconPath: optionsList[index][1],
                          ),
                        );
                      },
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
                    icon: Icon(Icons.settings, size: 35),
                    label: 'Settings',
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
                      // Settings page
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
}
