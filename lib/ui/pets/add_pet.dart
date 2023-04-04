import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmutualaid/models/mymodels.dart';
import 'package:petmutualaid/services/constants.dart';
import 'package:petmutualaid/ui/pets/my_pets.dart';
import 'package:petmutualaid/ui/pets/services/crud_pets.dart';

class AddPetUI extends StatefulWidget {
  const AddPetUI({Key? key}) : super(key: key);

  @override
  State<AddPetUI> createState() => _AddPetUIState();
}

class _AddPetUIState extends State<AddPetUI> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController dietController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController ownerUsernameController = TextEditingController();
  ///
  Uint8List selfieFileUrl  = Uint8List(128);
  ///
  Uint8List selfie2FileUrl  = Uint8List(128);
  ///
  bool selfieLoaded = false;
  ///
  bool selfie2Loaded = false;
  ///
  void pickSelfiePic() async{
    ///
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    ///
    if (image!= null) {
      //adapter.storeImage(imageBytes);
      ///
      selfieFileUrl = await image.readAsBytes();
      selfieLoaded = true;
      setState(() {});
    } else {
      /// User canceled the picker
    }
  }
  ///
  void pickSelfie2Pic() async {
    ///
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    ///
    if (image!= null) {
      selfie2FileUrl = await image.readAsBytes();
      selfie2Loaded = true;
      setState(() {});
    } else {
      /// User canceled the picker
    }
  }
  ///
  void addPetF(){
    ///
    debugPrint("Can Save Pet :)");
    MyPetModel myPet = MyPetModel(
        id: "",
        name: nameController.text,
        type: typeController.text,
        sex: sexController.text,
        selfiePic: selfieFileUrl,
        selfiePic2: selfie2FileUrl,
        diet: dietController.text,
        age: ageController.text,
        ownerUserName: "",
        passedAway: "NO"
    );
    // Try to Add the Pet
    String result = addPetFF(myPet);
    // If sign up is successful
    if(result == globalSuccessMsg){
      // Re-route to My Pets Page
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result)),
      );
      //
      Navigator.of(context).pop();
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result)),
      );
    }
  }

  // Function/Method to check if the Pictures have been uploaded
  bool checkPicturesF(){
    ///
    if(selfieFileUrl != []){
      if(selfie2FileUrl != []){
        return true;
      }
    }
    ///
    return false;
  }
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Pet"),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: TextButton(onPressed: () {
                bool result = checkPicturesF();
                if(!result){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please Upload all Pet Pictures")),
                  );
                }else{
                  addPetF();
                }
              },child:const Text("SAVE",style: TextStyle(color: Colors.white),))
          ),
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: TextButton(onPressed: () {

              },child:const Text("CANCEL",style: TextStyle(color: Colors.white),))
          ),
        ],
      ),
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter pet name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: typeController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Species"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Pet Species';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: sexController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Gender"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter pet Gender';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          pickSelfiePic();
                        },
                        child: const Text('Choose Selfie'),
                      ),
                    ),
                  ),
                  selfieLoaded ? Image.memory(
                    selfieFileUrl,
                  ): const SizedBox(),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          pickSelfie2Pic();
                        },
                        child: const Text('Choose House Picture'),
                      ),
                    ),
                  ),
                 selfie2Loaded ? Image.memory(
                    selfie2FileUrl,
                  ): const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
