import 'dart:convert';
import 'dart:io';
import 'package:crypto/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
final dio = Dio();
Future<String?> apiCallHook(String type, String uri, Map useHeaders, Object useBody) async {
  final client = http.Client();
  final response;
  if(uri == 'post'){
   response = await client.post(Uri.parse('$baseUrl/$uri'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        "authorization": authorizationKey,
      },
      body: json.encode(useBody));
  } else response = await client.get(Uri.parse('$baseUrl/$uri'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        "authorization": authorizationKey,
        ...useHeaders
  });
  print(response);
  if (response.statusCode == 202) {
    
    return response.body;
  }
  return null;
}