import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Kullanici {
  final String id;
  final String kullaniciAdi;
  final String fotoUrl;
  final String email;
  final String hakkinda;

  Kullanici(
      {required this.id,
      required this.kullaniciAdi,
      required this.fotoUrl,
      required this.email,
      required this.hakkinda});
//@required gerekli anlamına geliyor id yi girmek zorundasın
  factory Kullanici.firebasedenUret(FirebaseUser kullanici) {
    return Kullanici(
      id: kullanici.uid!,
      kullaniciAdi: kullanici.providerId,
      fotoUrl: kullanici.photoUrl,
      email: kullanici.email!,
      hakkinda: '',
    );
  }

  factory Kullanici.dokumandanUret(DocumentSnapshot doc) {
    var docData = doc.documentID;
    return Kullanici(
      id: doc.documentID,
      kullaniciAdi: doc['kullaniciAdi'],
      email: doc['email'],
      fotoUrl: doc['fotoUrl'],
      hakkinda: doc['hakkinda'],
    );
  }
}
