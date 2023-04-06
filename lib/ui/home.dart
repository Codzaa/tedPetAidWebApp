import 'package:flutter/material.dart';
import 'package:petmutualaid/services/constants.dart';
import 'package:petmutualaid/ui/carers/all_carers.dart';
import 'package:petmutualaid/ui/pets/add_pet.dart';
import 'package:petmutualaid/ui/pets/all_pets.dart';
import 'package:petmutualaid/ui/pets/my_pets.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  ///
  int _selectedIndex = 0;
  ///
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  ///
  static const List<Widget> _widgetOptions = <Widget>[
    ///
    AllPetsUI(),
    ///
    MyPetsUI(),
  ];

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Schedule',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'My Pets',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
            backgroundColor: Colors.green,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body:Center(
        child: _widgetOptions.elementAt(_selectedIndex),
    ),
    );
  }
}
