import 'package:flutter/foundation.dart';
import 'quiz.dart';

class User {
  final String firstname;
  final String lastname;
  final String school;
  final String email;
  final String major;
  final String pictureURL;
  final int age;
  final Quiz quizone = null;
  final Quiz quiztwo = null;

  User({
    @required this.firstname,
    @required this.lastname,
    @required this.school,
    @required this.email,
    @required this.major,
    @required this.pictureURL,
    @required this.age,
    // @required this.quizone,
    // @required this.quiztwo,
  });
}
