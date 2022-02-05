import 'package:flutter/material.dart';

import 'package:food/sayfalar/login.dart';

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
