import 'package:flutter/material.dart';
import 'package:flutter_home/pages/maps.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/user.png'), 
            ),
            SizedBox(height: 20),
            Text(
              'Max Mustermann', 
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Navigate to settings page
              },
              child: Text('Settings'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // logout 
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
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
        currentIndex: 3, 
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
              // Favorites page
              break;
            case 3:
              // Profile page
              break;
            default:
              // Do nothing
          }
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue[900],
      ),
    );
  }
}
