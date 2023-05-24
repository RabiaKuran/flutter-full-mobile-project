import 'dart:ffi';
import 'package:donemuygulamam/sayfalar/sonucEkrani.dart';
import 'package:flutter/material.dart';

List<dynamic> secimler = [];
//List<String> hastaliklar = [];
var hic = 0, cokAz = 1, orta = 2, oldukcaFazla = 3, cokFazla = 4;

class SoruSayfasi extends StatefulWidget {
  const SoruSayfasi({Key? key}) : super(key: key);

  @override
  State<SoruSayfasi> createState() => _SoruSayfasiState();
}

int soruIndex = 0; //her soru için ındex numarası

class _SoruSayfasiState extends State<SoruSayfasi> {
  @override
  void butonFonksiyonu(int secilenButon) {
    var altOlcek1,
        altOlcek2,
        altOlcek3,
        altOlcek4,
        altOlcek5,
        altOlcek6,
        altOlcek7,
        altOlcek8,
        altOlcek9,
        altOlcek10;
    _testBittiMi() {
      if (soruIndex == 52) {
        //6soru varken 1ekdiğini yani 5i girdim. 53 soru olacak 52 yazıyorum
        //soru Sayisidan 1eksik olacak
        print("son soru işaretelendi");
        //DatabaseReference ref = FirebaseDatabase.instance.ref("kullanıcılar");
        //print(hastaliklar);
        return true;
      } else {
        return false;
      }
    }

    if (_testBittiMi() == true) {
      //alertGözüküyor, test sıfırlanıyor,
      secimler.add(secilenButon);
      print(secimler);
      //print(hastaliklar);
      print("test bitti");
      altOlcek1 = (secimler[2] +
              secimler[7] +
              secimler[23] +
              secimler[29] +
              secimler[30] +
              secimler[33] +
              secimler[37]) /
          7;
      altOlcek2 = (secimler[5] +
              secimler[15] +
              secimler[26] +
              secimler[27] +
              secimler[32] +
              secimler[36]) /
          6;
      altOlcek3 =
          (secimler[19] + secimler[20] + secimler[21] + secimler[41]) / 4;
      altOlcek4 = (secimler[8] +
              secimler[15] +
              secimler[16] +
              secimler[17] +
              secimler[34] +
              secimler[49]) /
          6;
      altOlcek5 = (secimler[0] +
              secimler[11] +
              secimler[18] +
              secimler[37] +
              secimler[4] +
              secimler[48]) /
          6;
      altOlcek6 = (secimler[5] +
              secimler[12] +
              secimler[39] +
              secimler[40] +
              secimler[45]) /
          5;
      altOlcek7 = (secimler[7] +
              secimler[27] +
              secimler[30] +
              secimler[42] +
              secimler[46]) /
          5;
      altOlcek8 = (secimler[3] +
              secimler[9] +
              secimler[23] +
              secimler[47] +
              secimler[50]) /
          5;
      altOlcek9 = (secimler[3] +
              secimler[13] +
              secimler[33] +
              secimler[43] +
              secimler[52]) /
          5;
      altOlcek10 =
          (secimler[10] + secimler[24] + secimler[38] + secimler[51]) / 4;

      print("altOlcek1");
      print(altOlcek1);
      print("altOlcek2");
      print(altOlcek2);
      print("altOlcek3");
      print(altOlcek3);
      print("altOlcek4");
      print(altOlcek4);
      print("altOlcek5");
      print(altOlcek5);
      print("altOlcek6");
      print(altOlcek6);
      print("altOlcek7");
      print(altOlcek7);
      print("altOlcek8");
      print(altOlcek8);
      print("altOlcek9");
      print(altOlcek9);
      print("altOlcek10");
      print(altOlcek10);

      /*if (altOlcek1 > 1.50 && altOlcek1 <= 2.50) {
        hastaliklar[0] = 'Orta Derecede Somatisyon(SOM)';
      } else if (altOlcek2 > 1.50 && altOlcek2 <= 2.50) {
        hastaliklar[1] = 'Orta Derecede Obsesif-Kompulsif(O-C)';
      } else if (altOlcek3 > 1.50 && altOlcek3 <= 2.50) {
        hastaliklar[2] = 'Orta Derecede Kişiler Arası Duyarlılık(INT)';
      } else if (altOlcek4 > 1.50 && altOlcek4 <= 2.50) {
        hastaliklar[3] = 'Orta Derecede Depresyon(DEP)';
      } else if (altOlcek5 > 1.50 && altOlcek5 <= 2.50) {
        hastaliklar[4] = 'Orta Derecede Kaygı(ANX)';
      } else if (altOlcek6 > 1.50 && altOlcek6 <= 2.50) {
        hastaliklar[5] = 'Orta Derecede  Öfke-Düşmanlık(HOS)';
      } else if (altOlcek7 > 1.50 && altOlcek7 <= 2.50) {
        hastaliklar[6] = 'Orta Derecede Fobik Anksiyete(PHOB)';
      } else if (altOlcek8 > 1.50 && altOlcek8 <= 2.50) {
        hastaliklar[7] = 'Orta Derecede Paranoid Düşünce(PAR)';
      } else if (altOlcek9 > 1.50 && altOlcek9 <= 2.50) {
        hastaliklar[8] = 'Orta Derecede Psikotizm(PSY)';
      } else if (altOlcek10 > 1.50 && altOlcek10 <= 2.50) {
        hastaliklar[9] = 'Orta Derecede Ek Maddeler';
      } else if (altOlcek1 > 2.50 || altOlcek1 <= 4) {
        hastaliklar[10] = 'Yüksek Derecede Somatisyon(SOM)';
      } else if (altOlcek2 > 2.50 && altOlcek2 <= 4) {
        hastaliklar[11] = 'Yüksek Derecede Obsesif-Kompulsif(O-C)';
      } else if (altOlcek3 > 2.50 && altOlcek3 <= 4) {
        hastaliklar[12] = 'Yüksek Derecede Kişiler Arası Duyarlılık(INT)';
      } else if (altOlcek4 > 2.50 && altOlcek4 <= 4) {
        hastaliklar[13] = 'Yüksek Derecede Depresyon(DEP)';
      } else if (altOlcek5 > 2.50 && altOlcek5 <= 4) {
        hastaliklar[14] = 'YüksekDerecede Kaygı(ANX)';
      } else if (altOlcek6 > 2.50 && altOlcek6 <= 4) {
        hastaliklar[15] = 'Yüksek Derecede Öfke-Düşmanlık(HOS)';
      } else if (altOlcek7 > 2.50 && altOlcek7 <= 4) {
        hastaliklar[16] = 'Yüksek Derecede Fobik Anksiyete(PHOB)';
      } else if (altOlcek8 > 2.50 && altOlcek8 <= 4) {
        hastaliklar[17] = 'Yüksek Derecede Paranoid Düşünce(PAR)';
      } else if (altOlcek9 > 2.50 && altOlcek9 <= 4) {
        hastaliklar[18] = 'Yüksek Derecede Psikotizm(PSY)';
      } else if (altOlcek10 > 2.50 && altOlcek10 <= 4) {
        hastaliklar[19] = 'Yüksek Derecede Ek Maddeler';
      }*/
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("Testi Başarılı Bir Şekilde Tamamladınız\n"),
              content: const Text(
                  'Testi başarılı bir şekilde tamamladınız\n Kapat Tuşundan sonra sonuç ekranınıza yönlendirileceksiniz.'),
              actions: <Widget>[
                new TextButton(
                  child: new Text("Kapat"),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => sonucEkrani()));
                  },
                )
              ],
            );
          });
    } else {
      setState(() {
        //hangi butona basarsa onun değeri dönecek.
        secimler.add(secilenButon);
        print(secimler);
        //print(hastaliklar);
        soruIndex++;
      });
    }
  }

  List<String> sorularKSE = [
    '1.İçinizdeki sinirlilik ve titreme hali',
    '2.Baygınlık, baş dönmesi',
    '3.Bir başka kişinin sizin düşüncelerinizi kontrol edeceği fikri',
    '4.Başınıza gelen sıkıntılardan dolayı başkalarının suçlu olduğu duygusu',
    '5.Olayları hatırlamada güçlük',
    '6.Çok kolayca kızıp öfkelenme',
    '7.Göğüs (kalp) bölgesinde ağrılar',
    '8.Meydanlık(açık) yerlerden korkma duygusu',
    '9.Yaşamınıza son verme düşüncesi',
    '10.İnsanların çoğuna güvenilemeyeceği hissi',
    '11.İştahta bozukluklar',
    '12.Hiçbir nedeni olmayan ani korkular',
    '13.Kontrol edemediğiniz duygu patlamaları',
    '14.Başka insanlarla beraberken bile yalnızlık hissetme',
    '15.İşleri bitirme konusunda kendini engellenmiş hissetme',
    '16.Yalnızlık hissetme',
    '17.Hüzünlü, kederli hissetme',
    '18.Hiçbir şeye ilgi duymamak',
    '19.Kendini ağlamaklı hissetme',
    '20.Kolayca incinebilme, kırılma',
    '21.İnsanların sizi sevmediğine, size kötü davrandığına inanma',
    '22.Kendini diğer insanlardan daha aşağı görmek',
    '23.Mide bozukluğu, bulantı',
    '24.Diğer insanların sizi gözlediği ya da hakkınızda konuştuğu duygusu',
    '25.Uykuya dalmada güçlük',
    '26.Yaptığınız şeyleri tekrar tekrar doğru mu diye kontrol etmek',
    '27.Karar vermede güçlükler',
    '28.Otobüs, tren, metro gibi umumi vasıtalarla seyahatlerden korkma',
    '29.Nefes darlığı, nefessiz kalma',
    '30.Sıcak, soğuk basmaları',
    '31.Sizi korkuttuğu için bazı eşya yer ya da etkinliklerden uzak kalmaya çalışmak',
    '32.Kafanızın bomboş kalması',
    '33.Bedeninizin bazı bölgelerinde uyuşmalar, karıncalanmalar',
    '34.Hatalarınız için cezalandırılmanız gerektiği düşüncesi',
    '35.Gelecekle ilgili umutsuzluk duyguları',
    '36.Dikkati bir şey üzerine toplamada güçlük',
    '37.Bedenin bazı bölgelerinde, zayıflık, güçsüzlük hissi',
    '38.Kendini gergin ve tedirgin hissetme',
    '39.Ölme ve ölüm üzerine düşünceler',
    '40.Birini dövme, ona zarar verme yaralama isteği',
    '41.Bir şeyleri kırma, dökme isteği',
    '42.Diğer insanların yanında iken yanlış bir şey yapmamaya çalışmak',
    '43.Kalabalıklardan rahatsızlık duymak',
    '44.Başka insanlara hiç yakınlık duymamak',
    '45.Dehşet ve panik nöbetleri',
    '46.Sık sık tartışmaya girmek',
    '47.Yalnız kalındığında sinirlilik hissetme',
    '48.Başarılarınıza rağmen diğer insanlardan yeterince takdir görmemek',
    '49.Kendini yerinde duramayacak kadar tedirgin hissetmek',
    '50.Kendini değersiz görme duygusu',
    '51.Eğer izin verirseniz insanların sizi sömüreceği duygusu',
    '52.Suçluluk duyguları',
    '53.Aklınızda bir bozukluk olduğu fikri',
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFc27dfc),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.purple[500],
          elevation: 0.0,
          title: Text(
            "Kısa Semptom Envanteri(KSE)",
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.grey[400],
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.purple[500],
                  size: 32.0,
                ),
                onPressed: () {}),
          ],
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 60.0,
              color: Color(0xFFc27dfc),
            ),
            Expanded(
              child: Container(
                color: Color(0xFFc27dfc),

                //teslerin başına resim ekleme
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 100.0,
                  height: 100.0,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    //'Kısa Semptom Envanteri(KSE)',
                    sorularKSE[soruIndex],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: Row(children: <Widget>[
                    //yan yana cevap kutuları
                    Expanded(
                        //buton1
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1),
                            child: ElevatedButton(
                              child: Text("Hiç"),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.purple[500],
                                  onPrimary: Colors.white,
                                  onSurface: Colors.grey,
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontStyle: FontStyle.normal),
                                  shape: const BeveledRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)))),
                              onPressed: () {
                                butonFonksiyonu(hic);
                              },
                            ))),
                    Expanded(
                        //buton2
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1),
                            child: ElevatedButton(
                              child: Text(
                                "Çok Az",
                                textAlign: TextAlign.center,
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.purple[500],
                                  onPrimary: Colors.white,
                                  onSurface: Colors.grey,
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontStyle: FontStyle.normal),
                                  shape: const BeveledRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)))),
                              onPressed: () {
                                butonFonksiyonu(cokAz);
                              },
                            ))),

                    Expanded(
                        //buton3
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1),
                            child: ElevatedButton(
                              child: Text("Orta"),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.purple[500],
                                  onPrimary: Colors.white,
                                  onSurface: Colors.grey,
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontStyle: FontStyle.normal),
                                  shape: const BeveledRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)))),
                              /*child: Icon(
                                Icons.mood,
                                size: 30.0,
                              ),*/
                              onPressed: () {
                                butonFonksiyonu(orta);
                              },
                            ))),
                    Expanded(
                        //buton4
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1),
                            child: ElevatedButton(
                              child: Text("Oldukça Fazla"),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.purple[500],
                                  onPrimary: Colors.white,
                                  onSurface: Colors.grey,
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11.0,
                                      fontStyle: FontStyle.normal),
                                  shape: const BeveledRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)))),
                              onPressed: () {
                                butonFonksiyonu(oldukcaFazla);
                              },
                            ))),
                    Expanded(
                        //buton5
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1),
                            child: ElevatedButton(
                              child: Text("Çok Fazla"),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.purple[500],
                                  onPrimary: Colors.white,
                                  onSurface: Colors.grey,
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontStyle: FontStyle.normal),
                                  shape: const BeveledRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)))),
                              onPressed: () {
                                butonFonksiyonu(cokFazla);
                              },
                            ))),
                  ])),
            )
          ],
        )));
  }
}
