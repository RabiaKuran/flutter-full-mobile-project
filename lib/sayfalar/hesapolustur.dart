import 'package:donemuygulamam/modeller/kullanici.dart';
import 'package:donemuygulamam/sayfalar/anasayfa.dart';
import 'package:donemuygulamam/servisler/firestoreservisi.dart';
import 'package:donemuygulamam/servisler/yetkilendirmeservisi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HesapOlustur extends StatefulWidget {
  const HesapOlustur({Key? key}) : super(key: key);

  @override
  State<HesapOlustur> createState() => _HesapOlusturState();
}

class _HesapOlusturState extends State<HesapOlustur> {
  final _formAnahtari = GlobalKey<
      FormState>(); //formun metotlarını çalıştırabilmek için form anahtarı oluşturdum.
  bool yukleniyor = false;
  late String kullaniciAdi, email, sifre;
  final _scaffoldAnahtari = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldAnahtari,
      appBar: AppBar(
        title: Text("Hesap Oluştur"),
      ),
      body: ListView(
        children: <Widget>[
          //yukleniyor true ise LinearProgressIndicator() göster
          yukleniyor
              ? LinearProgressIndicator()
              : SizedBox(
                  height: 0.0,
                ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: _formAnahtari,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      //kullanıcının veri girebilmesi için=TextFormField() kullandım.
                      autocorrect:
                          true, //klavyeye yazılanları tamamlamak için önerilerde bulunuyor autocorrect=otomatik düzeltme
                      decoration: InputDecoration(
                        hintText:
                            "Kullanıcı adınızı giriniz", //hintext=kullanıcıya ne yapması gerektiğinin ip ucunu verir.
                        labelText: "Kullanici Adı",
                        errorStyle: TextStyle(fontSize: 16.0),
                        prefixIcon:
                            Icon(Icons.person), //prefix=başına ekle demek
                      ),
                      validator: (girilenDeger) {
                        //validator=doğrulayıcı demek. Girilen bilgileri kontrol edecek. Form alanlarına girilen bilgileri kontrol edebiliriz
                        if (girilenDeger == "") {
                          return "Kullanıcı adı boş bırakılamaz";
                        } else if (girilenDeger!.trim().length < 4) {
                          //|| girilenDeger.trim().length<10
                          return "Girilen değer 4 karakterden uzun olmalıdır!";
                        }
                        return null;
                      },
                      onSaved: (girilenDeger) => kullaniciAdi = girilenDeger!,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      //kullanıcının veri girebilmesi için=TextFormField() kullandım.
                      keyboardType: TextInputType
                          .emailAddress, //klavye tipi anlamına gelir
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText:
                            "Email adresinizi giriniz", //hintext=kullanıcıya ne yapması gerektiğinin ip ucunu verir.
                        labelText: "Mail",
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
                      height: 10.0,
                    ),
                    TextFormField(
                      obscureText:
                          true, //girilen şifrenin görülmemesini sağlar.  obscure=gizlemek
                      decoration: InputDecoration(
                        hintText:
                            "Şifrenizi giriniz", //hintext=kullanıcıya ne yapması gerektiğinin ip ucunu verir.
                        labelText: "Şifre",
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
                      height: 50.0,
                    ),
                    Container(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: _kullaniciOlustur,
                        child: Text(
                          "Hesap Oluştur",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        //color: Theme.of(context).primaryColor
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

  void _kullaniciOlustur() async {
    final _yetkilendirmeServisi =
        Provider.of<YetkilendirmeServisi>(context, listen: false);
    var _formState = _formAnahtari.currentState;
    if (_formState!.validate()) {
      _formState.save();
      setState(() {
        yukleniyor = true;
      });
      //await YetkilendirmeServisi().mailIleKayit(email, sifre); try/catch eklicem
      //await ile işlem tamamlanana kadar bekliyoruz daha sonrabir sonraki sayfaya geçişi sağlıyoruz.

      try {
        Kullanici kullanici = await _yetkilendirmeServisi.mailIleKayit(
            //bize kullanıcı objesi döndürür.
            email,
            sifre); //hata verme ihtimali olduğu için bu kısma aldım.
        if (kullanici != null) {
          FireStoreServisi().kullaniciOlustur(
              //kullanici değeri boş değilse
              id: kullanici.id,
              email: email,
              kullaniciAdi: kullaniciAdi);
        }
        Navigator.pop(context);
      } catch (hata) {
        setState(() {
          yukleniyor = false;
        });
        uyariGoster(hataKodu: hata.hashCode);
      }
    }
  }

  uyariGoster({hataKodu}) {
    String hataMesaji = 'Bilgileri eksik veya hatalı girdiniz.';
    if (hataKodu == "ERROR_INVALID_EMAIL") {
      hataMesaji = "Girdiğiniz mail adresi geçersizdir.";
    } else if (hataKodu == "ERROR_EMAIL_ALREADY_IN_USE") {
      hataMesaji = "Girdiğiniz mail kayıtlıdır.";
    } else if (hataKodu == "ERROR_WEAK_PASSWORD") {
      hataMesaji = "Daha zor bir şifre giriniz.";
    }
    //var snackBar = SnackBar(content: Text(hataMesaji));
    //_scaffoldAnahtari.currentState.ScaffoldMessenger.of(context).showSnackBar(snackBar);;
    //ScaffoldMessenger.of(context).showSnackBar(snackBar);

    var snackBar = SnackBar(
      content: Text(hataMesaji.toString()),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
