import 'package:flutter/material.dart';
import 'package:food/models/food_model.dart';
import 'package:food/main.dart';

import 'Foods.dart';

class FoodAdd extends StatefulWidget {
  const FoodAdd({Key? key}) : super(key: key);

  @override
  State<FoodAdd> createState() => _FoodAddState();
}

class _FoodAddState extends State<FoodAdd> {
  late String newFood, newCountry, newPrice;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/yemekarka.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "Yemek Ekle",
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
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    labelText: "Yemek Giriniz",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      newFood = value;
                      print("eklendi");
                    });
                  }),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    labelText: "Ülke Giriniz",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      newCountry = value;
                      print("eklendi");
                    });
                  }),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  labelText: "Fiyat Giriniz",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(
                    () {
                      newPrice = value;
                      print("eklendi");
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 400, left: 230),
              child: ButtonTheme(
                minWidth: 100,
                height: 50,
                child: RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                    if (newFood != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Foods(
                            food2: newFood,
                            foodCountry2: newCountry,
                            foodPrice2: newPrice,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Ekle",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
