import 'package:flutter/material.dart';
import 'package:food/models/food_model.dart';
import 'package:food/main.dart';

class FoodAdd extends StatefulWidget {
  const FoodAdd({Key? key}) : super(key: key);

  @override
  State<FoodAdd> createState() => _FoodAddState();
}

class _FoodAddState extends State<FoodAdd> {
  late List<Food> _foodList;

  void initState() {
    super.initState();
    _foodList = [
      Food("İskender", "Turkish", "Porsiyon 25₺,Duble 45₺"),
      Food("Sushi", "Korean", "Porsiyon 20₺"),
      Food("Pizza", "Italy", "Büyük Boy 45₺,Orta Boy 25₺"),
      Food("Paella", "Espanol", "Porsiyon 30₺"),
      Food("Burrito", "Mexico", "Porsiyon 25₺"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Foods Add",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Yemek Giriniz",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _foodList.add(Food(value, null, null));
                    print("eklendi");
                  });
                }),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Ülke Giriniz",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _foodList.add(Food(null, value, null));
                    print("eklendi");
                  });
                }),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Fiyat Giriniz",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _foodList.add(Food(null, null, value));
                    print("eklendi");
                  });
                }),
          ),
        ],
      ),
    );
  }
}
