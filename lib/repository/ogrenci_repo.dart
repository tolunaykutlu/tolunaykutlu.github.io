import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OgrenciRepo extends ChangeNotifier {
  List ogrenciler = [
    Ogrenci("ali", "yımaz", 19, "erkek"),
    Ogrenci("ayşe", "mazmaz", 19, "kadın")
  ];

  void sev(Ogrenci ogrenci, bool seviyorMuyum) {
    if (seviyorMuyum) {
      sevdiklerim.add(ogrenci);
    } else {
      sevdiklerim.remove(ogrenci);
    }
    notifyListeners();
  }

  bool seviyorMuyum(Ogrenci ogrenci) {
    return sevdiklerim.contains(ogrenci);
  }
}

final Set<Ogrenci> sevdiklerim = {};

final ogrenciProvider = ChangeNotifierProvider(((ref) {
  return OgrenciRepo();
}));

class Ogrenci {
  String ad;
  String soyad;
  int yas;
  String cinsiyet;

  Ogrenci(this.ad, this.soyad, this.yas, this.cinsiyet);
}
