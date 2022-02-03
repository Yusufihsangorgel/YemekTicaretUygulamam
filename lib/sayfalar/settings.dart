import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:food/models/date_model.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late List<Date> _dateList;
  late String newDay, newMounth, newYear;
  late List checkedValue;
  late List inBasket;
  void initState() {
    super.initState();
    _dateList = [Date("12", "12", "2022")];
    inBasket = ["Yemek Yok"];
    checkedValue = List<bool>.filled(_dateList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Ayarlar"),
      ),
      body: ListView.builder(
        itemCount: _dateList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(_dateList[index].mounth),
            child: Card(
                child: CheckboxListTile(
              onChanged: (bool? value) {
                setState(() {
                  checkedValue[index] = value;
                  debugPrint(_dateList[index].day + value.toString());
                  if (value == true) {
                    debugPrint("Value Değeri True, tarih eklendi");
                    inBasket.add(_dateList[index].day);
                  } else {
                    debugPrint("Value Değeri False");
                  }
                });
              },
              value: false,
              title: Text(_dateList[index].day +
                  "/" +
                  _dateList[index].mounth +
                  "/" +
                  _dateList[index].year),
            )),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          if (Platform.isIOS) {
            showCupertinoDialog(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title: Text("Tarih Giriniz"),
                  content: Container(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                labelText: "Gün",
                                labelStyle: TextStyle(color: Colors.green),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                newDay = value;
                              },
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                labelText: "Ay",
                                labelStyle: TextStyle(color: Colors.green),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                newMounth = value;
                              },
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                labelText: "Yıl",
                                labelStyle: TextStyle(color: Colors.green),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                newYear = value;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        debugPrint(newDay);
                        Navigator.pop(context);
                        _dateList.add(Date(newDay, newMounth, newYear));
                        setState(() {});
                      },
                      child: Text("Kaydet"),
                    ),
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Geri Dön")),
                  ],
                );
              },
            );
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Başlık"),
                  content: Text("Bu bir cupertino mesajı"),
                );
              },
            );
          }
        },
      ),
    );
  }
}
