import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OgretmenRepo extends ChangeNotifier {
  List ogretmen = [
    Ogretmen("ahmet", "yımaz", 19, "erkek"),
    Ogretmen("semiha", "mazmaz", 19, "kadın")
  ];
}

final ogretmenlerProvider = ChangeNotifierProvider(((ref) {
  return OgretmenRepo();
}));

class Ogretmen {
  String ad;
  String soyad;
  int yas;
  String cinsiyet;

  Ogretmen(this.ad, this.soyad, this.yas, this.cinsiyet);
}
