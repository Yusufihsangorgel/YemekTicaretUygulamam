import 'package:flutter/material.dart';
import 'package:food/models/food_model.dart';

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
  @override
  State<Foods> createState() => _FoodState();
}

class _FoodState extends State<Foods> {
  late List<Food> _foodList;

  void initState() {
    super.initState();
    _foodList = [
      Food("İskender", "Turkish", "porsiyon 25₺"),
      Food("Sushi", "Korean", "Porsiyon 20₺"),
      Food("Pizza", "Italy", "Tam 45₺"),
      Food("Paella", "Espanol", "Porsiyon 30₺"),
      Food("Burrito", "Mexico", "Tam 25₺"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Foods",
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Card(
          child: ListView.builder(
              padding: EdgeInsets.only(top: 5),
              itemCount: _foodList.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(_foodList[index].country),
                  child: ExpansionTile(
                    title: Text(_foodList[index].foodName),
                    subtitle: Text(
                      _foodList[index].country,
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                    trailing:
                        Icon(Icons.arrow_drop_down_circle, color: Colors.green),
                    children: <Widget>[
                      ListTile(title: Text(_foodList[index].price)),
                    ],
                  ),
                );
              })),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        focusColor: Colors.greenAccent,
        onPressed: () {
          setState(() {
            _foodList.add(Food("Yaprak Sarma", "Turkish", "porsiyon 50₺"));
          });
        },
      ),
    );
  }
}
