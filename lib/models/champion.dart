import 'package:get/get.dart';
import 'package:riot_api/stores/riotApiStore.dart';

class _Champion {
  String _id;
  String _key;
  String _name;
  String _title;
  String _blurb;

  _Info _info;
  _Image _image;

  List<String> _tags;
  String _partype;
  _Stats _stats;

  String get id => _id;
  String get key => _key;
  String get name => _name;
  String get title => _title;
  String get blurb => _blurb;

  _Info get info => _info;
  _Image get image => _image;

  List<String> get tags => _tags;
  String get partype => _partype;
  _Stats get stats => _stats;

  _Champion.championFromJson(Map<String, dynamic> champion) {
    _id = champion['id'];
    _key = champion['key'];
    _name = champion['name'];
    _title = champion['title'];
    _blurb = champion['blurb'];

    _info = _Info(Map.from(champion['info']));
    _image = _Image(champion['image']);

    _tags = List.from(champion['tags']);
    _partype = champion['partype'];
    _stats = _Stats(champion['stats']);
  }
}

class _Stats {
  var _hp;
  var _hpperlevel;
  var _mp;
  var _mpperlevel;
  var _movespeed;
  var _armor;
  var _armorperlevel;
  var _spellblock;
  var _spellblockperlevel;
  var _attackrange;
  var _hpregen;
  var _hpregenperlevel;
  var _mpregen;
  var _mpregenperlevel;
  var _crit;
  var _critperlevel;
  var _attackdamage;
  var _attackdamageperlevel;
  var _attackspeedperlevel;
  var _attackspeed;

  get hp => _hp;
  get hpperlevel => _hpperlevel;
  get mp => _mp;
  get mpperlevel => _mpperlevel;
  get movespeed => _movespeed;
  get armor => _armor;
  get armorperlevel => _armorperlevel;
  get spellblock => _spellblock;
  get spellblockperlevel => _spellblockperlevel;
  get attackrange => _attackrange;
  get hpregen => _hpregen;
  get hpregenperlevel => _hpregenperlevel;
  get mpregen => _mpregen;
  get mpregenperlevel => _mpregenperlevel;
  get crit => _crit;
  get critperlevel => _critperlevel;
  get attackdamage => _attackdamage;
  get attackdamageperlevel => _attackdamageperlevel;
  get attackspeedperlevel => _attackspeedperlevel;
  get attackspeed => _attackspeed;

  _Stats(Map<String, dynamic> statsData) {
    _hp = statsData['hp'];
    _hpperlevel = statsData['hpperlevel'];
    _mp = statsData['mp'];
    _mpperlevel = statsData['mpperlevel'];
    _movespeed = statsData['movespeed'];
    _armor = statsData['armor'];
    _armorperlevel = statsData['armorperlevel'];
    _spellblock = statsData['spellblock'];
    _spellblockperlevel = statsData['spellblockperlevel'];
    _attackrange = statsData['attackrange'];
    _hpregen = statsData['hpregen'];
    _hpregenperlevel = statsData['hpregenperlevel'];
    _mpregen = statsData['mpregen'];
    _mpregenperlevel = statsData['mpregenperlevel'];
    _crit = statsData['crit'];
    _critperlevel = statsData['critperlevel'];
    _attackdamage = statsData['attackdamage'];
    _attackdamageperlevel = statsData['attackdamageperlevel'];
    _attackspeedperlevel = statsData['attackspeedperlevel'];
    _attackspeed = statsData['attackspeed'];
  }
}

class _Info {
  int _attack;
  int _defense;
  int _magic;
  int _difficulty;

  int get attack => _attack;
  int get defense => _defense;
  int get magic => _magic;
  int get difficulty => _difficulty;

  _Info(Map<String, int> infoData) {
    _attack = infoData['attack'];
    _defense = infoData['defense'];
    _magic = infoData['magic'];
    _difficulty = infoData['difficulty'];
  }
}

class _Skin {
  String _id;
  int _num;
  String _name;
  bool _chromas;

  String get id => _id;
  int get num => _num;
  String get name => _name;
  bool get chromas => _chromas;

  _Skin(Map<String, dynamic> skinData) {
    _id = skinData['id'];
    _num = skinData['num'];
    _name = skinData['name'];
    _chromas = skinData['chromas'];
  }
}

class _Image {
  String _full;
  String _sprite;
  String _group;
  int _x;
  int _y;
  int _w;
  int _h;

  String get full => _full;
  String get sprite => _sprite;
  String get group => _group;
  int get x => _x;
  int get y => _y;
  int get w => _w;
  int get h => _h;

  _Image(Map<String, dynamic> championImageData) {
    _full = championImageData['full'];
    _sprite = championImageData['sprite'];
    _group = championImageData['group'];
    _x = championImageData['x'];
    _y = championImageData['y'];
    _w = championImageData['w'];
    _h = championImageData['h'];
  }
}

