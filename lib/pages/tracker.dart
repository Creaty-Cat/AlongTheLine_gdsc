import 'package:flutter/material.dart';
import 'package:flutter_home/pages/LiveLocationPage.dart';
import 'package:flutter_home/pages/graph.dart';
import 'package:flutter_home/pages/maps.dart';
import 'package:flutter_home/pages/TimerPage.dart';
import 'package:flutter_home/pages/profilePage.dart';

class TrackerPage extends StatefulWidget {
  final String? name;
  final String? time;

  TrackerPage({this.name, this.time});

  @override
  _TrackerPageState createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: AppBar(
            backgroundColor: Color.fromARGB(92, 137, 212, 247),
            leading: Container(
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: const Color.fromARGB(255, 105, 102, 102),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            title: Container(
              child: Text(
                "Tracker",
                style: TextStyle(color: const Color.fromARGB(255, 14, 13, 13)),
              ),
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: Stack(
        children: [
          if (widget.name != null && widget.time != null)
            Positioned(
              top: 100,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ${widget.name}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Time: ${widget.time}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          Positioned(
            top: 50,
            left: 20,
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(249, 187, 219, 245),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Backery',
                    style: TextStyle(fontSize: 25, color: const Color.fromARGB(255, 19, 18, 18)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '10 minutes',
                    style: TextStyle(fontSize: 22, color: const Color.fromARGB(255, 19, 18, 18)),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 180,
            left: 20,
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 181, 248, 184),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Train ride to university',
                    style: TextStyle(fontSize: 25, color: const Color.fromARGB(255, 19, 18, 18)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '35 min',
                    style: TextStyle(fontSize: 22, color: const Color.fromARGB(255, 19, 18, 18)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showOptions(context);
        },
        tooltip: 'Add New Tracker',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
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
              // Navigate to Home page
              break;
            case 1:
              // Navigate to Search page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
              break;
            case 2:
              // Navigate to Favorites page
              break;
            case 3:
              Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => ProfilePage()),
);

              break;
            default:
              //Do Nothing
          }
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue[900],
      ),
    );
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Live Location'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LiveLocationPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.track_changes),
                title: Text('Tracker'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TimePickerValue()),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
