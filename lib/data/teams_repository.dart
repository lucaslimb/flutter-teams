import 'dart:convert';

import 'package:favorite_team/model/team.dart';
import 'package:flutter/services.dart';

class TeamsRepository {
  final String assetPath;
  TeamsRepository({this.assetPath = 'assets/data/teams.json'});
  Future<List<Team>> load() async {
    final jsonStr = await rootBundle.loadString(assetPath);
    final list = jsonDecode(jsonStr) as List;
    return list
        .map((e) => Team.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
}
