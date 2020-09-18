import 'dart:convert';

import 'package:retrospective/model/retro_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository {
  addRoomDataToStorage(String roomCode, List<RetroDataModel> list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(roomCode, jsonEncode(list));
  }

  Future<List<RetroDataModel>> getRoomDataFromStorage(String roomCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<RetroDataModel> list = jsonDecode(prefs.getString(roomCode))
        .map((m) => RetroDataModel.fromJson(m))
        .toList().cast<RetroDataModel>();
    return list;
  }

  Future<Set<String>> getSavedAllDataFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getKeys();
  }

  Future<int> getNumberOfSavedRecord() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getKeys().length;
  }

  void deleteRoomData(String roomCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(roomCode);
  }
}
