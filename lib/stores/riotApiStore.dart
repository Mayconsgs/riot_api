import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:riot_api/models/champion.dart';

class DataDragonApi extends GetxController {
  final String _domain = 'ddragon.leagueoflegends.com';
  String _version;
  String _language = 'pt_BR';

  set setVersion(String value) {
    _version = value;
  }

  String get getVersion => _version;

  Future<List<ChampionListItem>> getAllChampions() async {
    final response = await http.get(
      Uri.http(_domain,
          '/cdn/' + _version + '/data/' + _language + '/champion.json'),
    );

    final body = Map<String, dynamic>.from(json.decode(response.body));

    final List<ChampionListItem> championsList =
        List<ChampionListItem>.empty(growable: true);

    Map.from(body['data']).forEach((key, value) {
      final champion = new ChampionListItem.fromJson(value);
      championsList.add(champion);
    });

    return championsList;
  }

  Future<Champion> getChampion(String championId) async {
    final response = await http.get(Uri.http(
        _domain,
        '/cdn/' +
            _version +
            '/data/' +
            _language +
            '/champion/' +
            championId +
            '.json'));

    final body = Map<String, dynamic>.from(json.decode(response.body));

    Champion champion;

    Map.from(body['data']).forEach((key, value) {
      champion = Champion.fromJson(value);
    });

    return champion;
  }
}
