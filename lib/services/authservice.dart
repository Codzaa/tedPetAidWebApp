import 'package:flutter/material.dart';
import 'package:petmutualaid/models/mymodels.dart';
import 'package:petmutualaid/services/constants.dart';
import 'package:petmutualaid/services/localdb.dart';
import 'package:uuid/uuid.dart';
///
/// Function for Signing Up
String signUpF(
    MyUserModel myUser
    ){
  //
  var uuid = const Uuid();
  //Check whether the user exists
  bool result = userExist(myUser.username);
  // If the user exists
  // Then Exit the function, returning null
  if (result){
    return "User Already Exists";
  }
  // Generate User Id
  myUser.id = uuid.v1();
  /// Save the User to the Database
  LocalDbC.myUsersBox.put(myUser.username, myUser);
  /// Create Dafault Schedule for the new user
  createDefaultScheduleF(myUser);
  /// Set the Global User
  UserC.globalUser = myUser;
  /// Return the success message
  return globalSuccessMsg;
}
///
/// Function to Check if the Password & Username exist
String loginFF(String username,String password){
  ///
  var user = LocalDbC.myUsersBox.get(username);
  ///
  //debugPrint(user!.name);
  ///
  if(user != null){
    debugPrint(user.name);
    debugPrint(user.password);
    if(user.password == password){

      /// Set the Global User
      UserC.globalUser = user;
      ///
      return globalSuccessMsg;
    }
  }
  ///
  return "User Creds are Incorrect";
}
///
/// Function/Method to check if the UserName is already Taken
bool userExist(username){
  //
  var result = LocalDbC.myUsersBox.get(username);
  //
  if(result != null){
    return true;
  }
  //
  return false;
}
///
/// Function/Method to create the user's default Schedule
void createDefaultScheduleF(MyUserModel myUser){
  ///
  var uuid = const Uuid();
  ///
  MyScheduleModel mySchedule = MyScheduleModel(
    id: uuid.v4(), 
    ownerUserName: myUser.username, 
    monday: free, 
    tuesday: free, 
    wednesday: free, 
    thursday: free, 
    friday: free, 
    saturday: free, 
    sunday: free, 
    isAvailable: true
    );
  /// Save the Schedule to the Database
  LocalDbC.mySchedulesBox.put(myUser.username, mySchedule);
  
}