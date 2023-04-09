import 'package:flutter/material.dart';
import 'package:petmutualaid/models/mymodels.dart';
import 'package:petmutualaid/ui/dates/services/crud_dates.dart';

class HomeDatesUI extends StatefulWidget {
  const HomeDatesUI({super.key});

  @override
  State<HomeDatesUI> createState() => _HomeDatesUIState();
}


class _HomeDatesUIState extends State<HomeDatesUI> {
  ///
  List<MyDateModel> myDates = [];
  ///
  @override
  void initState() {
    ///
    getHomeDatesF();
    ///
    super.initState();
    ///
  }
  ///
  getHomeDatesF(){
    ///
    myDates = getHomeDatesFF();
    ///
    setState(() {
      
    });
  }
  ///
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: ListView.builder(
          itemCount: myDates.length,
          itemBuilder: (BuildContext context, index){
            return Card(
              child: Column(
                children: [
                  ListTile(
                      leading: const Icon(Icons.album),
                      title: const Text("Day"),
                      subtitle: Text(myDates[index].day),
                    ),
                  ListTile(
                      leading: const Icon(Icons.album),
                      title: const Text("Pet Name"),
                      subtitle: Text(myDates[index].petName),
                    ),
                  ListTile(
                      leading: const Icon(Icons.album),
                      title: const Text("Day"),
                      subtitle: Text(myDates[index].ownerUsername),
                    ),
                  ListTile(
                      leading: const Icon(Icons.album),
                      title: const Text("Day"),
                      subtitle: Text(myDates[index].location),
                    ),
                  ListTile(
                      leading: const Icon(Icons.album),
                      title: const Text("Pet Details"),
                      subtitle: Text(myDates[index].petDetails),
                    ),
                ],
              ),
            );
        }),
      ),
    );
  }
}