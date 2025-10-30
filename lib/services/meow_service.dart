import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data_models/meow_fact_model.dart';

/// Downloads sample meow facts and parses it to a Meow Fact model.
Future<MeowFacts> fetchMeowFacts() async {
  final uri = Uri.parse('https://meowfacts.herokuapp.com/?count=3');
  final resp = await http.get(uri);

  if (resp.statusCode != 200) {
    throw Exception('Meow Facts API ${resp.statusCode}');
  }
  final map = jsonDecode(resp.body) as Map<String, dynamic>;
  return MeowFacts.fromJson(map);
}