import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

typedef G GroupFunction<T, G>(T element);
typedef Widget ListBuilderFunction<T>(BuildContext context, T element);
typedef Widget GroupBuilderFunction<G>(BuildContext context, G group);

class GroupedListView<T, G> extends StatelessWidget {
  GroupedListView(
      {@required this.list,
      @required this.groupBy,
      this.listBuilder,
      this.groupBuilder}) {
    _list = viewListBuilder(list);
  }

  final GroupFunction<T, G> groupBy;
  final ListBuilderFunction<T> listBuilder;
  final GroupBuilderFunction<G> groupBuilder;
  final List<T> list;
  List<dynamic> _list = List();

  List viewListBuilder(List<T> collection) {
    final Map<G, List<T>> groupedMap = HashMap();
    final List orderList = List();

    for (T element in collection) {
      var key = groupBy(element);
      if (groupedMap.containsKey(key)) {
        List copyList = new List<T>.from(groupedMap[key])..add(element);
        groupedMap[key] = copyList;
      } else {
        groupedMap.putIfAbsent(key, () => [element]);
      }
    }
    groupedMap.forEach((key, value) {
      orderList.add(key);
      orderList.addAll(value);
    });
    return orderList;
  }

  // show widget
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _list.length,
      itemBuilder: (context, index) {
        var element = _list[index];
        if (element is T) {
          return listBuilder(context, element);
        }
        return groupBuilder(context, element);
      },
    );
  }
}
