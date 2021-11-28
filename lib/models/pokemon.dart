class _Skills {}

class Pokemon {
  String? name;
  String? cname;
  String? jname;
  String? picture;
  _Skills? skills;

  Pokemon({this.name, this.cname, this.jname, this.picture, this.skills});

  static Pokemon fromJson(dynamic json) {
    return Pokemon(
        name: json['name'],
        cname: json['cname'],
        jname: json['jname'],
        picture: json['picture']);
  }
}
