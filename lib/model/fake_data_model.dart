import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FakeDataModel {
  String roomCode;
  int templateType;
  String templateTitle;
  String textContent;
  int likeCount;
  DocumentSnapshot document;

  FakeDataModel(this.roomCode, this.templateType, this.templateTitle,
      this.textContent, this.likeCount, this.document);

  static List<FakeDataModel> toBuilder(AsyncSnapshot snapshot) {
    return snapshot.data.documents
        .map((roomData) => FakeDataModel(
            roomData['roomCode'],
            roomData['templateType'],
            roomData['templateTitle'],
            roomData['textContent'],
            roomData['likeCount'],
            roomData))
        .toList().cast<FakeDataModel>();
  }
}
