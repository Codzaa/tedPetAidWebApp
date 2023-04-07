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
        appBar: AppBar() ,
        body: MasonryGridView.count(
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
                      Text(people[index].name),
                      Image.memory(people[index].selfiePic),
                    ],
                  ));
            }
        )
    );
  }
}

/*


*/