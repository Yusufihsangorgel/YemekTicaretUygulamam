import 'package:flutter/material.dart';
import 'package:food/foodadd.dart';
import 'package:food/models/food_model.dart';
import 'package:food/sepet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Foods(),
    );
  }
}

class Foods extends StatefulWidget {
  final food2, foodCountry2, foodPrice2;
  const Foods({Key? key, this.food2, this.foodCountry2, this.foodPrice2})
      : super(key: key);
  @override
  State<Foods> createState() => _FoodState();
}

class _FoodState extends State<Foods> {
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
    if (widget.food2 != null) {
      _foodList.add(Food(widget.food2, widget.foodCountry2, widget.foodPrice2));
    }
  }

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
            "Foods",
            style: TextStyle(fontSize: 25),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.shopping_basket,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Sepet(),
                  ),
                );
              },
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.exit_to_app_sharp),
            ),
          ],
        ),
        body: Card(
          elevation: 0,
          color: Colors.transparent,
          child: ListView.builder(
            padding: EdgeInsets.only(top: 5),
            itemCount: _foodList.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(_foodList[index].country),
                child: ExpansionTile(
                  title: Text(
                    _foodList[index].foodName,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    _foodList[index].country,
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing:
                      Icon(Icons.arrow_drop_down_circle, color: Colors.green),
                  children: <Widget>[
                    ListTile(
                      focusColor: Colors.green,
                      subtitle: Column(
                        children: <Widget>[
                          Text(
                            _foodList[index].price,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          FlatButton(
                              color: Colors.green,
                              child: Text('Sepete Ekle'),
                              onPressed: () {
                                final snackBar = SnackBar(
                                  backgroundColor: Colors.green,
                                  content: const Text(
                                    "Sepete Eklendi!",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  action: SnackBarAction(
                                    textColor: Colors.white,
                                    label: 'Geri',
                                    onPressed: () {
                                      // Some code to undo the change.
                                    },
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 30,
          ),
          backgroundColor: Colors.green,
          focusColor: Colors.greenAccent,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodAdd(),
              ),
            );
          },
        ),
      ),
    );
  }
}
