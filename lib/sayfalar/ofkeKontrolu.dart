import 'package:donemuygulamam/sayfalar/sonucEkrani.dart';
import 'package:flutter/material.dart';

int soruIndex = 0; //her soru için ındex numarası
List<dynamic> secimler = [];
//List<String> hastaliklar = [];
var hic = 0, cokAz = 1, oldukcaFazla = 3, cokFazla = 4;

class ofkeKontrolu extends StatefulWidget {
  ofkeKontrolu({Key? key}) : super(key: key);

  @override
  State<ofkeKontrolu> createState() => _ofkeKontroluState();
}

class _ofkeKontroluState extends State<ofkeKontrolu> {
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
      if (soruIndex == 33) {
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
    '1.Çabuk parlarım.',
    '2.Kızgın mizaçlıyımdır.',
    '3.Öfkesi burnunda bir insanım.',
    '4.Başkalarının hataları, yaptığım işi yavaşlatınca kızarım.',
    '5.Yaptığım iyi bir işten sonra takdir edilmemek canımı sıkar.',
    '6.Öfkelenince kontrolümü kaybederim.',
    '7.Öfkelendiğimde ağzıma geleni söylerim.',
    '8.Başkalarının önünde eleştirilmek beni çok hiddetlendirir.',
    '9.Engellendiğimde içimden birilerine vurmak gelir.',
    '10.Yaptığım iyi bir iş kötü değerlendirildiğinde çılgına dönerim.',
    '11.Öfkemi kontrol ederim.',
    '12.Kızgınlığımı gösteririm.',
    '13.Öfkemi içime atarım.',
    '14.Başkalarına karşı sabırlıyımdır.',
    '15.Somurtur ya da surat asarım.',
    '16.İnsanlardan uzak dururum.',
    '17.Başkalarına iğneli sözler söylerim.',
    '18.Soğukkanlılığımı korurum.',
    '19.Kapıları çarpmak gibi şeyler yaparım.',
    '20.İçin için köpürürüm ama gösteremem.',
    '21.Davranışlarımı kontrol ederim.',
    '22.Başkalarıyla tartışırım.',
    '23.İçimde, kimseye söylemediğim kinler beslerim.',
    '24.Beni çileden çıkaran her neyse saldırırım.',
    '25.Öfkem kontrolden çıkmadan kendimi durdurabilirim.',
    '26.Gizliden gizliye insanları epeyce eleştiririm.',
    '27.Belli ettiğimden daha öfkeliyimdir.',
    '28.Çoğu kimseye kıyasla daha çabuk sakinleşirim.',
    '29.Kötü şeyler söylerim.',
    '30.Hoşgörülü ve anlayışlı olmaya çalışırım.',
    '31.İçimden insanların fark ettiğinden daha fazla sinirlenirim.'
        '32.Sinirlerime hakim olamam.',
    '33.Beni sinirlendirene, ne hissettiğimi söylerim.',
    '34.Kızgınlık duygularımı kontrol ederim.'
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF99d2ff),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.blue[400],
          elevation: 1.0,
          title: Text(
            "ÖFKE KONTROLÜ TESTİ",
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.black87,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 60.0,
              color: Color(0xFF99d2ff),
            ),
            Expanded(
              child: Container(
                color: Color(0xFF99d2ff),
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
                color: Color(0xFF99d2ff),
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
                      "\nHiç\n",
                      textAlign: TextAlign.left,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue[500],
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
                          "\nBiraz\n",
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue[500],
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
                      "\nOldukça\n",
                      textAlign: TextAlign.left,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue[500],
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
                          "\nTümüyle\n",
                          textAlign: TextAlign.left,
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue[500],
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
                          butonFonksiyonu(cokFazla);
                        },
                      ))
                    ],
                  ))
                ],
              ),
            )),
            SizedBox(
              height: 20.0,
            )
          ],
        )));
  }
}
