import 'dart:io';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class signUpUI extends StatefulWidget {
  const signUpUI({Key? key}) : super(key: key);

  @override
  State<signUpUI> createState() => _signUpUIState();
}

class _signUpUIState extends State<signUpUI> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  //
  late String selfieFileUrl;

  //
  late String houseFileUrl;

  //
  late String petShelterFileUrl;

  //
  bool selfieLoaded = false;
  bool housePicLoaded = false ;
  bool petShelterLoaded = false;

  // Function called when selfie button is pressed
  void pickSelfie() async {

    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image!= null) {
      selfieFileUrl = image.path;
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
      houseFileUrl = image.path;
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
      petShelterFileUrl = image.path;
      petShelterLoaded = true;
      setState(() {});
    } else {
      // User canceled the picker
    }

  }


  void signUp(){

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
                    if (_formKey.currentState!.validate()) {
                      // Navigate the user to the Home page
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
                      controller: emailController,
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
                      obscureText: true,
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
                  selfieLoaded ? Image.network(
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
                  housePicLoaded ? Image.network(
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
                  petShelterLoaded ? Image.network(
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
