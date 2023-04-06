import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'mymodels.g.dart';

@HiveType(typeId: 0)
class MyUserModel {
  //-
  @HiveField(0)
  String id;
  @HiveField(1)
  String username;
  @HiveField(2)
  String password;
  @HiveField(3)
  String name;
  @HiveField(4)
  String nationalId;
  @HiveField(5)
  String city;
  @HiveField(6)
  String address;
  @HiveField(7)
  String sex;
  @HiveField(8)
  Uint8List selfiePic;
  @HiveField(9)
  String age;
  @HiveField(10)
  Uint8List housePic;
  @HiveField(11)
  Uint8List petSpacePic;
  @HiveField(12)
  String hasPets;

  MyUserModel({
    required this.id,
    required this.username,
    required this.password,
    required this.name,
    required this.nationalId,
    required this.city,
    required this.address,
    required this.sex,
    required this.selfiePic,
    required this.age,
    required this.housePic,
    required this.petSpacePic,
    required this.hasPets,
  });
//-
}

///
@HiveType(typeId: 1)
class MyPetModel {
  //-
  @HiveField(0)
  String id;
  @HiveField(1)
  //When Quering and saving the pet to the database we will use :
  // PetName + ownerUserName
  String name;
  @HiveField(2)
  String type;
  @HiveField(3)
  String sex;
  @HiveField(4)
  Uint8List selfiePic;
  @HiveField(5)
  Uint8List selfiePic2;
  @HiveField(6)
  String diet;
  @HiveField(7)
  String age;
  @HiveField(8)
  String ownerUserName;
  @HiveField(9)
  String passedAway;

  MyPetModel({
    required this.id,
    required this.name,
    required this.type,
    required this.sex,
    required this.selfiePic,
    required this.selfiePic2,
    required this.diet,
    required this.age,
    required this.ownerUserName,
    required this.passedAway,
  });
//-
}

///
@HiveType(typeId: 2)
class MyScheduleModel {
  //-
  @HiveField(0)
  String id;
  @HiveField(1)
  String ownerUserName;
  @HiveField(2)
  String monday;
  @HiveField(3)
  String tuesday;
  @HiveField(4)
  String wednesday;
  @HiveField(5)
  String thursday;
  @HiveField(6)
  String friday;
  @HiveField(7)
  String saturday;
  @HiveField(8)
  String sunday;
  @HiveField(9)
  bool isAvailable;

  MyScheduleModel({
    required this.id,
    required this.ownerUserName,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
    required this.isAvailable
  });
//-
}

///
@HiveType(typeId: 3)
class MyTemporaryCarerModel {
  //-
  @HiveField(0)
  String id;
  @HiveField(1)
  Map<String, dynamic> days;
  @HiveField(2)
  String carerSelfiePic;
  @HiveField(3)
  String petSelfiePic;
  @HiveField(4)
  String petName;
  @HiveField(5)
  String carerUserName;
  @HiveField(6)
  String ownerUserName;

  MyTemporaryCarerModel({
    required this.id,
    required this.days,
    required this.carerSelfiePic,
    required this.petSelfiePic,
    required this.petName,
    required this.carerUserName,
    required this.ownerUserName
  });
//-
}