

import 'package:petmutualaid/models/mymodels.dart';
import 'package:petmutualaid/services/constants.dart';
import 'package:petmutualaid/services/localdb.dart';
import 'package:uuid/uuid.dart';

String addPetFF(MyPetModel myPet){
  ///
  var uuid = const Uuid();
  /// Create Pet name
  myPet.name ="${myPet.name}_${UserC.globalUser!.username}";
  /// Check if pet already exists
  bool result = checkPet(myPet.name);
  ///
  if(result){
    ///
    return "Pet Already Exists";
    ///
  }
  /// Create an Id
  myPet.id = uuid.v4();
  /// Create Pet name
  myPet.name ="${myPet.name}_${UserC.globalUser!.username}";
  /// Add Pet to Database
  LocalDbC.myPetsBox.put(myPet.name,myPet);
  ///
  return globalSuccessMsg;
  ///
}

bool checkPet(petName){
  ///
  var myPet = LocalDbC.myPetsBox.get(petName);
  ///
  if(myPet == null){
    ///
    return true;
  }
  ///
  return false;
}
///
String editPet(MyPetModel myPet){
  ///
  LocalDbC.myPetsBox.put(myPet.name, myPet);
  ///
  return globalSuccessMsg;
  ///
}
///
List<MyPetModel> fetchUserPetsF(){
  ///
  Iterator it = LocalDbC.myPetsBox.values.iterator;
  ///
  List<MyPetModel> myPets = [];
  ///
  while (it.moveNext()) {
    ///
    if(it.current.owerUsername == UserC.globalUser!.username){
      ///
      myPets.add(it.current);
      ///
    }
  }
  ///
  return myPets;
}
/// Function/Method to show all pets
List<MyPetModel> getAllPetsFF(){
  ///
  List<MyPetModel> allPets = [];
  ///
  Iterator it = LocalDbC.myPetsBox.values.iterator;
  ///
  while (it.moveNext()) {
    ///
    if (it.current.owerUsername == UserC.globalUser!.username) {
      ///
      allPets.add(it.current);
      ///
    }
    ///
  }
  ///
  return allPets;
}
///
///
///
///
///
///
///