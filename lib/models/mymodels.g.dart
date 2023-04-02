// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mymodels.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyUserModelAdapter extends TypeAdapter<MyUserModel> {
  @override
  final int typeId = 0;

  @override
  MyUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyUserModel(
      id: fields[0] as String,
      username: fields[1] as String,
      password: fields[2] as String,
      name: fields[3] as String,
      nationalId: fields[4] as String,
      city: fields[5] as String,
      address: fields[6] as String,
      sex1: fields[7] as String,
      selfiePic: fields[8] as String,
      age: fields[9] as String,
      housePic: fields[10] as String,
      petSpacePic: fields[11] as String,
      hasPets: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MyUserModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.nationalId)
      ..writeByte(5)
      ..write(obj.city)
      ..writeByte(6)
      ..write(obj.address)
      ..writeByte(7)
      ..write(obj.sex1)
      ..writeByte(8)
      ..write(obj.selfiePic)
      ..writeByte(9)
      ..write(obj.age)
      ..writeByte(10)
      ..write(obj.housePic)
      ..writeByte(11)
      ..write(obj.petSpacePic)
      ..writeByte(12)
      ..write(obj.hasPets);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MyPetModelAdapter extends TypeAdapter<MyPetModel> {
  @override
  final int typeId = 1;

  @override
  MyPetModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyPetModel(
      id: fields[0] as String,
      name: fields[1] as String,
      type: fields[2] as String,
      sex: fields[3] as String,
      selfiePic: fields[4] as String,
      selfiePic2: fields[5] as String,
      diet: fields[6] as String,
      age: fields[7] as String,
      ownerUserName: fields[8] as String,
      passedAway: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MyPetModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.sex)
      ..writeByte(4)
      ..write(obj.selfiePic)
      ..writeByte(5)
      ..write(obj.selfiePic2)
      ..writeByte(6)
      ..write(obj.diet)
      ..writeByte(7)
      ..write(obj.age)
      ..writeByte(8)
      ..write(obj.ownerUserName)
      ..writeByte(9)
      ..write(obj.passedAway);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyPetModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MyScheduleModelAdapter extends TypeAdapter<MyScheduleModel> {
  @override
  final int typeId = 2;

  @override
  MyScheduleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyScheduleModel(
      id: fields[0] as String,
      ownerUserName: fields[1] as String,
      monday: fields[2] as String,
      tuesday: fields[3] as String,
      wednesday: fields[4] as String,
      thursday: fields[5] as String,
      friday: fields[6] as String,
      saturday: fields[7] as String,
      sunday: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MyScheduleModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.ownerUserName)
      ..writeByte(2)
      ..write(obj.monday)
      ..writeByte(3)
      ..write(obj.tuesday)
      ..writeByte(4)
      ..write(obj.wednesday)
      ..writeByte(5)
      ..write(obj.thursday)
      ..writeByte(6)
      ..write(obj.friday)
      ..writeByte(7)
      ..write(obj.saturday)
      ..writeByte(8)
      ..write(obj.sunday);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyScheduleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MyTemporaryCarerModelAdapter extends TypeAdapter<MyTemporaryCarerModel> {
  @override
  final int typeId = 3;

  @override
  MyTemporaryCarerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyTemporaryCarerModel(
      id: fields[0] as String,
      days: (fields[1] as Map).cast<String, dynamic>(),
      carerSelfiePic: fields[2] as String,
      petSelfiePic: fields[3] as String,
      petName: fields[4] as String,
      carerUserName: fields[5] as String,
      ownerUserName: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MyTemporaryCarerModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.days)
      ..writeByte(2)
      ..write(obj.carerSelfiePic)
      ..writeByte(3)
      ..write(obj.petSelfiePic)
      ..writeByte(4)
      ..write(obj.petName)
      ..writeByte(5)
      ..write(obj.carerUserName)
      ..writeByte(6)
      ..write(obj.ownerUserName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyTemporaryCarerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
