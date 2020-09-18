import 'package:flutter/material.dart';
import 'package:retrospective/localization/retrospective_localization.dart';

class WaitingContentPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(RetrospectiveLocalization.of(context).nocontent, style: TextStyle(fontSize: 25),));
  }
}