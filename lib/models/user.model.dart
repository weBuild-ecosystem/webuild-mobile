// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';

enum UserState { available, away, busy }

ValueNotifier<UserModel> currentUser = ValueNotifier(UserModel());

class UserModel {
  late int id = 0;
  late String fullname = '';
  late String email = '';
  late String password = '';
  late String nie = '';
  late List<String> entities = [];
  
//  String role;

  UserModel();

  UserModel.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'] ?? 0;
      
      fullname = jsonMap['fullname'] ?? 'Complete';
      email = jsonMap['email'] ?? '';
      password = jsonMap['password'] ?? '';
      nie = jsonMap['nie'] ?? '';
      entities = jsonMap['entities'] ?? [];
    } catch (value) {}
  }
}

