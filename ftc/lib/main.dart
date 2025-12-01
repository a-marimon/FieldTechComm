import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ftc/map/map_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Import firebase_core

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(35.013579, -82.116568),
    zoom: 13,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[ // Correctly using the 'items' property
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: 'Map', // 'label' is used instead of 'title' in newer Flutter versions
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: 'Chat',
            ),
          ],
          // currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          // onTap: _onItemTapped,
        ),
        body: MapPage(),
      ),
    );
  }
}