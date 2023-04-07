import 'package:flutter/material.dart';
import 'package:petmutualaid/models/mymodels.dart';
import 'package:petmutualaid/ui/dates/services/crud_dates.dart';

class HomeDatesUI extends StatefulWidget {
  const HomeDatesUI({super.key});

  @override
  State<HomeDatesUI> createState() => _HomeDatesUIState();
}


class _HomeDatesUIState extends State<HomeDatesUI> {
  ///
  List<MyDateModel> myDates = [];
  ///
  @override
  void initState() {
    ///
    getHomeDatesF();
    ///
    super.initState();
    ///
  }
  ///
  getHomeDatesF(){
    ///
    myDates = getHomeDatesFF();
    ///
    setState(() {
      
    });
  }
  ///
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: myDates.length,
      itemBuilder: (BuildContext context, index){
        return Card(
          child: Column(
            children: [
              Text(myDates[index].day),
              Text(myDates[index].petName),
              Text(myDates[index].ownerUsername),
              Text(myDates[index].location),
              Text(myDates[index].petDetails),
            ],
          ),
        );
    });
  }
}