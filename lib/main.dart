import 'package:flutter/material.dart';
import 'package:food/sayfalar/anasayfa.dart';
import 'package:food/sayfalar/foodadd.dart';
import 'package:food/models/food_model.dart';
import 'package:food/sayfalar/login.dart';
import 'package:food/sayfalar/sepet.dart';
import 'package:food/sayfalar/settings.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'dart:io' show Platform;

import 'sayfalar/Foods.dart';

import 'sayfalar/favoriler.dart';
import 'sayfalar/odeme.dart';

void main() {
  runApp(const MyFoods());
}

class MyFoods extends StatelessWidget {
  const MyFoods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
