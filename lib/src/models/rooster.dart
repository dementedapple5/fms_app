import 'package:fms_app/src/models/country.dart';

class Rooster {

  int id;
  Country country;
  String name;
  String nickName;
  int age;
  String resume;
  String avatar;


  Rooster(this.country, this.name, this.nickName, this.age,
      this.resume, this.avatar, {this.id});

  Rooster.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    nickName = map['nick_name'];
    age = map['age'];
    resume = map['resume'];
    avatar = map['avatar'];
    id = map['id'];
  }


  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name' : name,
      'nick_name' : nickName,
      'age' : age,
      'resume' : resume,
      'avatar' : avatar,
      'country_id' : country.id
    };

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }

  @override
  String toString() {
    return 'Rooster{id: $id, country: $country, name: $name, nickName: $nickName, age: $age, resume: $resume, avatar: $avatar}';
  }


}