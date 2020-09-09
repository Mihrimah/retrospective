import 'package:flutter/material.dart';

class FakeDataModel {
  String roomCode;
  int templateType;
  String templateTitle;
  String textContent;
  int likeCount;

  FakeDataModel(this.roomCode, this.templateType, this.templateTitle,
      this.textContent, this.likeCount);

  static List<FakeDataModel> toBuilder(AsyncSnapshot snapshot) {
    return snapshot.data.documents
        .map((roomData) => FakeDataModel(
            roomData['roomCode'],
            roomData['templateType'],
            roomData['templateTitle'],
            roomData['textContent'],
            roomData['likeCount']))
        .toList().cast<FakeDataModel>();
  }
}
