import 'package:flutter/material.dart';
import 'package:petmutualaid/models/mymodels.dart';
import 'package:petmutualaid/ui/dates/services/crud_dates.dart';
import 'package:petmutualaid/ui/dates/utils/dropdown.dart';
import 'package:petmutualaid/ui/home.dart';

class AddDateUI extends StatefulWidget {
  const AddDateUI({
    super.key,
    required this.carerProfile,
    required this.day,
    required this.carerSched
    });
  ///
  final MyScheduleModel carerSched;
  ///
  final MyUserModel carerProfile;
  ///
  final int day;
  ///
  @override
  State<AddDateUI> createState() => _AddDateUIState();
}

class _AddDateUIState extends State<AddDateUI> {
  ///
  bool stuffLoaded = false;
  ///
  String textDay = "";
  ///
  List<MyPetModel> userPets = [];
  ///
  MyPetModel? dropdownValue;
  ///
  final _formKey = GlobalKey<FormState>();
  ///
  TextEditingController petDetailsController = TextEditingController();
  ///
  void getOwnerPetsF(){
    ///
    userPets = getOwnerPetsFF();
    ///
    setState(() {
      stuffLoaded = true;
      dropdownValue = userPets.first;
    });

  }
  ///
  void getDateString(){
    ///
    switch (widget.day) {
      case 1:
        textDay = "Monday";
        break;
      case 2:
        textDay = "Tuesday";
        break;
      case 3:
        textDay = "Wednesday";
        break;
      case 4:
        textDay = "Thursday";
        break;
      case 5:
        textDay = "Friday";
        break;
      case 6:
        textDay = "Saturday";
        break;
      case 7:
        textDay = "Sunday";
        break;
      default:
    }
    ///
    setState(() {
      
    });
  }
  ////
  void createDateF(){
    ///
    createDateFF(
      textDay, 
      widget.day,
      widget.carerSched, 
      dropdownValue!, 
      petDetailsController.text, 
      widget.carerProfile
      );
    ///
    Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(
        builder: (BuildContext context)=> const HomeUI()), (route) => false
        );
    ///
  }
  ////
  @override
  void initState() {
    ///
    getOwnerPetsF();
    ///
    getDateString();
    ///
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton.icon(
            onPressed: (){
              ///
              createDateF();
              ///
            }, 
            icon: const Icon(Icons.add,color: Colors.white,), 
            label: const Text("SAVE",style: TextStyle(color: Colors.white),)
            )
        ],
      ),
      body: stuffLoaded ? Column(
        children: [
          Text("Day : $textDay"),
          myPetsDropdown(),
          Text("Name : ${widget.carerProfile.name}"),
          Text("location : ${widget.carerProfile.city}, ${widget.carerProfile.address}"),
          myForm()
        ],
      ) : Column(),
    );
  }
  ///
  ///
  Widget myForm (){
    return Form(
      key: _formKey,
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: TextFormField(
          controller: petDetailsController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: "Pet Details"),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter Pet Details';
            }
            return null;
          },
          minLines: 4,
          maxLines: 8,
        ),
      ),
      );
  }
  /// Pet DropDown
  Widget myPetsDropdown(){
    return DropdownButton<MyPetModel>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (MyPetModel? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value;
        });
      },
      items: userPets.map<DropdownMenuItem<MyPetModel>>((MyPetModel value) {
        return DropdownMenuItem<MyPetModel>(
          value: value,
          child: Text(value.name),
        );
      }).toList(),
    );
  }
  ///
  ///
}