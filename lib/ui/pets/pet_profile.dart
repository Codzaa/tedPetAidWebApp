import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:petmutualaid/models/mymodels.dart';
import 'package:petmutualaid/services/constants.dart';
import 'package:petmutualaid/ui/pets/services/crud_pets.dart';


class PetProfileUI extends StatefulWidget {
  const PetProfileUI({
      super.key,
      required this.myPet,
  });

  ///
  final MyPetModel myPet;

  @override
  State<PetProfileUI> createState() => _PetProfileUIState();
}

class _PetProfileUIState extends State<PetProfileUI> {
  ///
  final CarouselController _controller = CarouselController();
  ///
  bool activateEditBtns = false;
  ///
  @override
  void initState() {
    // TODO: implement initState
    ///
    activateControls();
    ///
    super.initState();
    ///
  }
  ///
  void activateControls(){
    ///
    String result = petBelongsTo(widget.myPet);
    ///
    if(result == globalSuccessMsg){
      ///
      activateEditBtns = true;
      ///
      setState(() {});
      ///
    }
    ///
  }
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back))
        ],
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children:[ Center(
          child: FractionallySizedBox(
            widthFactor: 0.63,
            child: Card(
              child: Column(
                children: [
                  ListTile(
                leading: const Icon(Icons.album),
                title: const Text("Name:"),
                subtitle: Text(widget.myPet.name),
              ),
              ListTile(
                leading: const Icon(Icons.album),
                title: const Text("Age"),
                subtitle: Text(widget.myPet.age),
              ),
              ListTile(
                leading: const Icon(Icons.album),
                title: const Text("Specis"),
                subtitle: Text(widget.myPet.type),
              ),
              ListTile(
                leading: const Icon(Icons.album),
                title: const Text("Owner"),
                subtitle: Text(widget.myPet.ownerUserName),
              )
                  ,
                  CarouselSlider(
                    items: [
                      Image.memory(widget.myPet.selfiePic),
                      Image.memory(widget.myPet.selfiePic2)
                    ],
                    carouselController: _controller,
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      aspectRatio: 2.0,
                      initialPage: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),]
      ),
    );
  }
}
