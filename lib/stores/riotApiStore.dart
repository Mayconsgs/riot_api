import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:riot_api/models/champion.dart';
import 'package:riot_api/models/items.dart';

class DataDragonApi extends GetxController {
  final String _domain = 'ddragon.leagueoflegends.com';

  String _version;
  String _language = 'pt_BR';

  final _championsList = List<ChampionListItem>.empty(growable: true);
  final _itemsList = List<Item>.empty(growable: true);

  String get version => _version;

  List<ChampionListItem> get listChampions => _championsList;
  List<Item> get itemsList => _itemsList;

  ChampionListItem getChampionListItem(int index) {
    return _championsList[index];
  }

  Future<String> getInitialData() async {
    final responseVersion =
        await http.get(Uri.https(_domain, "/api/versions.json"));

    final listVersions = List<String>.from(json.decode(responseVersion.body));

    _version = listVersions[0];

    // final responseItems = await http
    //     .get(Uri.http(_domain, "/cdn/$_version/data/$_language/item.json"));

    // final listItems =
    //     Map<String, dynamic>.from(json.decode(responseItems.body));

    // Map<String, Map<String, dynamic>>.from(listItems['data'])
    //     .forEach((key, value) {
    //   _itemsList.add(Item(key, value));
    // });

    return _version;
  }

  Future<void> getAllChampions() async {
    final response = await http.get(
      Uri.http(_domain,
          '/cdn/' + _version + '/data/' + _language + '/champion.json'),
    );

    final body = utf8.decode(response.bodyBytes);

    final bodyMap = Map<String, dynamic>.from(json.decode(body));

    Map.from(bodyMap['data']).forEach((key, value) {
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

    final body = utf8.decode(response.bodyBytes);

    final bodyMap = Map<String, dynamic>.from(json.decode(body));

    Champion champion;

    Map.from(bodyMap['data']).forEach((key, value) {
      champion = Champion.fromJson(value);
    });

    return champion;
  }
}
