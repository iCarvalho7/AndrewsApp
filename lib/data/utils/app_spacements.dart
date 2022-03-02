import 'package:flutter/widgets.dart';

mixin Numbers {
  static const double one = 1;
  static const double two = 2;
  static const double three = 3;
  static const double four = 4;
  static const double five = 5;
  static const double six = 6;
  static const double seven = 7;
  static const double eight = 8;
  static const double nine = 9;
  static const double teen = 10;
  static const double eleven = 11;
  static const double twelve = 12;
  static const double thirteen = 13;
  static const double fourteen = 14;
  static const double fifteen = 15;
  static const double twenty = 20;
  static const double thirty = 30;
  static const double forty = 40;
}

extension BuildContextExtensions on BuildContext {
  double get deviceHeight => MediaQuery.of(this).size.height;
  double get deviceWidth => MediaQuery.of(this).size.width;

  double screenPartHeight(num dividedBy) =>
      MediaQuery.of(this).size.height / dividedBy;

  double screenPartWight(num dividedBy) =>
      MediaQuery.of(this).size.width / dividedBy;
}
