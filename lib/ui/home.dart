import 'package:flutter/material.dart';
import 'package:petmutualaid/services/constants.dart';
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

    // BEGIN TODO
    
    /// This page will have all available Carers
    /// If you click on a user it will open their schedule page
    /// you can click on the days you want , that are free on their schedule.
    /// Once clixked you can click book
    /// The user will recieve a notice on their HOME Dates
    /// ONCE a user is Booked on a specific day they can not be booked by another person until the week ends.
    /// AvailUI (),
    /// This page will have a grid view of dates, 3 along the x axis
    /// When you tap on a day once its now free
    /// If you tap again it becomes unavailable
    /// A day can be also BOOKED, when a user accepts a pet date.
    /// By default a user is free on all days
    /// MySchedule (),
    /// These page has 4 sub pages in the form of tabs.
    /// 1st Tab shows HOME dates
    /// 2nd Tab shows AWAY dates
    /// DatesUI(),
    /// Shows current logged in user's Profile
    /// MyProfile ()
    // END TODO
    
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
