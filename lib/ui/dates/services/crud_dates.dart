

import 'package:petmutualaid/models/mymodels.dart';
import 'package:petmutualaid/services/constants.dart';
import 'package:petmutualaid/services/localdb.dart';
import 'package:petmutualaid/ui/carers/services/crud_carers.dart';
import 'package:uuid/uuid.dart';

///
void createDateFF(
  String day,
  int dayInt,
  MyScheduleModel carerSched,
  MyPetModel myPet, 
  String petDetails,
  MyUserModel carerProfile
  ){
  ///
  var uuid = const Uuid();
  ///
  MyDateModel myDate = MyDateModel(
    id: uuid.v4(), 
    day: day, 
    carerUsername: carerSched.ownerUserName, 
    ownerUsername: UserC.globalUser!.username, 
    petName: myPet.name, 
    location: "${carerProfile.city} ${carerProfile.address}", 
    petDetails: petDetails);
  ///
  LocalDbC.myDatesBox.put(uuid.v4(), myDate);
  /// Update Schudule for Carer
  updateCarerSchedF(carerSched, dayInt);
  ///
}
///
void updateCarerSchedF(MyScheduleModel carerSched,int day){
  ///
  switch (day) {
    case 1:
      carerSched.monday = booked;
      break;
    case 2:
      carerSched.tuesday = booked;
      break;
    case 3:
      carerSched.wednesday = booked;
      break;
    case 4:
      carerSched.thursday = booked;
      break;
    case 5:
      carerSched.friday = booked;
      break;
    case 6:
      carerSched.saturday = booked;
      break;
    case 7:
      carerSched.sunday = booked;
      break;
    default:
  }
  ///
  changeDayScheduleFF2(carerSched);
  ///
}
///
MyUserModel getCarerProfileFF(MyScheduleModel carerSched){
  ///
  MyUserModel carer = LocalDbC.myUsersBox.get(carerSched.ownerUserName);
  ///
  return carer;
  ///
}
///
List<MyPetModel> getOwnerPetsFF(){
  ///
  Iterator pets = LocalDbC.myPetsBox.values.iterator;
  ///
  List<MyPetModel> userPets = [];
  ///
  while (pets.moveNext()) {
    ///
    if(pets.current.ownerUserName == UserC.globalUser!.username){
      ///
      userPets.add(pets.current);
      ///
    }
    ///
  }
  ///
  return userPets;
}
///
///
List<MyDateModel> getHomeDatesFF(){
  ///
  List<MyDateModel> myDates = [];
  ///
  Iterator allDates = LocalDbC.myDatesBox.values.iterator;
  ///
  while(allDates.moveNext()){
    ///
    if(allDates.current.carerUsername == UserC.globalUser!.username){
      ///
      myDates.add(allDates.current);
      ///
    }
    ///
  }
  ///
  return myDates;
}
///
///
List<MyDateModel> getAwayDatesFF(){
  ///
  List<MyDateModel> myDates = [];
  ///
  Iterator allDates = LocalDbC.myDatesBox.values.iterator;
  ///
  while(allDates.moveNext()){
    ///
    if(allDates.current.ownerUsername == UserC.globalUser!.username){
      ///
      myDates.add(allDates.current);
      ///
    }
    ///
  }
  ///
  return myDates;
}