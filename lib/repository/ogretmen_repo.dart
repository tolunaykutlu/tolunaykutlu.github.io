import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:list_app/services/dataservice.dart';

import '../models/ogretmen_model.dart';

class OgretmenRepo extends ChangeNotifier {
  List ogretmen = [
    Ogretmen("ahmet", "yımaz", 19, "erkek"),
    Ogretmen("semiha", "mazmaz", 19, "kadın")
  ];
  final Dataservice dataservice;
  OgretmenRepo(this.dataservice);

  void indir() {
    Ogretmen ogretici = dataservice.ogretmenIndir();

    ogretmen.add(ogretici);

    notifyListeners();
  }
}

final ogretmenlerProvider = ChangeNotifierProvider(((ref) {
  return OgretmenRepo(ref.watch(dataServiceProvider));
}));
