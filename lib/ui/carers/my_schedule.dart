import 'package:flutter/material.dart';
import 'package:petmutualaid/models/mymodels.dart';
import 'package:petmutualaid/services/constants.dart';
import 'package:petmutualaid/ui/carers/services/crud_carers.dart';

class MyScheduleUI extends StatefulWidget {
  const MyScheduleUI({super.key});

  @override
  State<MyScheduleUI> createState() => _MyScheduleUIState();
}

class _MyScheduleUIState extends State<MyScheduleUI> {
  ///
  late MyScheduleModel mySchedule;
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
    getUserScheduleF();
    ///
    super.initState();
  }
  ///
  void getUserScheduleF(){
    ///
    mySchedule = getUserScheduleFF();
    ///
    if(mySchedule.monday == booked){
      dayColourMonday = Colors.teal[600];
    }
    if(mySchedule.tuesday == booked){
      dayColourTuesday = Colors.teal[600];
    }
    if(mySchedule.wednesday == booked){
      dayColourWednesday = Colors.teal[600];
    }
    if(mySchedule.thursday == booked){
      dayColourThursday = Colors.teal[600];
    }
    if(mySchedule.friday == booked){
      dayColourFriday = Colors.teal[600];
    }
    if(mySchedule.saturday == booked){
      dayColourSaturday = Colors.teal[600];
    }
    if(mySchedule.sunday == booked){
      dayColourSunday = Colors.teal[600];
    }
    ///
    setState(() {  });
    ///
  }
  ///
  String changeValueOfDateF(String day,int index){
    ///
    if(day == free){
      ///
      day = booked;
      ///
      switch (index) {
        case 1:
          dayColourMonday = Colors.teal[600];
          break;
        case 2:
          dayColourTuesday = Colors.teal[600];
          break;
        case 3:
          dayColourWednesday = Colors.teal[600];
          break;
        case 4:
          dayColourThursday = Colors.teal[600];
          break;
        case 5:
          dayColourFriday = Colors.teal[600];
          break;
        case 6:
          dayColourSaturday = Colors.teal[600];
          break;
        case 7:
          dayColourSunday = Colors.teal[600];
          break;
        default:
      }
      ///
      return day;
      ///
    }else{
      ///
      day = free;
      ///
      switch (index) {
        case 1:
          dayColourMonday = Colors.teal[100];
          break;
        case 2:
          dayColourTuesday = Colors.teal[100];
          break;
        case 3:
          dayColourWednesday = Colors.teal[100];
          break;
        case 4:
          dayColourThursday = Colors.teal[100];
          break;
        case 5:
          dayColourFriday = Colors.teal[100];
          break;
        case 6:
          dayColourSaturday = Colors.teal[100];
          break;
        case 7:
          dayColourSunday = Colors.teal[100];
          break;
        default:
      }
      ///
      ///
      return day;
      ///
    }
    ///
  }
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 3,
            mainAxisSpacing: 3,
            crossAxisCount: 3,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  ///
                  mySchedule.monday = changeValueOfDateF(mySchedule.monday,1);
                  ///
                  changeDayScheduleFF(mySchedule);
                  ///
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: dayColourMonday,
                  child: Column(
                    children: [
                      const Text(monday),
                      Text(mySchedule.monday),
                    ],
                  )
                ),
              ),
              GestureDetector(
                onTap: (){
                  ///
                  mySchedule.tuesday = changeValueOfDateF(mySchedule.tuesday,2);
                  ///
                  changeDayScheduleFF(mySchedule);
                  ///
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: dayColourTuesday,
                  child: Column(
                    children: [
                      const Text(tuesday),
                      Text(mySchedule.tuesday),
                    ],
                  )
                ),
              ),
              GestureDetector(
                onTap: (){
                  ///
                  mySchedule.wednesday = changeValueOfDateF(mySchedule.wednesday,3);
                  ///
                  changeDayScheduleFF(mySchedule);
                  ///
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: dayColourWednesday,
                  child: Column(
                    children: [
                      const Text(wednesday),
                      Text(mySchedule.wednesday),
                    ],
                  )
                ),
              ),
              GestureDetector(
                onTap: (){
                  ///
                  mySchedule.thursday = changeValueOfDateF(mySchedule.thursday,4);
                  ///
                  changeDayScheduleFF(mySchedule);
                  ///
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: dayColourThursday,
                  child: Column(
                    children: [
                      const Text(thursday),
                      Text(mySchedule.thursday),
                    ],
                  )
                ),
              ),
              GestureDetector(
                onTap: (){
                  ///
                  mySchedule.friday = changeValueOfDateF(mySchedule.friday,5);
                  ///
                  changeDayScheduleFF(mySchedule);
                  ///
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: dayColourFriday,
                  child: Column(
                    children: [
                      const Text(friday),
                      Text(mySchedule.friday),
                    ],
                  )
                ),
              ),
              GestureDetector(
                onTap: (){
                  ///
                  mySchedule.saturday = changeValueOfDateF(mySchedule.saturday,6);
                  ///
                  changeDayScheduleFF(mySchedule);
                  ///
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: dayColourSaturday,
                  child: Column(
                    children: [
                      const Text(saturday),
                      Text(mySchedule.saturday),
                    ],
                  )
                ),
              ),
              GestureDetector(
                onTap: (){
                  ///
                  mySchedule.sunday = changeValueOfDateF(mySchedule.sunday,7);
                  ///
                  changeDayScheduleFF(mySchedule);
                  ///
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: dayColourSunday,
                  child: Column(
                    children:[
                      const Text(sunday),
                      Text(mySchedule.sunday),
                    ],
                  )
                ),
              ),
            ],
          )
    );
  }

}