import 'package:ecyc/Screens/MyProfile.dart';
import 'package:ecyc/Screens/blood/blood.dart';
import 'package:ecyc/Screens/feed.dart';
import 'package:ecyc/Screens/home.dart';
import 'package:flutter/material.dart';

class BottomNavigatorBar extends StatefulWidget {
  BottomNavigatorBar({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  int _currentindex = 0;
  final Screens = [Home(), Feed(), MyProfile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        type: BottomNavigationBarType.fixed,
        iconSize: 20,
        selectedFontSize: 15,
        unselectedFontSize: 12,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.red,
        backgroundColor: Color.fromARGB(255, 202, 191, 191),
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.amber,
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_sharp),
              label: 'Feed',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'My Profile',
              backgroundColor: Colors.green),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
    );
  }
}
