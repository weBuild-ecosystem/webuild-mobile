// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';

enum UserState { available, away, busy }

ValueNotifier<List<EntitieModel>> currentEntities = ValueNotifier(<EntitieModel>[]);

class EntitieModel {
  late int id = 0;
  late String image = '';
  late String title = '';
  late String description = '';
  late List<String> options = [];
  late String timeStart = '';
  late String timeEnd = '';
  late List<VoteModel> votes = [];

  
//  String role;

  EntitieModel();

  EntitieModel.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'] ?? 0;
      
      image = jsonMap['image'] ?? '';
      title = jsonMap['title'] ?? 'Complete';
      description = jsonMap['description'] ?? 'Complete';
      options = jsonMap['options'] ?? [];
    } catch (value) {}
  }
}




class VoteModel {
  late String from_id = '';
  late String value = '';
  
//  String role;

  VoteModel();

  VoteModel.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      
      from_id = jsonMap['from_id'] ?? '';
      value = jsonMap['value'] ?? '';
    } catch (value) {}
  }
}
