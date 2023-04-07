import 'package:flutter/material.dart';
import 'package:petmutualaid/models/mymodels.dart';
import 'package:petmutualaid/services/constants.dart';
import 'package:petmutualaid/services/localdb.dart';

///
List<MyUserModel> getAllCarersFF(){
  ///
  Iterator it = LocalDbC.myUsersBox.values.iterator;
  ///
  List<MyUserModel> carers = [];
  ///
  while (it.moveNext()) {
    ///
    carers.add(it.current);
    ///
  }
  ///
  return carers;
}
///
List<MyUserModel> getAvailableCarersFF(){
  ///
  Iterator it2 = LocalDbC.mySchedulesBox.values.iterator;
  ///
  List<MyUserModel> carers = [];
  ///
  List<MyScheduleModel> scheds = [];
  ///
  while (it2.moveNext()) {
    ///
    if(it2.current.isAvailable){
      ///
      scheds.add(it2.current);
      ///
      carers.add(LocalDbC.myUsersBox.get(it2.current.ownerUserName));
      ///
    }
  ///  
  }
  ///
  return carers;
}
///
/// Function to get User schedule
MyScheduleModel getUserScheduleFF(){
  ///
  MyScheduleModel mySchedule = LocalDbC.mySchedulesBox.get(UserC.globalUser!.username);
  ///
  return mySchedule;
}
///
void changeDayScheduleFF(MyScheduleModel mySchedule){
  ///
  if(mySchedule.monday != free){
    ///
    if(mySchedule.tuesday != free){
      ///
      if(mySchedule.wednesday != free){
        ///
        if(mySchedule.thursday != free){
          ///
          if(mySchedule.friday != free){
            ///
            if(mySchedule.saturday != free){
              ///
              if(mySchedule.sunday != free){
                ///
                mySchedule.isAvailable = false;
              }
            }
          }
        }
      }
    }
  }
  ///
  LocalDbC.mySchedulesBox.put(UserC.globalUser!.username, mySchedule);
  ///
}

