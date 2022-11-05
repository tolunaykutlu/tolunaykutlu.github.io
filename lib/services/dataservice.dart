import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:list_app/models/ogretmen_model.dart';

class Dataservice {
  Ogretmen ogretmenIndir() {
    const j = """{
      "ad": "eski",
      "soyad": "yenioglu",
      "yas": 22,
      "cinsiyet": "kadın"
    }""";

    /* final m = {
      "ad": "yeni",
      "soyad": "yenioglu",
      "yas": 22,
      "cinsiyet": "erkek"
    }; */
    final m = jsonDecode(j); // json verisini mape dönüştürdük
    final ogretici = Ogretmen.fromMap(m);
    return ogretici;
  }
}

final dataServiceProvider = Provider(((ref) {
  return Dataservice();
}));
