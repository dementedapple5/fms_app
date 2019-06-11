import 'package:fms_app/src/models/career.dart';
import 'package:fms_app/src/models/school.dart';

class User {
  String name, surname, email, bio, profileImg;
  int degree;
  DateTime createdAt;
  School school;
  Career career;

  User(this.name, this.surname, this.email, this.bio, this.profileImg,
      this.degree, this.createdAt, this.school, this.career);


  User.fromJson(Map json) {
    this.name = json['name'];
    this.surname = json['surname'];
    this.email = json['email'];
    this.bio = json['bio'];
    this.profileImg = json['profile_img'];
    this.degree = json['degree'];
    this.createdAt = json['created_at'];
  }





}