import 'package:flutter/material.dart';

class Ara extends StatefulWidget {
  Ara({Key? key}) : super(key: key);

  @override
  State<Ara> createState() => _AraState();
}

class _AraState extends State<Ara> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Arama Sayfası"));
  }
}
