import 'package:donemuygulamam/modeller/kullanici.dart';
import 'package:donemuygulamam/servisler/firestoreservisi.dart';
import 'package:donemuygulamam/servisler/yetkilendirmeservisi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profil extends StatefulWidget {
  final String profilSahibiId;
  Profil({Key? key, required this.profilSahibiId}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  int _testSayisi = 0;
  int _gunSayisi = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[100],
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app, color: Colors.black),
              onPressed: _cikisYap)
        ],
      ),
      body: FutureBuilder<dynamic>(
          future: FireStoreServisi().kullaniciGetir(widget.profilSahibiId),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              //eğer veri yoksa yükleme animasyonu gösterdim
              return Center(child: CircularProgressIndicator());
            }
            return ListView(
              children: <Widget>[_profilDetaylari(snapshot.data)],
            );
          }),
    );
  }

  Widget _profilDetaylari(Kullanici profilData) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, //içindeki elemanları sola hizalar
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 50.0,
                backgroundImage: AssetImage("assets/images/profil.png"),
              ),
              Expanded(
                //Expandedyatay eksende tüm alanı kullanarak yayılmasını sağlıyor
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _sosyalSarac(baslik: "Test Sayısı", sayi: _testSayisi),
                    _sosyalSarac(baslik: "Gün Sayısı", sayi: _gunSayisi),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            profilData.kullaniciAdi,
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5.0),
          //Text(profilData.hakkinda),
          //SizedBox(height: 25.0),
          _profiliDuzenleButon(),
        ],
      ),
    );
  }

  Widget _profiliDuzenleButon() {
    //autline buton ince bir çizgi kutu şeklinde
    return Container(
        width: double.infinity, //yatayda yayıyor
        child:
            OutlinedButton(onPressed: () {}, child: Text("Profili Düzenle")));
  }

  Widget _sosyalSarac({required String baslik, required int sayi}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, //diey eksende ortaladım
      crossAxisAlignment: CrossAxisAlignment.center, //yatak eksende ortaladım
      children: <Widget>[
        Text(
          sayi.toString(),
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 2.0),
        Text(
          baslik,
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
      ],
    );
  }

  void _cikisYap() {
    Provider.of<YetkilendirmeServisi>(context, listen: false).cikisYap();
  }
}

//KSE SONUCLARI ÇEKİYOR
class sonuclariCek extends StatefulWidget {
  //sonuclariCek({Key? key}) : super(key: key);
  final String profilSahibiId;
  sonuclariCek({Key? key, required this.profilSahibiId}) : super(key: key);

  @override
  State<sonuclariCek> createState() => _sonuclariCekState();
}

class _sonuclariCekState extends State<sonuclariCek> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuçlar"),
      ),
      body: FutureBuilder<dynamic>(
          future: FireStoreServisi().kullaniciGetir(widget.profilSahibiId),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              //eğer veri yoksa yükleme animasyonu gösterdim
              return Center(child: CircularProgressIndicator());
            }
            return ListView(
              children: <Widget>[_profilDetaylari(snapshot.data)],
            );
          }),
    );
  }

  Widget _profilDetaylari(Kullanici profilData) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, //içindeki elemanları sola hizalar
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                //Expandedyatay eksende tüm alanı kullanarak yayılmasını sağlıyor
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[],
                ),
              )
            ],
          ),
          Text(
            "Kısa Semptom Envanterin Sonuçları",
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
          /*SizedBox(height: 10.0),
          Text(
            profilData.kullaniciAdi,
            style: TextStyle(fontSize: 20.0),
          ),*/
          SizedBox(height: 10.0),
          Text(
            profilData.hakkinda,
            style: TextStyle(fontSize: 25.0),
          ),
          SizedBox(height: 25.0),
        ],
      ),
    );
  }
}

class cevaplariVTyeEkle extends StatefulWidget {
  cevaplariVTyeEkle({Key? key}) : super(key: key);

  @override
  State<cevaplariVTyeEkle> createState() => _cevaplariVTyeEkleState();
}

class _cevaplariVTyeEkleState extends State<cevaplariVTyeEkle> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
