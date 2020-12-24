import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:retrospective/template/abstract_base_template.dart';
import 'package:retrospective/template/fourls.dart';
import 'package:retrospective/template/freeformat.dart';
import 'package:retrospective/template/lean_coffee.dart';
import 'package:retrospective/template/mad_glad_sad.dart';
import 'package:retrospective/template/sailorboat.dart';
import 'package:retrospective/template/starfish.dart';
import 'package:retrospective/template/stop_start_continue.dart';
import 'package:retrospective/template/what_went_well.dart';
import 'package:retrospective/template/wrap.dart';

class FirebaseRepository {
  final CollectionReference madsadgladCollection =
      FirebaseFirestore.instance.collection("madsadglad");

  final CollectionReference sailorboatCollection =
      FirebaseFirestore.instance.collection("sailorboat");

  final CollectionReference starfishCollection =
      FirebaseFirestore.instance.collection("starfish");

  final CollectionReference fourlsCollection =
      FirebaseFirestore.instance.collection("fourls");

  final CollectionReference stopstartcontinueCollection =
      FirebaseFirestore.instance.collection("stopstartcontinue");

  final CollectionReference whatwentwellCollection =
      FirebaseFirestore.instance.collection("whatwentwell");

  final CollectionReference leancoffeeCollection =
      FirebaseFirestore.instance.collection("leancoffee");

  final CollectionReference wrapCollection =
      FirebaseFirestore.instance.collection("wrap");

  final CollectionReference roomsCollection =
      FirebaseFirestore.instance.collection("rooms");

  final CollectionReference freeformatCollection =
  FirebaseFirestore.instance.collection("freeformat");

  Stream<QuerySnapshot> findMadsadgladByRoomCode(String roomCode) {
    return madsadgladCollection
        .where("roomCode", isEqualTo: roomCode)
        .snapshots();
  }

  Stream<DocumentSnapshot> findRoomsDetail(String roomCode) {
    return roomsCollection.doc(roomCode).snapshots();
  }

  Stream<QuerySnapshot> findStarfishByRoomCode(String roomCode) {
    return starfishCollection
        .where("roomCode", isEqualTo: roomCode)
        .snapshots();
  }

  Stream<QuerySnapshot> findSailorboatRoomCode(String roomCode) {
    return sailorboatCollection
        .where("roomCode", isEqualTo: roomCode)
        .snapshots();
  }

  Stream<QuerySnapshot> findFourlsRoomCode(String roomCode) {
    return fourlsCollection.where("roomCode", isEqualTo: roomCode).snapshots();
  }

  Stream<QuerySnapshot> findStopstartcontinueRoomCode(String roomCode) {
    return stopstartcontinueCollection
        .where("roomCode", isEqualTo: roomCode)
        .snapshots();
  }

  Stream<QuerySnapshot> findWhatwentwellRoomCode(String roomCode) {
    return whatwentwellCollection
        .where("roomCode", isEqualTo: roomCode)
        .snapshots();
  }

  Stream<QuerySnapshot> findLeancoffeeRoomCode(String roomCode) {
    return leancoffeeCollection
        .where("roomCode", isEqualTo: roomCode)
        .snapshots();
  }

  Stream<QuerySnapshot> findWrapRoomCode(String roomCode) {
    return wrapCollection.where("roomCode", isEqualTo: roomCode).snapshots();
  }

  Stream<QuerySnapshot> findFreeformatByRoomCode(String roomCode) {
    return freeformatCollection
        .where("roomCode", isEqualTo: roomCode)
        .snapshots();
  }

  Stream<QuerySnapshot> getRoomDataStream(String roomCode, int templateId) {
    Stream<QuerySnapshot> roomDataStream;
    if (templateId == 1) {
      roomDataStream = findMadsadgladByRoomCode(roomCode);
    } else if (templateId == 2) {
      roomDataStream = findStarfishByRoomCode(roomCode);
    } else if (templateId == 3) {
      roomDataStream = findSailorboatRoomCode(roomCode);
    } else if (templateId == 4) {
      roomDataStream = findFourlsRoomCode(roomCode);
    } else if (templateId == 5) {
      roomDataStream = findStopstartcontinueRoomCode(roomCode);
    } else if (templateId == 6) {
      roomDataStream = findWhatwentwellRoomCode(roomCode);
    } else if (templateId == 7) {
      roomDataStream = findLeancoffeeRoomCode(roomCode);
    } else if (templateId == 8) {
      roomDataStream = findWrapRoomCode(roomCode);
    } else if (templateId == 9) {
      roomDataStream = findFreeformatByRoomCode(roomCode);
    } else
      roomDataStream = null;
    return roomDataStream;
  }

  void createDocument(String text, String title, String code,
      AbstractBaseTemplate template) async {
    var item = {
      'roomCode': code,
      'templateType': template.getTemplateTypeId(),
      'templateTitle': title,
      'textContent': text,
      'likeCount': 0,
      'retroDate': DateTime.now()
    };
    if (template is MadGladSad) {
      await madsadgladCollection.add(item);
    } else if (template is Starfish) {
      await starfishCollection.add(item);
    } else if (template is Sailorboat) {
      await sailorboatCollection.add(item);
    } else if (template is FourLs) {
      await fourlsCollection.add(item);
    } else if (template is StopStartContinue) {
      await stopstartcontinueCollection.add(item);
    } else if (template is WhatWentWell) {
      await whatwentwellCollection.add(item);
    } else if (template is LeanCoffee) {
      await leancoffeeCollection.add(item);
    } else if (template is WrapTechnique) {
      await wrapCollection.add(item);
    } else if (template is FreeFormat) {
      await freeformatCollection.add(item);
    } else {
      throw new Exception("There is no template collection");
    }
  }

  void createRoomDetail(String roomCode, int templateId) async {
    roomsCollection
        .doc(roomCode)
        .set({
          'activeMember': 0,
          'templateType': templateId,
          'createDate': DateTime.now()
        })
        .then((value) => print("room detail added"))
        .catchError((error) => print("Failed to add room detail: $error"));
  }

  increaseActiveMember(String roomCode) async {
    DocumentReference documentReference = roomsCollection.doc(roomCode);
    return FirebaseFirestore.instance
        .runTransaction((transaction) async {
          // Get the document
          DocumentSnapshot snapshot = await transaction.get(documentReference);

          if (!snapshot.exists) {
            throw Exception("room detail document Not Found");
          }
          int newFollowerCount = snapshot.data()['activeMember'] + 1;
          transaction
              .update(documentReference, {'activeMember': newFollowerCount});
          return newFollowerCount;
        })
        .then((value) => print("Active Member count updated to $value"))
        .catchError((error) => print("Failed to update Active Member: $error"));
  }

  decreaseActiveMember(String roomCode) async {
    DocumentReference documentReference = roomsCollection.doc(roomCode);
    return FirebaseFirestore.instance
        .runTransaction((transaction) async {
          // Get the document
          DocumentSnapshot snapshot = await transaction.get(documentReference);

          if (!snapshot.exists) {
            throw Exception("room detail document Not Found");
          }
          int newFollowerCount = snapshot.data()['activeMember'] - 1;
          transaction
              .update(documentReference, {'activeMember': newFollowerCount});
          return newFollowerCount;
        })
        .then((value) => print("Active Member count updated to $value"))
        .catchError((error) => print("Failed to update Active Member: $error"));
  }
}
