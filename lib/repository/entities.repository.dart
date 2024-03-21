import 'dart:convert';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:crypto/models/user.model.dart';
import 'package:crypto/repository/api.repository.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:cache_manager/cache_manager.dart';

Future<bool> getEntitie(String id) async {
  var session = await ReadCache.getString(key: 'session') ?? '';
  if (session != '') {
    final response = await apiCallHook('post', 'entities/get', {}, {'id': id});
    if (response != null) {
      if (json.decode(response) == null) {
        return false;
      } else {
        currentUser.value = UserModel.fromJSON(
            json.decode(response) != null
                ? json.decode(response)['entitie']
                : '');
      }
      return true;
    }
  }
  return false;
}

Future<bool> getMyEntities(List<String> entities) async {
  var session = await ReadCache.getString(key: 'session') ?? '';
  if (session != '') {
    final response = await apiCallHook('post', 'entities/getmyentities', {}, {'entities': entities});
    if (response != null) {
      if (json.decode(response) == null) {
        return false;
      } else {
        currentUser.value = UserModel.fromJSON(
            json.decode(response) != null
                ? json.decode(response)['entities']
                : '');
      }
      return true;
    }
  }
  return false;
}