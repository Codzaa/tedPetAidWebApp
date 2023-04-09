import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:petmutualaid/models/mymodels.dart';
import 'package:petmutualaid/ui/carers/carer_schedule.dart';
import 'package:petmutualaid/ui/carers/services/crud_carers.dart';

class AvailCarersUI extends StatefulWidget {
  const AvailCarersUI({Key? key}) : super(key: key);

  @override
  State<AvailCarersUI> createState() => _AvailCarersUIState();
}

class _AvailCarersUIState extends State<AvailCarersUI> {
  ///
  List<MyUserModel> people = [];
  ///
  void getAllPipoF(){
    ///
    people = getAvailableCarersFF();
    ///
    setState(() {});
    ///
  }
  ///
  @override
  void initState() {
    ///
    getAllPipoF();
    ///
    super.initState();
    ///
  }
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Column(
          children: const [
            Center(child: Text("Available Carers")),
            Center(child: Text("Here you can find all the avaialable people who can take care of your pets")),
          ],
        ),
        backgroundColor: Colors.green,
      ),
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.64,
            child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                itemCount: people.length,
                itemBuilder: (BuildContext context,int index){
                  return GestureDetector(
                      onTap: (){
                        /// Carer Schedule
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (BuildContext context) => CarerSchedUI(carer: people[index])));
                        ///
                      },
                      child: Column(
                        children: [
                          Card(
                            child: Column(
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.album),
                                  title: const Text("Name"),
                                  subtitle: Text(people[index].name),
                                ),
                                ListTile(
                                  leading: const Icon(Icons.album),
                                  title: const Text("Address"),
                                  subtitle: Text("${people[index].city} ${people[index].address}"),
                                ),
                                Image.memory(people[index].selfiePic),
                              ],
                            ),
                          ),
  
                          
                        ],
                      ));
                }
            ),
          ),
        )
    );
  }
}

/*


*/