import 'package:flutter/material.dart';
import 'package:petmutualaid/ui/dates/utils/awaydates.dart';
import 'package:petmutualaid/ui/dates/utils/homedates.dart';

class MyDatesUI extends StatefulWidget {
  const MyDatesUI({super.key});

  @override
  State<MyDatesUI> createState() => _MyDatesUIState();
}

class _MyDatesUIState extends State<MyDatesUI> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "Home",
                  icon: Icon(Icons.house)),
                Tab(
                  text: "Away",
                  icon: Icon(Icons.train))
              ],
            ),
            title: const Text('My Dates'),
          ),
          body: const TabBarView(
            children: [
              HomeDatesUI(),
              AwayDatesUI()
            ],
          ),
      )
    );
  }
}