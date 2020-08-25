import 'package:flutter/material.dart';
import 'package:retrospektif/model/fake_data_model.dart';
import 'package:retrospektif/repository/fake_repository.dart';

class GroupedListView extends StatelessWidget {
  final FakeRepository fakeRepository = FakeRepository();

  // we need to implement grouped list implementation.

  @override
  Widget build(BuildContext context) {
    List<FakeDataModel> list = fakeRepository.generateData();
    print("list len : " +list.length.toString());

    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            print("list index : " + list[index].text);
            return Row(children: [
              Text(list[index].text),
            ]);
          },
        ));
  }
}
