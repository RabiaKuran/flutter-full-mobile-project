import 'package:donemuygulamam/sayfalar/beckAnksiyete.dart';
import 'package:flutter/material.dart';
import 'package:donemuygulamam/sayfalar/sonucEkrani.dart';
import 'package:flutter/material.dart';

int soruIndex = 0; //her soru için ındex numarası
List<dynamic> secimler = [];
//List<String> hastaliklar = [];
var hic = 0, cokFazla = 4;

class obsesifKompulsifBozukluk extends StatefulWidget {
  obsesifKompulsifBozukluk({Key? key}) : super(key: key);

  @override
  State<obsesifKompulsifBozukluk> createState() =>
      _obsesifKompulsifBozuklukState();
}

class _obsesifKompulsifBozuklukState extends State<obsesifKompulsifBozukluk> {
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
      if (soruIndex == 36) {
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
    '1.Bana bir hastalık bulaşır korkusuyla herkesin kullandığı telefonları kullanmaktan kaçınırım.',
    '2.Sık sık hoşa gitmeyen şeyler düşünür, onları zihnimden uzaklaştırmakta güçlük çekerim.',
    '3.Dürüstlüğe herkesten çok önem veririm',
    '4.İşleri zamanında bitiremediğim için çoğu kez geç kalırım.',
    '5.Bir hayvana dokununca hastalık bulaşır diye kaygılanırım.',
    '6.Sık sık havagazını, su musluklarını ve kapıları birkaç kez kontrol ederim.',
    '7.Değişmez kurallarım vardır.',
    '8.Aklıma takılan nahoş düşünceler hemen her gün beni rahatsız eder.',
    '9.Kaza ile bir başkasına çarptığımda rahatsız olurum.',
    '10.Her gün yaptığım basit günlük işlerden bile emin olamam.',
    '11.Çocukken annem de babam da beni fazla sıkmazlardı.',
    '12.şeyleri tekrar tekrar yaptığım için işimde geri kaldığım oluyor.',
    '13.Çok fazla sabun kullanırım.',
    '14.Bana göre bazı sayılar son derece uğursuzdur.',
    '15.Mektupları postalamadan önce onları tekrar tekrar kontrol ederim.',
    '16.Sabahları giyinmek için uzun zaman harcarım.',
    '17.Temizliğe aşırı düşkünüm.',
    '18.Ayrıntılara gereğinden fazla dikkat ederim.',
    '19.Pis tuvaletlere giremem.',
    '20.Esas sorunum bazı şeyleri tekrar tekrar kontrol etmemdir.',
    '21.Mikrop kapmaktan ve hastalanmaktan korkar ve kaygılanırım.',
    '22.şeyleri birden fazla kontrol ederim.',
    '23.Günlük işlerimi belirli bir programa göre yaparım.',
    '24.Paraya dokunduktan sonra ellerimi kirli hissederim.',
    '25.Alıştığım işi yaparken bile kaç kere yaptığımı sayrım.',
    '26.Sabahları elimi yüzümü yıkamak çok zamanımı alır.',
    '27.Çok miktarda mikrop öldürücü ilaç kullanırım.',
    '28.Her gün bazı şeyleri tekrar tekrar kontrol etmek bana zaman kaybettirir.',
    '29.Geceleri giyeceklerimi katlayıp asmak uzun zamanımı alır.',
    '30.Dikkatle yaptığım bir işin bile tam doğru olup olmadığına emin olamam.',
    '31.Kendimi toparlayamadığım için günler, haftalar, hatta aylarca hiçbir şeye el sürmediğim olur.',
    '32.En büyük mücadelelerimi kendimle yaparım.',
    '33.Çoğu zaman büyük bir hata ya da kötülük yaptığım duygusuna kapılırım.',
    '34.Sık sık kendime birşeyleri dert edinirim.',
    '35.Önemsiz ufak şeylerde bile karar verip işe girişmeden önce durup düşünürüm.',
    '36.Reklamlardaki ampuller gibi önemsiz şeyleri sayma alışkanlığım vardır.',
    '37.Bazen önemsiz düşünceler aklıma takılır ve beni günlerce rahatsız eder.',
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFff9999),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.pink[400],
          elevation: 1.0,
          title: Text(
            "OBSESİF KOMPÜLSİF BOZUKLUK TESTİ",
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
              color: Color(0xFFff9999),
            ),
            Expanded(
              child: Container(
                color: Color(0xFFff9999),
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
                color: Color(0xFFff9999),
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
                      "\nEvet\n",
                      textAlign: TextAlign.left,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.pink[500],
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
                          "\nHayır\n",
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.pink[500],
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
                  )),
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
