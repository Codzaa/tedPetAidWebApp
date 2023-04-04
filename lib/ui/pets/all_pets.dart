import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
    getAllPetsF();
    ///
    super.initState();
    ///
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemCount: pets.length,
          itemBuilder: (BuildContext context,int index){
            return GestureDetector(
              onTap: (){},
              child: Image.memory(pets[index].selfiePic));
          }
      )
    );
  }
}
