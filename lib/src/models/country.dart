class Country {

  String name;
  int id;


  Country(this.name, {this.id});

  Country.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    id = map['id'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name' : name
    };
    if (id != null) {
      map['id'] = id;
    }

    return map;
  }

  @override
  String toString() {
    return 'Country{name: $name, id: $id}';
  }


}