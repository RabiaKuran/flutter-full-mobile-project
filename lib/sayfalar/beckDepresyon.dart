import 'package:donemuygulamam/sayfalar/sonucEkrani.dart';
import 'package:flutter/material.dart';

int soruIndex = 0; //her soru için ındex numarası
List<dynamic> secimler = [];
//List<String> hastaliklar = [];
int hic = 0, cokAz = 1, oldukcaFazla = 3, cokFazla = 4;

class beckDepresyon extends StatefulWidget {
  const beckDepresyon({Key? key}) : super(key: key);

  @override
  State<beckDepresyon> createState() => _beckDepresyonState();
}

class _beckDepresyonState extends State<beckDepresyon> {
  @override
  void butonFonksiyonu(int secilenButon) {
    var olcek;
    _testBittiMi() {
      if (soruIndex == 20) {
        //6soru varken 1ekdiğini yani 5i girdim. 21 soru olacak 20 yazıyorum
        //soru Sayisidan 1eksik olacak
        print("son soru işaretelendi");
        return true;
      } else {
        return false;
      }
    }

    if (_testBittiMi() == true) {
      //alertGözüküyor, test sıfırlanıyor,
      secimler.add(secilenButon);
      print(secimler);
      print("test bitti");
      olcek = olcek + secimler[20];
      print(olcek);
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
        soruIndex++;
      });
    }
  }

  List<String> sorularKSE = [
    'A-)Kendimi üzüntülü ve sıkıntılı hissetmiyorum.\nB-)Kendimi üzüntülü ve sıkıntılı hissediyorum.\nC-)Hep üzüntülü ve sıkıntılıyım. Bundan kurtulamıyorum.\nD-)O kadar üzüntülü ve sıkıntılıyım ki artık dayanamıyorum.\n',
    'A-)Gelecek hakkında umutsuz ve karamsar değilim.\nB-)Gelecek için karamsarım.\nC-)Gelecekten beklediğim hiçbir şey yok.\nD-)Gelecek hakkında umutsuzum ve sanki hiçbir şey düzelmeyecekmiş gibi geliyor.\n',
    'A-)Kendimi başarısız biri olarak görmüyorum.\nB-)Başkalarından daha başarısız olduğumu hissediyorum.\nC-)Geçmişe baktığımda başarısızlıklarla dolu olduğunu görüyorum.\nD-)Kendimi tümüyle başarısız bir insan olarak görüyorum.\n',
    'A-)Her şeyden eskisi kadar zevk alıyorum.\nB-)Birçok şeyden eskiden olduğu gibi zevk alamıyorum.\nC-) Artık hiçbir şey bana tam anlamıyla zevk vermiyor.\nD-)Her şeyden sıkılıyorum.\n',
    'A-)Kendimi herhangi bir biçimde suçlu hissetmiyorum.\nB-)Kendimi zaman zaman suçlu hissediyorum.\nC-)Çoğu zaman kendimi suçlu hissediyorum.\nD-)Kendimi her zaman suçlu hissediyorum.\n',
    'A-)Kendimden memnunum.\nB-)Kendimden pek memnun değilim.\nC-)Kendime kızgınım.\nD-)Kendimden nefrete ediyorum.\n',
    'A-)Başkalarından daha kötü olduğumu sanmıyorum.\nB-)Hatalarım ve zayıf taraflarım olduğunu düşünmüyorum.\nC-)Hatalarımdan dolayı kendimden utanıyorum.\nD-)Her şeyi yanlış yapıyormuşum gibi geliyor ve hep kendimi kabahat buluyorum.\n',
    'A-)Kendimi öldürmek gibi düşüncülerim yok.\nB-)Kimi zaman kendimi öldürmeyi düşündüğüm oluyor ama yapmıyorum.\nC-)Kendimi öldürmek isterdim.\nD-)Fırsatını bulsam kendimi öldürürüm.\n',
    'A-)İçimden ağlamak geldiği pek olmuyor.\nB-)Zaman zaman içimden ağlamak geliyor.\nC-)Çoğu zaman ağlıyorum.\nD-)Eskiden ağlayabilirdim ama şimdi istesem de ağlayamıyorum.\n',
    'A-)Her zaman olduğumdan daha canı sıkkın ve sinirli değilim.\nB-)Eskisine oranla daha kolay canım sıkılıyor ve kızıyorum.\nC-)Her şey canımı sıkıyor ve kendimi hep sinirli hissediyorum.\nD-)Canımı sıkan şeylere bile artık kızamıyorum.\n',
    'A-)Başkalarıyla görüşme, konuşma isteğimi kaybetmedim.\nB-)Eskisi kadar insanlarla birlikte olmak istemiyorum.\nC-)Birileriyle görüşüp konuşmak hiç içimden gelmiyor.\nD-)Artık çevremde hiçkimseyi istemiyorum.\n',
    'A-)Karar verirken eskisinden fazla güçlük çekmiyorum.\nB-)Eskiden olduğu kadar kolay karar veremiyorum.\nC-)Eskiye kıyasla karar vermekte çok güçlük çekiyorum.\nD-)Artık hiçbir konuda karar veremiyorum.\n',
    'A-)Her zamankinden farklı göründüğümü sanmıyorum.\nB-)Aynada kendime her zamankinden kötü görünüyorum.\nC-)Aynaya baktığımda kendimi yaşlanmış ve çirkinleşmiş buluyorum.\nD-)Kendimi çok çirkin buluyorum.\n',
    'A-)Eskisi kadar iyi iş güç yapabiliyorum.\nB-)Her zaman yaptığım işler şimdi gözümde büyüyor.\nC-)Ufacık bir işi bile kendimi çok zorlayarak yapabiliyorum.\nD-)Artık hiçbir iş yapamıyorum.\n',
    'A-)Uykum her zamanki gibi.\nB-)Eskisi gibi uyuyamıyorum.\nC-)Her zamankinden 1-2 saat önce uyanıyorum ve kolay kolay tekrar uykuya dalamıyorum.\nD-)Sabahları çok erken uyanıyorum ve bir daha uyuyamıyorum.\n',
    'A-)Kendimi her zamankinden yorgun hissetmiyorum.\nB-)Eskiye oranla daha çabuk yoruluyorum.\nC-)Her şey beni yoruyor.\nD-)Kendimi hiçbir şey yapamayacak kadar yorgun ve bitkin hissediyorum.\n',
    'A-)İştahım her zamanki gibi.\nB-)Eskisinden daha iştahsızım.\nC-)İştahım çok azaldı.\nD-)Hiçbir şey yiyemiyorum.\n',
    'A-)Son zamanlarda zayıflamadım.\nB-)Zayıflamaya çalışmadığım halde en az 2 Kg verdim.\nC-)Zayıflamaya çalışmadığım halde en az 4 Kg verdim.\nD-)Zayıflamaya çalışmadığım halde en az 6 Kg verdim.\n',
    'A-)Sağlığımla ilgili kaygılarım yok.\nB-)Ağrılar, mide sancıları, kabızlık gibi şikayetlerim oluyor ve bunlar beni tasalandırıyor.\nC-)Sağlığımın bozulmasından çok kaygılanıyorum ve kafamı başka şeylere vermekte zorlanıyorum.\nD-)Sağlık durumum kafama o kadar takılıyor ki, başka hiçbir şey düşünemiyorum.\n',
    'A-)Sekse karşı ilgimde herhangi bir değişiklik yok.\nB-)Eskisine oranla sekse ilgim az.\nC-)Cinsel isteğim çok azaldı.\nD-)Hiç cinsel istek duymuyorum.\n',
    'A-)Cezalandırılması gereken şeyler yapığımı sanmıyorum.\nB-)Yaptıklarımdan dolayı cezalandırılabileceğimi düşünüyorum.\nC-)Cezamı çekmeyi bekliyorum.\nD-)Sanki cezamı bulmuşum gibi geliyor.\n',
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFb4ebad),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.green[400],
          elevation: 1.0,
          title: Text(
            "BECK DEPRESYON ENVANTERİ",
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
                  color: Colors.green[400],
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
              color: Color(0xFFb4ebad),
            ),
            Expanded(
              child: Container(
                color: Color(0xFFb4ebad),

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
                color: Color(0xFFb4ebad),
                child: Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        sorularKSE[soruIndex],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                        ),
                      ),
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
                              child: Text("A"),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green[500],
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
                              child: Text("B"),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green[500],
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
                                butonFonksiyonu(cokAz);
                              },
                            ))),

                    Expanded(
                        //buton3
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1),
                            child: ElevatedButton(
                              child: Text("C"),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green[500],
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
                                butonFonksiyonu(oldukcaFazla);
                              },
                            ))),
                    Expanded(
                        //buton4
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1),
                            child: ElevatedButton(
                              child: Text("D"),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green[500],
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
                                butonFonksiyonu(cokFazla);
                              },
                            ))),
                  ])),
            )
          ],
        )));
  }
}
