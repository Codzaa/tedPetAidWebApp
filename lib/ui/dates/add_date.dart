import 'package:flutter/material.dart';
import 'package:petmutualaid/models/mymodels.dart';

class AddDateUI extends StatefulWidget {
  const AddDateUI({
    super.key,
    required this.carerSched
    });
  ///
  final MyScheduleModel carerSched;
  ///
  @override
  State<AddDateUI> createState() => _AddDateUIState();
}

class _AddDateUIState extends State<AddDateUI> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(),
    );
  }
}