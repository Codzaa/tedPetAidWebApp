import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:petmutualaid/models/mymodels.dart';

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


  static openAllBoxes() async {
    //
    myAccountsBox = await Hive.openBox('_MY_ACCOUNTS');
    myUsersBox = await Hive.openBox('_MY_USERS');
    myPetsBox = await Hive.openBox('_MY_PETS');
    mySchedulesBox = await Hive.openBox('_MY_SCHEDULES');
    myTempCarersBox = await Hive.openBox('_MY_TEMP_CARERS');
    //
    debugPrint("Opened Boxes");
  }
}
