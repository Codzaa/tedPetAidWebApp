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
  TextEditingController selfiePicController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController housePicController = TextEditingController();
  TextEditingController petShelterPicController = TextEditingController();

  //
  late String selfieFileUrl;

  //
  late List<File> housePicFiles;

  //
  bool imagesLoaded = false;

  void pickSelfie() async {

    final image = await ImagePicker().pickImage(source: ImageSource.gallery);


    if (image!= null) {
      selfieFileUrl = image.path;
      imagesLoaded = true;
      setState(() {});
    } else {
      // User canceled the picker
    }



  }

  //
  void pickHousePics() async{

    //
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.image
    );

    //
    if (result != null) {
      housePicFiles = result.paths.map((path) => File(path!)).toList();
    } else {
      // User canceled the picker
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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

                  imagesLoaded ? Image.network(
                      selfieFileUrl,
                  ): const SizedBox()

                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}
