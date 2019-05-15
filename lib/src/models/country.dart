class Country {

  String name;
  String code;

  Country(this.name, this.code);

  Country.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    code = map['code'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name' : name,
      'code' : code
    };
    return map;
  }

  @override
  String toString() {
    return 'Country{name: $name, code: $code}';
  }


}