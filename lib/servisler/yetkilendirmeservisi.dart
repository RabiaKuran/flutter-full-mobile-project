import 'package:donemuygulamam/modeller/kullanici.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class YetkilendirmeServisi {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late String aktifKullaniciId;

  Kullanici _kullaniciOlustur(FirebaseUser kullanici) {
    return Kullanici.firebasedenUret(kullanici);
  }
/*
  Kullanici _kullaniciOlustur(FirebaseUser kullanici) {
    return kullanici == null ? null : Kullanici.firebasedenUret(kullanici);;
  }
*/

  Stream<Kullanici> get durumTakipcisi {
    return firebaseAuth.onAuthStateChanged.map(_kullaniciOlustur);
  }

  Future<Kullanici> mailIleKayit(String eposta, String sifre) async {
    //hatasız giris olursa giris kartı olusur
    var girisKarti = await firebaseAuth.createUserWithEmailAndPassword(
        email: eposta,
        password:
            sifre); //bu gerçekleştiği zaman kullanıcıyı anasayfaya yönlendirilir.
    return _kullaniciOlustur(girisKarti.user);
  }

  Future<Kullanici> mailIleGiris(String eposta, String sifre) async {
    //hatasız giris olursa giris kartı olusur
    var girisKarti = await firebaseAuth.signInWithEmailAndPassword(
        email: eposta,
        password:
            sifre); //bu gerçekleştiği zaman kullanıcıyı anasayfaya yönlendirilir.
    return _kullaniciOlustur(girisKarti.user);
  }

  Future<void> cikisYap() {
    return firebaseAuth.signOut();
  }

  Future<Kullanici> googleIleGiris() async {
    GoogleSignInAccount googleHesabi = await GoogleSignIn().signIn();
    GoogleSignInAuthentication googleYetkiKartim =
        await googleHesabi.authentication;
    AuthCredential sifresizGirisBelgesi = GoogleAuthProvider.getCredential(
        idToken: googleYetkiKartim.idToken,
        accessToken: googleYetkiKartim
            .accessToken); //şifresiz girmek için şifresiz giriş belgesi döndürüyor
    AuthResult girisKarti =
        await firebaseAuth.signInWithCredential(sifresizGirisBelgesi);
    //print(girisKarti.user.uid);
    //print(girisKarti.user.displayName);
    //print(girisKarti.user.photoUrl);
    //print(girisKarti.user.email);
    //print(googleHesabi.id);
    //print(googleHesabi.displayName);
    return _kullaniciOlustur(girisKarti.user);
  }
}
