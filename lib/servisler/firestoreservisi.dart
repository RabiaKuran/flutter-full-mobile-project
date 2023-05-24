import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donemuygulamam/modeller/kullanici.dart';

class FireStoreServisi {
  final Firestore _firestore = Firestore.instance;
  final DateTime zaman = DateTime.now();

  Future<void> kullaniciOlustur({id, email, kullaniciAdi, fotoUrl = ""}) async {
    await _firestore.collection("kullanicilar").document(id).setData({
      "kullaniciAdi": kullaniciAdi,
      "email": email,
      "fotoUrl": fotoUrl,
      "hakkinda": "",
      "olusturulmaZamani": zaman
    });
  }

//bu id ye ait bir kullanıcı var mı kontrol ediliyor
  Future<Kullanici?> kullaniciGetir(id) async {
    DocumentSnapshot doc =
        await _firestore.collection("kullanicilar").document(id).get();
    if (doc.exists) {
      //eğer böyle bir doküman varsa
      Kullanici kullanici = Kullanici.dokumandanUret(doc);
      return kullanici;
    }
    return null;
  }
}
