// ignore_for_file: non_constant_identifier_names



class VotationModel {
  late int id = 0;
  late String image;
  late String title;
  late String description;
  late List<String> options;
  late String timeStart;
  late String timeEnd;
  late List<VoteModel> votes;
  late String from_id;
  VotationModel();
  VotationModel.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'] ?? 0;
      
      image = jsonMap['image'] ?? '';
      title = jsonMap['title'] ?? '';
      description = jsonMap['description'] ?? '';
      options = List<String>.from(jsonMap['options'] ?? []);
      List<dynamic> rss = jsonMap['votes'] ?? [];
      votes = [...rss.map((e) => VoteModel.fromJSON(e))];
      timeStart = jsonMap['timeStart'] ?? '';
      timeEnd = jsonMap['timeEnd'] ?? '';
      from_id = jsonMap['from_id'] ?? '';

    } catch (value) {}
  }
}

class VoteModel {
  late String from_id;
  late String value;
  VoteModel();
  VoteModel.fromJSON(Map<String, dynamic> jsonMap) {
    try {

      from_id = jsonMap['from_id'] ?? '';
      value = jsonMap['value'] ?? '';
      

    } catch (value) {}
  }
}