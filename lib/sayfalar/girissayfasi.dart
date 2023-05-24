//import 'dart:js';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donemuygulamam/modeller/kullanici.dart';
import 'package:donemuygulamam/sayfalar/hesapolustur.dart';
import 'package:donemuygulamam/servisler/firestoreservisi.dart';
import 'package:donemuygulamam/servisler/yetkilendirmeservisi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({Key? key}) : super(key: key);

  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  final _formAnahtari = GlobalKey<
      FormState>(); //form anahtarını tanımladım. bu validator için gerekli.
  final _scaffoldAnahtari = GlobalKey<
      ScaffoldState>(); //snackbar gösterebilmek için scaffold anahtarı oluşturdum.
  bool yukleniyor = false;
  late String email, sifre;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldAnahtari,
        //listview kullanmamdaki amaç klavye açılınca kaydırma işlemi yapılabilsin diye
        body: Stack(
          children: <Widget>[_sayfaElemanlari(), _yuklemeAnimasyonu()],
        ));
  }

  Widget _yuklemeAnimasyonu() {
    if (yukleniyor) {
      return Center(child: CircularProgressIndicator());
    } else {
      //return Center();
      return SizedBox(
        height: 0.0,
      );
    }
  }

  Widget _sayfaElemanlari() {
    return Form(
      key: _formAnahtari, //kontrol etmesi için anahtar verdik
      child: ListView(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 60.0),
        children: <Widget>[
          Container(
            width: 160.0,
            height: 160.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"))),
          ),
          SizedBox(
            height: 80.0,
          ),
          TextFormField(
            //kullanıcının veri girebilmesi için=TextFormField() kullandım.
            autocorrect:
                true, //klavyeye yazılanları tamamlamak için önerilerde bulunuyor autocorrect=otomatik düzeltme
            keyboardType:
                TextInputType.emailAddress, //klavye tipi anlamına gelir

            decoration: InputDecoration(
              hintText:
                  "Email adresinizi giriniz", //hintext=kullanıcıya ne yapması gerektiğinin ip ucunu verir.
              errorStyle: TextStyle(fontSize: 16.0),
              prefixIcon: Icon(Icons.mail), //prefix=başına ekle demek
            ),
            validator: (girilenDeger) {
              //validator=doğrulayıcı demek. Girilen bilgileri kontrol edecek. Form alanlarına girilen bilgileri kontrol edebiliriz
              if (girilenDeger == "") {
                return "Email alanı boş bırakılamaz";
              } else if (girilenDeger!.contains("@")) {
                return null;
              }
              return "Girilen değer mail formatında olmalı!";
            },
            onSaved: (girilenDeger) => email = girilenDeger!,
          ),
          SizedBox(
            height: 40.0,
          ),
          TextFormField(
            obscureText:
                true, //girilen şifrenin görülmemesini sağlar.  obscure=gizlemek
            decoration: InputDecoration(
              hintText:
                  "Şifrenizi giriniz", //hintext=kullanıcıya ne yapması gerektiğinin ip ucunu verir.
              errorStyle: TextStyle(fontSize: 16.0),
              prefixIcon: Icon(Icons.lock),
            ),
            validator: (girilenDeger) {
              //validator=doğrulayıcı demek. Girilen bilgileri kontrol edecek. Form alanlarına girilen bilgileri kontrol edebiliriz
              if (girilenDeger == "") {
                return "Şifre alanı boş bırakılamaz";
              } else if (girilenDeger!.length < 4) {
                return "Şifre 4 karakterden az olamaz.";
              }
              return null;
            },
            onSaved: (girilenDeger) => sifre = girilenDeger!,
          ),
          SizedBox(
            height: 40.0,
          ),
          Row(
            //alttaki butonlar yan yana duracağı için row ekledim
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.elliptical(20, 40)),
                    gradient: SweepGradient(
                      colors: [Colors.green, Colors.green],
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HesapOlustur()));
                    },
                    child: Text(
                      "Hesap Oluştur",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    //color: Theme.of(context).primaryColor
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.elliptical(20, 40)),
                    gradient: SweepGradient(
                      colors: [Colors.green, Colors.green],
                    ),
                  ),
                  child: TextButton(
                    onPressed: _girisYap,
                    child: Text(
                      "Giriş Yap",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    //color: Theme.of(context).primaryColor
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Center(child: Text("veya")),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
            child: Container(
              height: 40.0,
              width: 5.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
                color: Colors.grey,
              ),
              child: Center(
                child: InkWell(
                  onTap:
                      _googleIleGiris, //parantezsin olarak çağırdım, başka bir fonksiyonun içine yazmamak için
                  child: Text(
                    "Google İle Giriş Yap",
                    style: TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Center(child: Text("Şifremi Unuttum")),
        ],
      ),
    );
  }

  void _girisYap() async {
    //_formAnahtari.currentState!.validate();//form alanlarını kontrol ediyor eğer sorun yoksa true değerini döndürüyor.
    if (_formAnahtari.currentState!.validate()) {
      final _yetkilendirmeServisi =
          Provider.of<YetkilendirmeServisi>(context, listen: false);
      _formAnahtari.currentState!.save();
      setState(() {
        yukleniyor = true;
      });

      try {
        await _yetkilendirmeServisi.mailIleGiris(email, sifre);
      } catch (hata) {
        setState(() {
          yukleniyor = false;
        });

        uyariGoster(hataKodu: hata.hashCode);
      }
    }
  }

  void _googleIleGiris() async {
    var _yetkilendirmeServisi =
        Provider.of<YetkilendirmeServisi>(context, listen: false);

    setState(() {
      yukleniyor = true;
    });

    try {
      Kullanici kullanici = await _yetkilendirmeServisi.googleIleGiris();
      if (kullanici != null) {
        //google ile giriş başarılıysa
        Kullanici? firestoreKullanici = await FireStoreServisi().kullaniciGetir(
            kullanici
                .id); //bu idye sahip bir kullancı dokümanı varsa kullanici objesi
        if (firestoreKullanici == null) {
          FireStoreServisi().kullaniciOlustur(
              id: kullanici.id,
              email: kullanici.email,
              kullaniciAdi: kullanici.kullaniciAdi,
              fotoUrl: kullanici.fotoUrl);
          //print("kullanici dokumani olusturuldu");
        }
      }
    } catch (hata) {
      setState(() {
        yukleniyor = false;
      });
      uyariGoster(hataKodu: hata.hashCode);
    }
  }

  uyariGoster({hataKodu}) {
    String hataMesaji;
    if (hataKodu == "ERROR_USER_NOT_FOUND") {
      hataMesaji = "Böyle bir kullanıcı bulunmuyor.";
    } else if (hataKodu == "ERROR_INVALID_EMAIL") {
      hataMesaji = "Girdiğiniz mail adresi geçersizdir.";
    } else if (hataKodu == "ERROR_WRONG_PASSWORD") {
      hataMesaji = "Daha zor bir şifre giriniz.";
    } else if (hataKodu == "ERROR_USER_DISABLED") {
      hataMesaji = "Kullanıcı engellenmiş.";
    } else {
      hataMesaji = "Bilgileri eksik veya hatalı girdiniz kontrol ediniz.";
    }

    var snackBar = SnackBar(
      content: Text(hataMesaji),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
