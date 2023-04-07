import 'package:flutter/material.dart';
import 'package:petmutualaid/models/mymodels.dart';
import 'package:petmutualaid/services/constants.dart';
import 'package:petmutualaid/services/localdb.dart';
import 'package:petmutualaid/ui/dates/add_date.dart';

class CarerSchedUI extends StatefulWidget {
  const CarerSchedUI({
      super.key,
      required this.carer,
      });
  ///
  final MyUserModel carer;
  ///
  @override
  State<CarerSchedUI> createState() => _CarerSchedUIState();
}

class _CarerSchedUIState extends State<CarerSchedUI> {
  ///
  MyScheduleModel? carerSched;
  ///
  bool gotCarer = false;
  ///
  ///
  Color? dayColourMonday = Colors.teal[100];
  ///
  Color? dayColourTuesday = Colors.teal[100];
  ///
  Color? dayColourWednesday = Colors.teal[100];
  ///
  Color? dayColourThursday = Colors.teal[100];
  ///
  Color? dayColourFriday = Colors.teal[100];
  ///
  Color? dayColourSaturday = Colors.teal[100];
  ///
  Color? dayColourSunday = Colors.teal[100];
  ///
  @override
  void initState() {
    ///
    getCareSchedF();
    ///
    super.initState();
  }
  ///
  void getCareSchedF(){
    ///
    carerSched = LocalDbC.mySchedulesBox.get(widget.carer.username);
    ///
    if(carerSched!.monday == booked){
      dayColourMonday = Colors.teal[600];
    }
    if(carerSched!.tuesday == booked){
      dayColourTuesday = Colors.teal[600];
    }
    if(carerSched!.wednesday == booked){
      dayColourWednesday = Colors.teal[600];
    }
    if(carerSched!.thursday == booked){
      dayColourThursday = Colors.teal[600];
    }
    if(carerSched!.friday == booked){
      dayColourFriday = Colors.teal[600];
    }
    if(carerSched!.saturday == booked){
      dayColourSaturday = Colors.teal[600];
    }
    if(carerSched!.sunday == booked){
      dayColourSunday = Colors.teal[600];
    }
    ///
    setState(() {
      gotCarer = true;
    });
    ///
  }
  ///
  void chooseDate(int day){
    ///
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (BuildContext context) => AddDateUI(carerSched: carerSched!)
      )
    );
    ///
  }
  ///
  void dateNotAvailable(){
    ///
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Date Not Available")),
    );
    ///
  }
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: gotCarer ? Column() : GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 3,
            mainAxisSpacing: 3,
            crossAxisCount: 3,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  ///
                  if(carerSched!.monday == free){
                    ///
                    chooseDate(1);
                  ///
                  }else{
                    ///
                    dateNotAvailable();
                    ///
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: dayColourMonday,
                  child: Column(
                    children: [
                      const Text(monday),
                      Text(carerSched!.monday),
                    ],
                  )
                ),
              ),
              GestureDetector(
                onTap: (){
                  ///
                  if(carerSched!.tuesday == free){
                    ///
                    chooseDate(2);
                  ///
                  }else{
                    ///
                    dateNotAvailable();
                    ///
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: dayColourTuesday,
                  child: Column(
                    children: [
                      const Text(tuesday),
                      Text(carerSched!.tuesday),
                    ],
                  )
                ),
              ),
              GestureDetector(
                onTap: (){
                  ///
                  if(carerSched!.wednesday == free){
                    ///
                    chooseDate(3);
                  ///
                  }else{
                    ///
                    dateNotAvailable();
                    ///
                  }
                  ///
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: dayColourWednesday,
                  child: Column(
                    children: [
                      const Text(wednesday),
                      Text(carerSched!.wednesday),
                    ],
                  )
                ),
              ),
              GestureDetector(
                onTap: (){
                  ///
                  if(carerSched!.thursday == free){
                    ///
                    chooseDate(4);
                  ///
                  }else{
                    ///
                    dateNotAvailable();
                    ///
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: dayColourThursday,
                  child: Column(
                    children: [
                      const Text(thursday),
                      Text(carerSched!.thursday),
                    ],
                  )
                ),
              ),
              GestureDetector(
                onTap: (){
                  ///
                  if(carerSched!.friday == free){
                    ///
                    chooseDate(5);
                  ///
                  }else{
                    ///
                    dateNotAvailable();
                    ///
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: dayColourFriday,
                  child: Column(
                    children: [
                      const Text(friday),
                      Text(carerSched!.friday),
                    ],
                  )
                ),
              ),
              GestureDetector(
                onTap: (){
                  ///
                  if(carerSched!.saturday == free){
                    ///
                    chooseDate(6);
                  ///
                  }else{
                    ///
                    dateNotAvailable();
                    ///
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: dayColourSaturday,
                  child: Column(
                    children: [
                      const Text(saturday),
                      Text(carerSched!.saturday),
                    ],
                  )
                ),
              ),
              GestureDetector(
                onTap: (){
                  ///
                  if(carerSched!.sunday == free){
                    ///
                    chooseDate(7);
                  ///
                  }else{
                    ///
                    dateNotAvailable();
                    ///
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: dayColourSunday,
                  child: Column(
                    children:[
                      const Text(sunday),
                      Text(carerSched!.sunday),
                    ],
                  )
                ),
              ),
            ],
          ),
    );
  }
}