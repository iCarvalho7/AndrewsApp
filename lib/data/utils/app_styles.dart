import 'package:andrews_app/data/utils/app_spacements.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin AppStyles {
  static const TextStyle titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold
  );

  static const TextStyle subTitleStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold
  );
  
  static BoxDecoration roundedBox = const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(Numbers.five))
  );
}