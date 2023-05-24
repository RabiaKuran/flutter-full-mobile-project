import 'dart:ffi';
import 'package:donemuygulamam/sayfalar/akis.dart';
import 'package:donemuygulamam/sayfalar/ara.dart';
import 'package:donemuygulamam/sayfalar/duyurular.dart';
import 'package:donemuygulamam/sayfalar/profil.dart';
import 'package:donemuygulamam/sayfalar/tensorflow.dart';
import 'package:donemuygulamam/servisler/yetkilendirmeservisi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int _aktifSayfaNo = 0;
  late PageController sayfaKumandasi;

  @override
  void initState() {
    super.initState();
    sayfaKumandasi = PageController();
  }

//controllerden sonra gereksiz yer kaplamaması için dispose ile kapatma işlemi yapmamız gerekir.
//sistemi çöktürebilir
  @override
  void dispose() {
    sayfaKumandasi.dispose(); //kumandayı kapattık
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String aktifKullaniciId =
        Provider.of<YetkilendirmeServisi>(context, listen: false)
            .aktifKullaniciId;
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(), //asla kaydırılamaz
        onPageChanged: (acilanSayfaNo) {
          setState(() {
            _aktifSayfaNo = acilanSayfaNo;
          });
        },
        controller: sayfaKumandasi,
        children: <Widget>[
          Akis(),
          Ara(),
          tensorflow(),
          Duyurular(),
          Profil(
            profilSahibiId: aktifKullaniciId,
          )
        ],
      ),
      /*Center( //çıkıs yap butonuydu
          child: GestureDetector(
              onTap: () => YetkilendirmeServisi().cikisYap(),
              child: Text("Çıkış yap"))),*/
      bottomNavigationBar: BottomNavigationBar(
        //currentIndex: 0,
        currentIndex: _aktifSayfaNo,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey[600],
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ana Sayfa"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Ara"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                size: 30.0,
              ),
              label: "Durum"),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_rounded), label: "Bilgilendirme"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
        onTap: (secilenSayfaNo) {
          setState(() {
            sayfaKumandasi.jumpToPage(secilenSayfaNo);
          });
        },
      ),
    );
  }
}