class _Passive {
  String _name;
  String _description;
  _Image _image;

  String get name => _name;
  String get description => _description;
  _Image get image => _image;

  _Passive(Map<String, dynamic> passiveData) {
    _name = passiveData['name'];
    _description = passiveData['description'];
    _image = _Image(passiveData['image']);
  }
}

class _Spell {
  String _id;
  String _name;
  String _description;

  String _tooltip;
  _LevelTip _leveltip;
  int _maxrank;

  List _cooldown;
  String _cooldownBurn;

  List<int> _cost;
  String _costBurn;

  Map _datavalues;

  List<List> _effect = List<List>.empty(growable: true);
  List<String> _effectBurn;

  List _vars;

  String _costType;

  String _maxammo;

  List<int> _range;
  String _rangeBurn;

  _Image _image;

  String _resource;

  String get id => _id;
  String get name => _name;
  String get description => _description;

  String get tooltip => _tooltip;
  _LevelTip get leveltip => _leveltip;
  int get maxrank => _maxrank;

  List get cooldown => _cooldown;
  String get cooldownBurn => _cooldownBurn;

  List<int> get cost => _cost;
  String get costBurn => _costBurn;

  Map get datavalues => _datavalues;

  List<List<int>> get effect => _effect;
  List<String> get effectBurn => _effectBurn;

  List get vars => _vars;

  String get costType => _costType;

  String get maxammo => _maxammo;

  List<int> get range => _range;
  String get rangeBurn => _rangeBurn;

  _Image get image => _image;

  String get resource => _resource;

  _Spell(Map<String, dynamic> spellData) {
    _id = spellData['id'];
    _name = spellData['name'];
    _description = spellData['description'];

    _tooltip = spellData['tooltip'];
    _leveltip = _LevelTip(Map.from(spellData['leveltip']));
    _maxrank = spellData['maxrank'];

    _cooldown = List.from(spellData['cooldown']);
    _cooldownBurn = spellData['cooldownBurn'];

    _cost = List.from(spellData['cost']);
    _costBurn = spellData['costBurn'];

    _datavalues = Map.from(spellData['datavalues']);

    List.from(spellData['effect']).forEach((element) {
      if (element != null) _effect.add(List.from(element));
    });

    _effectBurn = List.from(spellData['effectBurn']);

    _vars = List.from(spellData['vars']);

    _costType = spellData['costType'];

    _maxammo = spellData['maxammo'];

    _range = List.from(spellData['range']);
    _rangeBurn = spellData['rangeBurn'];

    _image = _Image(Map.from(spellData['image']));

    _resource = spellData['resource'];
  }
}

class _LevelTip {
  List<String> _label;
  List<String> _effect;

  List<String> get label => _label;
  List<String> get effect => _effect;

  _LevelTip(Map<String, List> levelTipData) {
    _label = List.from(levelTipData['label']);
    _effect = List.from(levelTipData['effect']);
  }
}

class Champion extends _Champion {
  final DataDragonApi dataDragonApi = Get.find();

  List<_Skin> _skins = List<_Skin>.empty(growable: true);
  String _lore;

  List<String> _allytips;
  List<String> _enemytips;

  _Passive _passive;
  List<_Spell> _spells = List<_Spell>.empty(growable: true);

  List<_Skin> get skins => _skins;
  String get lore => _lore;

  List<String> get allytips => _allytips;
  List<String> get enemytips => _enemytips;

  _Passive get passive => _passive;
  List<_Spell> get spells => _spells;

  String get squareImage =>
      'http://ddragon.leagueoflegends.com/cdn/' +
      dataDragonApi.version +
      '/img/champion/' +
      _image.full;

  String getSplashArt(int index) =>
      'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/' +
      _id +
      '_' +
      _skins[index]._num.toString() +
      '.jpg';

  Champion.fromJson(Map<String, dynamic> champion)
      : super.championFromJson(champion) {
    _lore = champion['lore'].toString();
    _allytips = List.from(champion['allytips']);
    _enemytips = List.from(champion['enemytips']);
    _passive = _Passive(Map.from(champion['passive']));

    List.from(champion['spells']).forEach((element) {
      _spells.add(_Spell(Map.from(element)));
    });

    List.from(champion['skins']).forEach((element) {
      _skins.add(_Skin(element));
    });
  }
}

class ChampionListItem extends _Champion {
  String get squareImage =>
      'http://ddragon.leagueoflegends.com/cdn/11.5.1/img/champion/' +
      _image.full;

  ChampionListItem.fromJson(Map<String, dynamic> champion)
      : super.championFromJson(champion);
}
