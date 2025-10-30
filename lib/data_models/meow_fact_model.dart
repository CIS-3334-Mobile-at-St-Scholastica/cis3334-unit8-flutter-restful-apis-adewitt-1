// To parse this JSON data, do
//
//     final meowFacts = meowFactsFromJson(jsonString);

import 'dart:convert';

MeowFacts meowFactsFromJson(String str) => MeowFacts.fromJson(json.decode(str));

String meowFactsToJson(MeowFacts data) => json.encode(data.toJson());

class MeowFacts {
  List<String> data;

  MeowFacts({
    required this.data,
  });

  factory MeowFacts.fromJson(Map<String, dynamic> json) => MeowFacts(
    data: List<String>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}
