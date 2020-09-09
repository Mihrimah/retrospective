import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:retrospektive/template/abstract_base_template.dart';
import 'package:retrospektive/template/mad_glad_sad.dart';
import 'package:retrospektive/template/starfish.dart';

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
    return starfishCollection
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

  void createDocument(String text, String title, String code,
      AbstractBaseTemplate template) async {
    var item = {
      'roomCode': code,
      'templateType': template.getTemplateTypeId(),
      'templateTitle': title,
      'textContent': text,
      'likeCount': 0
    };
    if (template is MadGladSad) {
      await madsadgladCollection.add(item);
    } else if (template is Starfish) {
      await starfishCollection.add(item);
    } else {
      throw new Exception("There is no template collection");
    }
  }
}
