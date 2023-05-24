import 'package:donemuygulamam/modeller/kullanici.dart';
import 'package:donemuygulamam/sayfalar/anasayfa.dart';
import 'package:donemuygulamam/sayfalar/girissayfasi.dart';
import 'package:donemuygulamam/servisler/yetkilendirmeservisi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Yonlendirme extends StatelessWidget {
  const Yonlendirme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _yetkilendirmeServisi =
        Provider.of<YetkilendirmeServisi>(context, listen: false);
    return StreamBuilder(
        stream: _yetkilendirmeServisi.durumTakipcisi,
        builder: (context, snapshot) {
          //bekletme ekranı gelsin
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
                body: Center(
                    child:
                        CircularProgressIndicator())); //SİYAH EKRAN İÇERİSİNDE BEKLETME ŞEKLİ GÖSTER
          }
          if (snapshot.hasData) {
            //kullanıcı var mi
            Kullanici? aktifKullanici = snapshot.data as Kullanici?;
            _yetkilendirmeServisi.aktifKullaniciId = aktifKullanici!.id;
            return AnaSayfa();
          } else {
            //kullanıcı yoksa tekrar giris sayfasina yönlendirdim
            return GirisSayfasi();
          }
        });
  }
}
