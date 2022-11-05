import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/ogrenci_model.dart';

class OgrenciRepo extends ChangeNotifier {
  List ogrenciler = [
    Ogrenci("ali", "yımaz", 19, "erkek"),
    Ogrenci("ayşe", "mazmaz", 19, "kadın")
  ];

  void addOgrenci(Ogrenci ogrenci) {
    ogrenciler.add(ogrenci);
  }

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
