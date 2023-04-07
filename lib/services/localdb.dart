import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:petmutualaid/models/mymodels.dart';
import 'package:petmutualaid/services/authservice.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class LocalDbC {

  //
  static Future<void> initLocalDb() async {
    //
    await Hive.initFlutter();

    //Register Adapters
    registerMyAdpters();

    //Open All Boxes
    await openAllBoxes();
  }

  static void registerMyAdpters() {
    //--
    Hive.registerAdapter(MyUserModelAdapter());
    Hive.registerAdapter(MyPetModelAdapter());
    Hive.registerAdapter(MyScheduleModelAdapter());
    Hive.registerAdapter(MyTemporaryCarerModelAdapter());
    //--
  }
  /// Hive Box for Local Account
  static late Box myAccountsBox;
  /// Hive Box for Users
  static late Box myUsersBox;
  /// Hive Box for Pets
  static late Box myPetsBox;
  /// Hive Box for Schedules
  static late Box mySchedulesBox;
  /// Hive Box for Temporary Carers
  static late Box myTempCarersBox;
  ///
  static openAllBoxes() async {
    ///
    myAccountsBox = await Hive.openBox('_MY_ACCOUNTS');
    myUsersBox = await Hive.openBox('_MY_USERS');
    myPetsBox = await Hive.openBox('_MY_PETS');
    mySchedulesBox = await Hive.openBox('_MY_SCHEDULES');
    myTempCarersBox = await Hive.openBox('_MY_TEMP_CARERS');
    ///
    debugPrint("Opened Boxes");
    ///
    dummyUsers();
    ///
    dummyPets();
    ///
  }
  ///Create Dummy Users
  static dummyUsers() async{
    ///
    var uuid = const Uuid();
    ///
    ///
    http.Response response = await http.get(
      Uri.parse('https://images.unsplash.com/photo-1557002665-c552e1832483?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
    );
    ///
    var selfiePic = response.bodyBytes;
    ///
    MyUserModel user1 = MyUserModel(
        id: uuid.v4(),
        username: "James",
        password: "password",
        name: "James",
        nationalId: "nationalId1",
        city: "Ville Heaven",
        address: "45 Tree Avenue",
        sex: "male",
        selfiePic: selfiePic,
        age: "30",
        housePic: selfiePic,
        petSpacePic: selfiePic,
        hasPets: "NO"
    );
    ///
    MyUserModel user2 = MyUserModel(
        id: uuid.v4(),
        username: "Moses",
        password: "password",
        name: "Moses",
        nationalId: "nationalId2",
        city: "Ville Heaven",
        address: "45 Tree Avenue",
        sex: "male",
        selfiePic: selfiePic,
        age: "30",
        housePic: selfiePic,
        petSpacePic: selfiePic,
        hasPets: "NO"
    );
    ///
    MyUserModel user3 = MyUserModel(
        id: uuid.v4(),
        username: "Sarah",
        password: "password",
        name: "Sarah",
        nationalId: "nationalId3",
        city: "Ville Heaven",
        address: "45 Tree Avenue",
        sex: "male",
        selfiePic: selfiePic,
        age: "38",
        housePic: selfiePic,
        petSpacePic: selfiePic,
        hasPets: "NO"
    );
    ///
    try{
      ///
      myUsersBox.put(user1.username, user1);
      ///
      createDummySchedulesF(user1);
      ///
      myUsersBox.put(user2.username, user2);
      ///
      createDummySchedulesF(user2);
      ///
      myUsersBox.put(user3.username, user3);
      ///
      createDummySchedulesF(user3);
      ///
    } catch(e){
      ///
      debugPrint("DUM STUFF");
    }
    ///
  }
  ///
  static createDummySchedulesF(MyUserModel myUser) async{
    ///
    createDefaultScheduleF(myUser);
    ///
  }
  ///
  static dummyPets() async{
    ///
    var uuid = const Uuid();
    ///
    String petName ="Scooby(James)";
    ///
    http.Response response = await http.get(
      Uri.parse('https://images.unsplash.com/photo-1577474810446-650b0d0e561b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=736&q=80'),
    );
    ///
    var selfiePic1 = response.bodyBytes;
    ///
    MyPetModel pet1 = MyPetModel(
        id: uuid.v4(),
        name: petName,
        type: "Dog",
        sex: "Male",
        selfiePic: selfiePic1,
        selfiePic2: selfiePic1,
        diet: "Biscuits",
        age: "2 years",
        ownerUserName: "James",
        passedAway: "NO"
    );
    ///
    petName ="Rex(Moses)";
    ///
    MyPetModel pet2 = MyPetModel(
        id: uuid.v4(),
        name: petName,
        type: "Dog",
        sex: "Male",
        selfiePic: selfiePic1,
        selfiePic2: selfiePic1,
        diet: "Jelly Babies",
        age: "5 years",
        ownerUserName: "Moses",
        passedAway: "NO"
    );
    ///
    try{
      ///
      myPetsBox.put(pet1.name, pet1);
      ///
      myPetsBox.put(pet2.name, pet2);
      ///
    } catch(e){
      ///
      debugPrint("DUM STUFF 2");
    }


  }
}
