import 'package:flutter/material.dart';
import 'package:petmutualaid/models/mymodels.dart';
import 'package:petmutualaid/ui/dates/services/crud_dates.dart';

class AwayDatesUI extends StatefulWidget {
  const AwayDatesUI({super.key});

  @override
  State<AwayDatesUI> createState() => _AwayDatesUIState();
}

class _AwayDatesUIState extends State<AwayDatesUI> {
  ///
  List<MyDateModel> myDates = [];
  ///
  @override
  void initState() {
    ///
    getAwayDatesF();
    ///
    super.initState();
    ///
  }
  ///
  getAwayDatesF(){
    ///
    myDates = getAwayDatesFF();
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