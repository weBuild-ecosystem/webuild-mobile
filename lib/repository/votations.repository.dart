import 'dart:convert';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:crypto/models/user.model.dart';
import 'package:crypto/repository/api.repository.dart';
import 'package:crypto/repository/entities.repository.dart';
import 'package:cache_manager/cache_manager.dart';

Future<dynamic> getUser() async {
  
    final response = await apiCallHook('user/get', {});
    if (response != null) {
      if (json.decode(response) == null) {
        DeleteCache.deleteKey('session');
        return null;
      } else {
        return json.decode(response)['votations'].
        currentUser.value = UserModel.fromJSON(
            json.decode(response) != null
                ? json.decode(response)['user']
                : '');
      }
      return null;
    }
  
  return false;
}