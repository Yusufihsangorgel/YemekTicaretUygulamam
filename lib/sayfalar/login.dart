import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/models/new_account.dart';
import 'package:food/sayfalar/anasayfa.dart';
import 'dart:io' show Platform;

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _username;

  String? _password;

  final _formKey = GlobalKey<FormState>();

  late List<Account> _newAccountList;

  late String newUser, newPassword;

  void initState() {
    super.initState();
    _newAccountList = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 150),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  labelText: "Kullanıcı Adı",
                  labelStyle: TextStyle(color: Colors.purple),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Kullanıcı Adınızı Giriniz";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _username = value!;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  labelText: "Şifre",
                  labelStyle: TextStyle(color: Colors.purple),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Şifrenizi Giriniz";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                      child: Text("Üye Ol"),
                      onPressed: () {
                        if (Platform.isIOS) {
                          showCupertinoDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CupertinoAlertDialog(
                                title: Text("Üye Ol"),
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
                                                borderSide: BorderSide(
                                                    color: Colors.green),
                                              ),
                                              labelText: "Kullanıcı Adı",
                                              labelStyle: TextStyle(
                                                  color: Colors.green),
                                              border: OutlineInputBorder(),
                                            ),
                                            onChanged: (value) {
                                              newUser = value;
                                            },
                                          ),
                                          TextFormField(
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.green),
                                              ),
                                              labelText: "Şifre",
                                              labelStyle: TextStyle(
                                                  color: Colors.green),
                                              border: OutlineInputBorder(),
                                            ),
                                            onChanged: (value) {
                                              newPassword = value;
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
                                      debugPrint(newUser);
                                      Navigator.pop(context);
                                      _newAccountList
                                          .add(Account(newUser, newPassword));
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
                      }),
                  MaterialButton(
                      child: Text("Şifremi Unuttum"), onPressed: () {})
                ],
              ),
              RaisedButton(
                  child: Text("Giriş Yap"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                    if (_username == "Yusuf" && _password == "12345") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ),
                      );
                      debugPrint("Giriş başarılı");
                    } else {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Hata"),
                              content: Text("Giriş Bilgileriniz Hatalı"),
                              actions: [
                                MaterialButton(
                                    child: Text("Geri Dön"),
                                    onPressed: () => Navigator.pop(context))
                              ],
                            );
                          });
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
