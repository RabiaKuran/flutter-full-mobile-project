//import 'dart:html';
//import 'dart:ui';

import 'package:donemuygulamam/sayfalar/ObsesifKompulsifBozukluk.dart';
import 'package:donemuygulamam/sayfalar/beckAnksiyete.dart';
import 'package:donemuygulamam/sayfalar/beckDepresyon.dart';
import 'package:donemuygulamam/sayfalar/ofkeKontrolu.dart';
import 'package:donemuygulamam/sayfalar/sonucEkrani.dart';
import 'package:donemuygulamam/sayfalar/soruSayfasi.dart';
import 'package:flutter/material.dart';

class soruYonlendirme extends StatefulWidget {
  const soruYonlendirme({Key? key}) : super(key: key);

  @override
  State<soruYonlendirme> createState() => _soruYonlendirmeState();
}

class _soruYonlendirmeState extends State<soruYonlendirme> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          //alt alta yonlendirme kutuları
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SoruSayfasi()));
                      },
                      label: Text(
                        "\nKISA SEMPTOM ENVANTERİ (KSE)\n\nPsikolojik semptomlarınız ve bu semptomlarınınız düzeyini belirlemek için ilk olarak bu testi uygulayınız.\n",
                        style: TextStyle(
                            fontSize: 14.2, fontWeight: FontWeight.bold),
                      ),
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.purple[500],
                        //backgroundColor: Color(0xFF99d2ff),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                      ),
                      icon: Icon(Icons.emoji_people, size: 40),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => beckDepresyon()));
                      },
                      label: Text(
                        "\nBECK DEPRESYON ENVANTERİ\n\nBu testi, her gruptaki cümleleri dikkatle okuyarak, bugün dahil gecen hafta içinde kendinizi nasıl hissettiğini en iyi anlatan cümleyi seçiniz.\n",
                        style: TextStyle(
                            fontSize: 14.2, fontWeight: FontWeight.bold),
                      ),
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.green[400],
                        //backgroundColor: Color(0xFFfff399),

                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                      ),
                      icon: Icon(Icons.psychology, size: 40),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => beckAnksiyete()));
                      },
                      label: Text(
                        "\nBECK ANKSİYETE ÖLÇEĞİ TESTİ\n\nBeck anksiyete ölçeğindeki sorular anksiyete belirtileri ile ilgilidir.\n",
                        style: TextStyle(
                            fontSize: 14.2, fontWeight: FontWeight.bold),
                      ),
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.yellow[400],
                        //backgroundColor: Color(0xFFff9999),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                      ),
                      icon: Icon(Icons.reduce_capacity, size: 40),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => obsesifKompulsifBozukluk()));
                      },
                      label: Text(
                        "\nOBSESİF KOMPÜLSİF BOZUKLUK TESTİ\n\nObsesif Kompulsif Bozukluk (OKB); takıntılı düşünceler (obsesyonlar) ve bu düşüncelerin neden olduğu zorlantılı davranışlarla (kompulsiyonlar) şeklinde tanımlanan psikolojik bir rahatsızlıktır.\n",
                        style: TextStyle(
                            fontSize: 14.2, fontWeight: FontWeight.bold),
                      ),
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.pink[300],
                        //backgroundColor: Color(0xFFb4ebad),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                      ),
                      icon: Icon(Icons.people_alt, size: 40),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ofkeKontrolu()));
                      },
                      label: Text(
                        "\nÖFKE KONTROLÜ TESTİ\n\nÖfke Kontrol Testi ile öfkenizi ne ölçüde kontrol edebildiğinizi, öfke kontrol problemi yaşayıp yaşamadığınızı öğrenebilirsiniz.\n",
                        style: TextStyle(
                            fontSize: 14.2, fontWeight: FontWeight.bold),
                      ),
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.lightBlueAccent,
                        //backgroundColor: Color(0xFFffd181),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                      ),
                      icon: Icon(Icons.extension, size: 40),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
