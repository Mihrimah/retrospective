import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseRepository {
  final CollectionReference madsadgladCollection =
      Firestore.instance.collection("madsadglad");

  final CollectionReference sailorboatCollection =
      Firestore.instance.collection("sailorboat");

  final CollectionReference starfishCollection =
      Firestore.instance.collection("starfish");

  Stream<QuerySnapshot> findMadsadgladByRoomCode(String roomCode) {
    return madsadgladCollection
        .where("roomCode", isEqualTo: roomCode)
        .snapshots();
  }

  Stream<QuerySnapshot> findStarfishByRoomCode(String roomCode) {
    return madsadgladCollection
        .where("roomCode", isEqualTo: roomCode)
        .snapshots();
  }

  Stream<QuerySnapshot> getRoomDataStream(String roomCode, int templateId) {
    Stream<QuerySnapshot> roomDataStream;
    if (templateId == 1) {
      roomDataStream = findMadsadgladByRoomCode(roomCode);
    } else if (templateId == 2) {
      roomDataStream = findStarfishByRoomCode(roomCode);
    } else
      roomDataStream = null;
    return roomDataStream;
  }
}
