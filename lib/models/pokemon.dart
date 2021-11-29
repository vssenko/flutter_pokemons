class _BaseStats {
  int? Attack;
  int? Defense;
  int? HP;
  int? SpAttack;
  int? SpDefense;
  int? Speed;

  _BaseStats(
      {this.Attack,
      this.Defense,
      this.HP,
      this.SpAttack,
      this.SpDefense,
      this.Speed});
}

class Pokemon {
  String id;
  String? name;
  String? cname;
  String? jname;
  String? picture;
  _BaseStats? base;

  Pokemon(
      {required this.id,
      this.name,
      this.cname,
      this.jname,
      this.picture,
      this.base});

  static Pokemon fromJson(dynamic json) {
    _BaseStats? stats;
    var baseStatsJson = json['base'];
    if (baseStatsJson != null) {
      stats = _BaseStats(
          Attack: baseStatsJson['Attack'],
          Defense: baseStatsJson['Defense'],
          HP: baseStatsJson['HP'],
          SpAttack: baseStatsJson['SpAttack'],
          SpDefense: baseStatsJson['SpDefense'],
          Speed: baseStatsJson['Speed']);
    }
    return Pokemon(
        id: (json['id'] as int).toString(),
        name: json['name'],
        cname: json['cname'],
        jname: json['jname'],
        picture: json['picture'],
        base: stats);
  }
}
