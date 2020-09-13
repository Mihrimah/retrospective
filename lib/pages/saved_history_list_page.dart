import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retrospektive/localization/retrospective_localization.dart';
import 'package:retrospektive/pages/saved_history_detail_page.dart';
import 'package:retrospektive/pages/waiting_content_page.dart';
import 'package:retrospektive/repository/local_repository.dart';
import 'package:retrospektive/template/abstract_base_template.dart';
import 'package:retrospektive/template/fourls.dart';
import 'package:retrospektive/template/lean_coffee.dart';
import 'package:retrospektive/template/mad_glad_sad.dart';
import 'package:retrospektive/template/sailorboat.dart';
import 'package:retrospektive/template/starfish.dart';
import 'package:retrospektive/template/stop_start_continue.dart';
import 'package:retrospektive/template/what_went_well.dart';
import 'package:retrospektive/template/wrap.dart';

class SavedHistoryListPage extends StatefulWidget {
  @override
  _SavedHistoryPageState createState() => _SavedHistoryPageState();
}

class _SavedHistoryPageState extends State<SavedHistoryListPage> {
  Set<String> list;
  LocalRepository _localRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          RetrospectiveLocalization.of(context).historyList,
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: FutureBuilder(
          future: retrieveSavedData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return buildWaitingScreen();
            if (snapshot.data.length == 0) return WaitingContentPage();
            List listRetro = HashSet.of(snapshot.data).toList();
            return ListView.builder(
              itemCount: listRetro.length,
              itemBuilder: (context, index) {
                AbstractBaseTemplate template =
                    _parseRoomCode(listRetro[index]);
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SavedHistoryDetailPage(
                              listRetro[index].toString(),
                              _localRepository,
                              template)),
                    );
                    print("on tap!!!!");
                  },
                  title: Text(listRetro[index].toString()),
                  subtitle: Text(template.getTemplateName()),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteSavedData(listRetro[index]);
                      setState(() {});
                    },
                  ),
                );
              },
            );
          }),
    );
  }

  @override
  void initState() {
    _localRepository = LocalRepository();
    super.initState();
  }

  Future<Set<String>> retrieveSavedData() async {
    return await _localRepository.getSavedAllDataFromStorage();
  }

  void deleteSavedData(String roomCode) async {
    return _localRepository.deleteRoomData(roomCode);
  }

  Widget buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  AbstractBaseTemplate _parseRoomCode(String roomCode) {
    int firstNumber = int.parse(roomCode.substring(0, 1));
    if (firstNumber == 1)
      return MadGladSad();
    else if (firstNumber == 2)
      return Starfish();
    else if (firstNumber == 3)
      return Sailorboat();
    else if (firstNumber == 4)
      return FourLs();
    else if (firstNumber == 5)
      return StopStartContinue();
    else if (firstNumber == 6)
      return WhatWentWell();
    else if (firstNumber == 7)
      return LeanCoffee();
    else if (firstNumber == 8)
      return WrapTechnique();
    else
      return MadGladSad();
  }
}
