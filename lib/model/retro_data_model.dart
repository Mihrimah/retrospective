import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RetroDataModel {
  String roomCode;
  int templateType;
  String templateTitle;
  String textContent;
  int likeCount;
  QueryDocumentSnapshot document;

  RetroDataModel(this.roomCode, this.templateType, this.templateTitle,
      this.textContent, this.likeCount, this.document);

  static List<RetroDataModel> toBuilder(AsyncSnapshot snapshot) {
    return snapshot.data.documents
        .map((roomData) => RetroDataModel(
            roomData.data()['roomCode'],
            roomData.data()['templateType'],
            roomData.data()['templateTitle'],
            roomData.data()['textContent'],
            roomData.data()['likeCount'],
            roomData))
        .toList()
        .cast<RetroDataModel>();
  }

  Map toJson() => {
        'roomCode': roomCode,
        'templateType': templateType,
        'templateTitle': templateTitle,
        'textContent': textContent,
        'likeCount': likeCount
      };

  static fromJson(json) => RetroDataModel(json["roomCode"], json["templateType"],
      json["templateTitle"], json["textContent"], json["likeCount"], null);
}
