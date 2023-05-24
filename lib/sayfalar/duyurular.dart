import 'package:flutter/material.dart';

class Duyurular extends StatefulWidget {
  Duyurular({Key? key}) : super(key: key);

  @override
  State<Duyurular> createState() => _DuyurularState();
}

class _DuyurularState extends State<Duyurular> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Bilgilendirme Sayfasi"));
  }
}
