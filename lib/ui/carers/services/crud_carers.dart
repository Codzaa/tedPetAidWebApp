import 'package:flutter/material.dart';
import 'package:petmutualaid/models/mymodels.dart';
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
  Iterator it = LocalDbC.myUsersBox.values.iterator;
  ///
  Iterator it2 = LocalDbC.mySchedulesBox.values.iterator;
  ///
  List<MyUserModel> carers = [];
  ///
  while (it2.moveNext()) {
    ///
    if(it2.current.isAvailable){
      ///
      while(it.moveNext()){
        ///
        if(it.current.username == it2.current.ownerUserName){
          ///
          carers.add(it.current);
          ///
        }
        ///
      }
      ///
    }
  }
  ///
  return carers;
}

