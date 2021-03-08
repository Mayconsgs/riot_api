import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:riot_api/models/champion.dart';

class DataDragonApi extends GetxController {
  final String _domain = 'ddragon.leagueoflegends.com';

  String _version;
  String _language = 'pt_BR';

  final _championsList = List<ChampionListItem>.empty(growable: true);

  List<ChampionListItem> get listChampions => _championsList;

  String get version => _version;

  ChampionListItem getChampionListItem(int index) {
    return _championsList[index];
  }

  Future<String> getVersion() async {
    final response = await http.get(
      Uri.http(_domain, "/api/versions.json"),
    );

    final listVersions = List<String>.from(json.decode(response.body));

    _version = listVersions[0];

    return _version;
  }

  Future<void> getAllChampions() async {
    final response = await http.get(
      Uri.http(_domain,
          '/cdn/' + _version + '/data/' + _language + '/champion.json'),
    );

    final body = Map<String, dynamic>.from(json.decode(response.body));

    Map.from(body['data']).forEach((key, value) {
      final champion = new ChampionListItem.fromJson(value);
      _championsList.add(champion);
    });
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
