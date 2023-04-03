import 'package:flutter/material.dart';
import 'package:petmutualaid/models/mymodels.dart';
import 'package:petmutualaid/ui/pets/services/crud_pets.dart';

class MyPetsUI extends StatefulWidget {
  const MyPetsUI({Key? key}) : super(key: key);

  @override
  State<MyPetsUI> createState() => _MyPetsUIState();
}

class _MyPetsUIState extends State<MyPetsUI> {

  void getAllUserPetsF(){
    ///
    List<MyPetModel> pets = fetchUserPetsF();
    ///
    ///
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllUserPetsF();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Pets"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
