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
    _image = _Image(Map.from(champion['image']));

    _tags = List.from(champion['tags']);
    _partype = champion['partype'];
    _stats = _Stats(Map.from(champion['stats']));
  }
}

class _Stats {
  double _hp;
  double _hpperlevel;
  double _mp;
  double _mpperlevel;
  double _movespeed;
  double _armor;
  double _armorperlevel;
  double _spellblock;
  double _spellblockperlevel;
  double _attackrange;
  double _hpregen;
  double _hpregenperlevel;
  double _mpregen;
  double _mpregenperlevel;
  double _crit;
  double _critperlevel;
  double _attackdamage;
  double _attackdamageperlevel;
  double _attackspeedperlevel;
  double _attackspeed;

  double get hp => _hp;
  double get hpperlevel => _hpperlevel;
  double get mp => _mp;
  double get mpperlevel => _mpperlevel;
  double get movespeed => _movespeed;
  double get armor => _armor;
  double get armorperlevel => _armorperlevel;
  double get spellblock => _spellblock;
  double get spellblockperlevel => _spellblockperlevel;
  double get attackrange => _attackrange;
  double get hpregen => _hpregen;
  double get hpregenperlevel => _hpregenperlevel;
  double get mpregen => _mpregen;
  double get mpregenperlevel => _mpregenperlevel;
  double get crit => _crit;
  double get critperlevel => _critperlevel;
  double get attackdamage => _attackdamage;
  double get attackdamageperlevel => _attackdamageperlevel;
  double get attackspeedperlevel => _attackspeedperlevel;
  double get attackspeed => _attackspeed;

  _Stats(Map<String, double> statsData) {
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

  get attack => _attack;
  get defense => _defense;
  get magic => _magic;
  get difficulty => _difficulty;

  _Info(Map<String, int> infoData) {
    _attack = infoData['attack'];
    _defense = infoData['defense'];
    _magic = infoData['magic'];
    _difficulty = infoData['difficulty'];
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
    _image = _Image(Map.from(passiveData['image']));
  }
}

class _Spell {
  String _id;
  String _name;
  String _description;

  String _tooltip;
  _LevelTip _leveltip;
  int _maxrank;

  List<double> _cooldown;
  String _cooldownBurn;

  List<int> _cost;
  String _costBurn;

  Map _datavalues;

  List<List<int>> _effect;
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

  List<double> get cooldown => _cooldown;
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

    // _effect = List.from(spellData['effect']);

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
  // List<String> _effect;

  List<String> get label => _label;
  // List<String> get effect => _effect;

  _LevelTip(Map<String, List> levelTipData) {
    _label = List.from(levelTipData['label']);
    // _effect = List.from(levelTipData['effect']);
  }
}

class Champion extends _Champion {
  List<Map<String, dynamic>> _skins;
  String _lore;

  List<String> _allytips;
  List<String> _enemytips;

  _Passive _passive;
  List<_Spell> _spells = List<_Spell>.empty(growable: true);

  List<Map<String, dynamic>> get skins => _skins;
  String get lore => _lore;

  List<String> get allytips => _allytips;
  List<String> get enemytips => _enemytips;

  _Passive get passive => _passive;
  List<_Spell> get spells => _spells;

  Champion.fromJson(Map<String, dynamic> champion)
      : super.championFromJson(champion) {
    _skins = List.from(champion['skins']);

    _lore = champion['lore'].toString();
    _allytips = List.from(champion['allytips']);
    _enemytips = List.from(champion['enemytips']);
    _passive = _Passive(Map.from(champion['passive']));

    List.from(champion['spells']).forEach((element) {
      _spells.add(_Spell(Map.from(element)));
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
