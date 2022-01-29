import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Food(),
    );
  }
}

class Food extends StatelessWidget {
  var foodList = [
    ExpansionTile(
      title: const Text('İskender'),
      subtitle: Text(
        'Turkish',
        style: TextStyle(color: Colors.black.withOpacity(0.6)),
      ),
      trailing: Icon(Icons.arrow_drop_down_circle, color: Colors.green),
      children: <Widget>[
        ListTile(title: Text('Porsiyon 25₺ , 1.5 porsiyon 35₺ ')),
      ],
    ),
    ExpansionTile(
      title: const Text('Sushi'),
      subtitle: Text(
        'Korean',
        style: TextStyle(color: Colors.black.withOpacity(0.6)),
      ),
      trailing: Icon(Icons.arrow_drop_down_circle, color: Colors.green),
      children: <Widget>[
        ListTile(title: Text('Porsiyon 20₺ , 1.5 porsiyon 30₺')),
      ],
    ),
    ExpansionTile(
      title: const Text('Pizza'),
      subtitle: Text(
        'Italy',
        style: TextStyle(color: Colors.black.withOpacity(0.6)),
      ),
      trailing: Icon(Icons.arrow_drop_down_circle, color: Colors.green),
      children: <Widget>[
        ListTile(title: Text('Yarım 25₺ , Tam 45₺')),
      ],
    ),
    ExpansionTile(
      title: const Text('Paella'),
      subtitle: Text(
        'Espanol',
        style: TextStyle(color: Colors.black.withOpacity(0.6)),
      ),
      trailing: Icon(Icons.arrow_drop_down_circle, color: Colors.green),
      children: <Widget>[
        ListTile(title: Text('Porsiyon 30₺ , 1.5 porsiyon 40₺')),
      ],
    ),
    ExpansionTile(
      title: const Text('Burrito'),
      subtitle: Text(
        'Mexico',
        style: TextStyle(color: Colors.black.withOpacity(0.6)),
      ),
      trailing: Icon(Icons.arrow_drop_down_circle, color: Colors.green),
      children: <Widget>[
        ListTile(title: Text('Yarım 15₺ , Tam 25₺')),
      ],
    ),
  ];

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
              itemCount: foodList.length,
              itemBuilder: (context, index) {
                return foodList[index];
              })),
    );
  }
}
