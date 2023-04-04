import 'dart:io';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmutualaid/models/mymodels.dart';
import 'package:petmutualaid/services/authservice.dart';
import 'package:petmutualaid/services/constants.dart';
import 'package:petmutualaid/ui/home.dart';
import 'package:petmutualaid/ui/login.dart';

class signUpUI extends StatefulWidget {
  const signUpUI({Key? key}) : super(key: key);

  @override
  State<signUpUI> createState() => _signUpUIState();
}

class _signUpUIState extends State<signUpUI> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  ///
  Uint8List selfieFileUrl = Uint8List(128);
  ///
  Uint8List houseFileUrl = Uint8List(128);
  ///
  Uint8List petShelterFileUrl = Uint8List(128);
  ///
  bool selfieLoaded = false;
  bool housePicLoaded = false ;
  bool petShelterLoaded = false;
  /// Function called when selfie button is pressed
  void pickSelfie() async {
    ///
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    ///
    if (image!= null) {
      selfieFileUrl = await image.readAsBytes();
      selfieLoaded = true;
      setState(() {});
    } else {
      // User canceled the picker
    }

  }

  // Function called when selfie button is pressed
  void pickHousePic() async {

    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image!= null) {
      houseFileUrl = await image.readAsBytes();
      housePicLoaded = true;
      setState(() {});
    } else {
      // User canceled the picker
    }

  }
  // Function called when selfie button is pressed
  void pickPetShelter() async {

    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image!= null) {
      petShelterFileUrl = await image.readAsBytes();
      petShelterLoaded = true;
      setState(() {});
    } else {
      // User canceled the picker
    }

  }


  void signUp(){

    //
    debugPrint("Can Sign Up....");
    MyUserModel myUser = MyUserModel(
        id: "",
        username: usernameController.text,
        password: passwordController.text,
        name: nameController.text,
        nationalId: nationalIdController.text,
        city: cityController.text,
        address: addressController.text,
        sex: sexController.text,
        selfiePic: selfieFileUrl,
        age: ageController.text,
        housePic: houseFileUrl,
        petSpacePic: petShelterFileUrl,
        hasPets: "NO");
    // Try to Sign Up
    String result = signUpF(myUser);
    // If sign up is successful
    if(result == globalSuccessMsg){
      // Re-route to Home-Page
      // Navigator.of(context).push(MaterialPageRoute(builder: ((context) => MyProfileUI())));
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: ((context)=> const HomeUI())), (route) => false);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result)),
      );
    }
  }

  // Function/Method to check if the Pictures have been uploaded
  bool checkPicturesF(){

    //
    if(selfieFileUrl != ""){
      if(houseFileUrl != ""){
        if(petShelterFileUrl != ""){
            return true;
        }
      }
    }

    //
    return false;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                  onTap: () {},
                  child: TextButton(onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: ((context)=> const loginUI())), (route) => false);
                  },child:const Text("GO TO LOGIN",style: TextStyle(color: Colors.white),))
              )
          ),
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: TextButton(onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if(checkPicturesF()){
                        signUp();
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please Upload Pictures')),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill input')),
                    );
                  }
                },child:const Text("Submit",style: TextStyle(color: Colors.white),))
              )
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
                      controller: usernameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Email"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: false,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Password"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Full Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: nationalIdController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "National Id"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your national id';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: cityController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "City"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your city';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: addressController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Address"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
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
                          return 'Please enter your gender';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: ageController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Age"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your age';
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
                          pickSelfie();
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
                          pickHousePic();
                        },
                        child: const Text('Choose House Picture'),
                      ),
                    ),
                  ),
                  housePicLoaded ? Image.memory(
                    houseFileUrl,
                  ): const SizedBox(),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          pickPetShelter();
                        },
                        child: const Text('Choose House Picture'),
                      ),
                    ),
                  ),
                  petShelterLoaded ? Image.memory(
                    petShelterFileUrl
                  ): const SizedBox(),
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}
