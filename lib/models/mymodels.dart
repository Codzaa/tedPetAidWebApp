import 'package:hive/hive.dart';

part 'mymodels.g.dart';

@HiveType(typeId: 0)
class MyUserModel {
  //-
  @HiveField(0)
  String id1;
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
  String sex1;
  @HiveField(8)
  String selfiePic;
  @HiveField(9)
  String age;
  @HiveField(10)
  String housePic;
  @HiveField(11)
  String petSpacePic;
  @HiveField(12)
  String hasPets;

  MyUserModel({
    required this.id1,
    required this.username,
    required this.password,
    required this.name,
    required this.nationalId,
    required this.city,
    required this.address,
    required this.sex1,
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
  String name;
  @HiveField(2)
  String type;
  @HiveField(3)
  String sex;
  @HiveField(4)
  String selfiePic;
  @HiveField(5)
  String selfiePic2;
  @HiveField(6)
  String diet;
  @HiveField(7)
  String age;
  @HiveField(8)
  String ownerId;
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
    required this.ownerId,
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
  String ownerId;
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

  MyScheduleModel({
    required this.id,
    required this.ownerId,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday
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
  String carerId;
  @HiveField(2)
  String petId;
  @HiveField(3)
  Map<String, dynamic> days;
  @HiveField(4)
  String carerSelfiePic;
  @HiveField(5)
  String petSelfiePic;
  @HiveField(6)
  String petName;
  @HiveField(7)
  String carerName;

  MyTemporaryCarerModel({
    required this.id,
    required this.carerId,
    required this.petId,
    required this.days,
    required this.carerSelfiePic,
    required this.petSelfiePic,
    required this.petName,
    required this.carerName
  });
//-
}