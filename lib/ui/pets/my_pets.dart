import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:petmutualaid/models/mymodels.dart';
import 'package:petmutualaid/ui/pets/add_pet.dart';
import 'package:petmutualaid/ui/pets/pet_profile.dart';
import 'package:petmutualaid/ui/pets/services/crud_pets.dart';

class MyPetsUI extends StatefulWidget {
  const MyPetsUI({Key? key}) : super(key: key);

  @override
  State<MyPetsUI> createState() => _MyPetsUIState();
}

class _MyPetsUIState extends State<MyPetsUI> {
  ///
  List<MyPetModel> pets = [];
  ///
  void getAllUserPetsF(){
    ///
    pets = fetchUserPetsF();
    ///
    setState(() {});
    ///
  }
  ///
  @override
  void initState() {
    ///
    getAllUserPetsF();
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("My Pets")),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: TextButton(onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => const AddPetUI()));
                },child:const Text("ADD PET",style: TextStyle(color: Colors.white),))
            ),
          ],
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.64,
            child: MasonryGridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                itemCount: pets.length,
                itemBuilder: (BuildContext context,int index){
                  return GestureDetector(
                      onTap: (){},
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => PetProfileUI(myPet: pets[index])));
                        },
                        child: Card(
                          child: Column(
                            children: [
                              ListTile(
                                  leading: const Icon(Icons.album),
                                  title: const Text("Name"),
                                  subtitle: Text(pets[index].name),
                                ),
                              Image.memory(pets[index].selfiePic),
                            ],
                          ),
                        ),
                      ));
                }
            ),
          ),
        )
    );
  }
}
