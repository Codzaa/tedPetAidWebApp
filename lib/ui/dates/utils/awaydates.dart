import 'package:flutter/material.dart';
import 'package:petmutualaid/models/mymodels.dart';
import 'package:petmutualaid/ui/dates/services/crud_dates.dart';

class AwayDatesUI extends StatefulWidget {
  const AwayDatesUI({super.key});

  @override
  State<AwayDatesUI> createState() => _AwayDatesUIState();
}

class _AwayDatesUIState extends State<AwayDatesUI> {
  ///
  List<MyDateModel> myDates = [];
  ///
  @override
  void initState() {
    ///
    getAwayDatesF();
    ///
    super.initState();
    ///
  }
  ///
  getAwayDatesF(){
    ///
    myDates = getAwayDatesFF();
    ///
    setState(() {
      
    });
  }
  ///
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.8,
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
                          title: const Text("Carer Name"),
                          subtitle: Text(myDates[index].carerUsername),
                        ),
                      ListTile(
                          leading: const Icon(Icons.album),
                          title: const Text("Location"),
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