import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:crypto/models/votations.model.dart';
import 'package:crypto/repository/api.repository.dart';


Future<dynamic> getVotations(String from_id) async {
    final response = await apiCallHook('votations/get', {'from_id': from_id});
    if (response != null) {
      if (json.decode(response) == null) {
        return null;
      } else {

        List<dynamic> votationCast = json.decode(response)['votations'] ?? [];
        List<VotationModel> dynamicVotations = [];
        if(votationCast.isNotEmpty){
          for(var i = 0; i<votationCast.length; i++){
            dynamicVotations.add(VotationModel.fromJSON(votationCast[i]));
          }
        }
        currentVotations.value = dynamicVotations.map((e) => e).toList();
      }
    }
  
  return null;
}

Future<dynamic> addVoteVotation(String from_id, String id, int vote) async {
  final response = await apiCallHook('votations/updatevotes', {'from_id': from_id, 'id': id, 'vote': vote});
  if (response != null) {
      if (json.decode(response) == null) {
        return false;
      } else {
        return true;
      }
  }
  return false;
}