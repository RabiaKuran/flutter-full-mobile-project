import 'package:donemuygulamam/sayfalar/profil.dart';
import 'package:donemuygulamam/servisler/yetkilendirmeservisi.dart';
import 'package:flutter/material.dart';
import 'package:donemuygulamam/sayfalar/soruSayfasi.dart';
import 'package:provider/provider.dart';

class sonucEkrani extends StatefulWidget {
  const sonucEkrani({Key? key}) : super(key: key);
  @override
  State<sonucEkrani> createState() => _sonucEkraniState();
}

class _sonucEkraniState extends State<sonucEkrani> {
  @override
  Widget build(BuildContext context) {
    String aktifKullaniciId =
        Provider.of<YetkilendirmeServisi>(context, listen: false)
            .aktifKullaniciId;
    return sonuclariCek(profilSahibiId: aktifKullaniciId);
  }
}
