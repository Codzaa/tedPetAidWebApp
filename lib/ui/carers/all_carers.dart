import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:petmutualaid/models/mymodels.dart';
import 'package:petmutualaid/ui/carers/services/crud_carers.dart';

class AllCarersUI extends StatefulWidget {
  const AllCarersUI({Key? key}) : super(key: key);

  @override
  State<AllCarersUI> createState() => _AllCarersUIState();
}

class _AllCarersUIState extends State<AllCarersUI> {
  ///
  List<MyUserModel> people = [];
  ///
  void getAllPipoF(){
    ///
    people = getAllCarersFF();
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
        body: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            itemCount: people.length,
            itemBuilder: (BuildContext context,int index){
              return GestureDetector(
                  onTap: (){},
                  child: Image.memory(people[index].selfiePic));
            }
        )
    );
  }
}
