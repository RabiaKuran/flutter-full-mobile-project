import 'package:donemuygulamam/sayfalar/sonucEkrani.dart';
import 'package:donemuygulamam/sayfalar/soruSayfasi.dart';
import 'package:donemuygulamam/sayfalar/soruYonlendirme.dart';
import 'package:flutter/material.dart'; //Center(child: Text("Akış Sayfası"));

class Akis extends StatefulWidget {
  const Akis({Key? key}) : super(key: key);

  @override
  State<Akis> createState() => _AkisState();
}

class _AkisState extends State<Akis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        //backgroundColor: Colors.indigo[700],
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0.0),
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  "SORUN NEREDE?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                accountEmail: Text("Tüm bilgilerin"),
                currentAccountPicture: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/logo.png")),
                      borderRadius: BorderRadius.circular(50.0)),
                ),
                decoration: BoxDecoration(color: Colors.green[400]),
              ),
              ListTile(
                title: Text("Kısa Semptom Envanteri(KSE)"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Gelişmelerim"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Sonuçlarım"),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => sonucEkrani()));
                },
              ),
              ListTile(
                title: Text("Ayarlar"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Kapat"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.grey[100],
          elevation: 0.0,
          title: Text(
            "Sorun Nerede?",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.grey,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.green[400],
                  size: 32.0,
                ),
                onPressed: () {}),
          ],
        ),
        body: SafeArea(
          child: soruYonlendirme(),
          //child: SoruSayfasi(),
        ));
  }
}
