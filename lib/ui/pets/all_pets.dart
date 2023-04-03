import 'package:flutter/material.dart';
import 'package:petmutualaid/models/mymodels.dart';
import 'package:petmutualaid/ui/pets/services/crud_pets.dart';

class AllPetsUI extends StatefulWidget {
  const AllPetsUI({Key? key}) : super(key: key);

  @override
  State<AllPetsUI> createState() => _AllPetsUIState();
}

class _AllPetsUIState extends State<AllPetsUI> {
  ///
  List<MyPetModel> pets = [];
  ///
  void getAllPetsF(){
    ///
    pets = getAllPetsFF();
    ///
    setState(() {});
    ///
  }
  ///
  @override
  void initState() {
    ///
    getAllPetsFF();
    ///
    super.initState();
    ///
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
