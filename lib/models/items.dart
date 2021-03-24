import 'package:riot_api/models/champion.dart';

class Item {
  String _id;
  String _name;
  String _description;
  String _colloq;
  String _plaintext;
  List<String> _into;
  RiotImage _image;
  _Gold _gold;
  List<String> _tags;
  _Maps _maps;
  Map _stats;

  String get id => _id;
  String get name => _name;
  String get description => _description;
  String get colloq => _colloq;
  String get plaintext => _plaintext;
  List<String> get into => _into;
  RiotImage get image => _image;
  _Gold get gold => _gold;
  List<String> get tags => _tags;
  _Maps get maps => _maps;
  Map get stats => _stats;

  Item(String id, Map<String, dynamic> itemData) {
    _id = id;

    _name = itemData['name'];
    _description = itemData['description'];
    _colloq = itemData['colloq'];
    _plaintext = itemData['plaintext'];
    _into = List.from(itemData['into']);
    _image = RiotImage(Map.from(itemData['image']));
    _gold = _Gold(itemData['gold']);
    _tags = List.from(itemData['tags']);
    _maps = _Maps(Map.from(itemData['maps']));
    _stats = Map.from(itemData['stats']);
  }
}

class _Maps {
  bool _map11;
  bool _map12;
  bool _map21;
  bool _map22;

  bool get map11 => _map11;
  bool get map12 => _map12;
  bool get map21 => _map21;
  bool get map22 => _map22;

  _Maps(Map<String, bool> mapsData) {
    _map11 = mapsData['11'];
    _map12 = mapsData['12'];
    _map21 = mapsData['21'];
    _map22 = mapsData['22'];
  }
}

class _Stats {
  int flatMovementSpeedMod;
}

class _Gold {
  int _base;
  bool _purchasable;
  int _total;
  int _sell;

  int get base => _base;
  bool get purchasable => _purchasable;
  int get total => _total;
  int get sell => _sell;

  _Gold(Map<String, dynamic> goldData) {
    _base = goldData['base'];
    _purchasable = goldData['purchasable'];
    _total = goldData['total'];
    _sell = goldData['sell'];
  }
}
