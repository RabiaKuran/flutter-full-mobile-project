import 'package:donemuygulamam/sayfalar/sonucEkrani.dart';
import 'package:flutter/material.dart';

int soruIndex = 0; //her soru için ındex numarası
List<dynamic> secimler = [];
//List<String> hastaliklar = [];
var hic = 0, cokAz = 1, orta = 2, oldukcaFazla = 3, cokFazla = 4;

class beckAnksiyete extends StatefulWidget {
  beckAnksiyete({Key? key}) : super(key: key);

  @override
  State<beckAnksiyete> createState() => _beckAnksiyeteState();
}

class _beckAnksiyeteState extends State<beckAnksiyete> {
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
      if (soruIndex == 20) {
        //6soru varken 1ekdiğini yani 5i girdim. 21 soru olacak 20 yazıyorum
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
    '1. Bedeninizin herhangi bir yerinde uyuşma veya karıncalanma\n',
    '2. Sıcak/ateş basmaları\n',
    '3. Bacaklarda halsizlik, titreme\n',
    '4. Gevşeyememe\n',
    '5. Çok kötü şeyler olacak korkusu\n',
    '6. Baş dönmesi ve sersemlik\n',
    '7. Kalp çarpıntısı\n',
    '8. Dengeyi kaybetme duygusu\n',
    '9. Dehşete kapılma\n',
    '11. Boğuluyormuş gibi olma duygusu\n',
    '12. Ellerde titreme\n',
    '13. Titreklik\n',
    '14. Kontrolü kaybetme korkusu\n',
    '15. Nefes almada güçlük\n',
    '16. Ölüm korkusu\n',
    '17. Korkuya kapılma\n',
    '18. Midede hazımsızlık yada rahatsızlık hissi\n',
    '19. Baygınlık',
    '20. Yüzün kızarması',
    '21. Terleme (sıcağa bağlı olmayan)',
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFfff399),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.yellow[400],
          elevation: 1.0,
          title: Text(
            "BECK ANKSİYETE ÖLÇEĞİ TESTİ",
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.black87,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Color(0xFFfff399),
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
              color: Color(0xFFfff399),
            ),
            Expanded(
              child: Container(
                color: Color(0xFFfff399),
                //teslerin başına resim ekleme
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 100.0,
                  height: 100.0,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Color(0xFFfff399),
                child: Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Center(
                      child: Text(
                        sorularKSE[soruIndex],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
                //flex: 1,
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: ElevatedButton(
                    child: Text(
                      "\n\nA-)Hiç\n\n",
                      textAlign: TextAlign.left,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.yellow[500],
                        onPrimary: Colors.white,
                        onSurface: Colors.grey,
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal),
                        shape: const BeveledRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                    onPressed: () {
                      butonFonksiyonu(hic);
                    },
                  )),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        child: Text(
                          "\nB-)Hafif düzeyde. Beni pek etkilemedi.\n",
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.yellow[500],
                            onPrimary: Colors.white,
                            onSurface: Colors.grey,
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontStyle: FontStyle.normal),
                            shape: const BeveledRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))),
                        onPressed: () {
                          butonFonksiyonu(cokAz);
                        },
                      ))
                    ],
                  )),
                ],
              ),
            )),
            Container(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: ElevatedButton(
                    child: Text(
                      "\nC-)Orta düzeyde. Hoş değildi ama katlanabildim.\n",
                      textAlign: TextAlign.left,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.yellow[500],
                        onPrimary: Colors.white,
                        onSurface: Colors.grey,
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal),
                        shape: const BeveledRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                    onPressed: () {
                      butonFonksiyonu(orta);
                    },
                  )),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        child: Text(
                          "\nD-)Ciddi düzeyde Dayanmakta çok zorlandım\n",
                          textAlign: TextAlign.left,
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.yellow[500],
                            onPrimary: Colors.white,
                            onSurface: Colors.grey,
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontStyle: FontStyle.normal),
                            shape: const BeveledRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))),
                        onPressed: () {
                          butonFonksiyonu(oldukcaFazla);
                        },
                      ))
                    ],
                  ))
                ],
              ),
            )),
          ],
        )));
  }
}
