import 'package:flutter/material.dart';
import 'package:retrospektif/core/grouped_list_view.dart';
import 'package:retrospektif/model/fake_data_model.dart';
import 'package:retrospektif/repository/fake_repository.dart';

class RetroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GroupedListView(
          groupBy: (FakeDataModel t) => t.title,
          groupBuilder:(BuildContext context, String title) => Text(title, style: TextStyle(fontSize:25),) ,
          listBuilder: (BuildContext context, FakeDataModel t) => Text(t.text, style: TextStyle(fontSize:15),) ,
          list: FakeRepository().generateData(),
        ));
  }
}
