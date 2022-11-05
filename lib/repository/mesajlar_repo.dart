import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/mesaj_model.dart';

class MesajlarRepository extends ChangeNotifier {
  final List<Mesaj> mesajlar = [
    Mesaj(
        "merhaba", "ali", DateTime.now().subtract(const Duration(minutes: 5))),
    Mesaj("iyiyim sen", "ayşe",
        DateTime.now().subtract(const Duration(minutes: 4))),
    Mesaj("bende iyiyim", "ali",
        DateTime.now().subtract(const Duration(minutes: 3))),
    Mesaj("okul nasıl", "ayşe",
        DateTime.now().subtract(const Duration(minutes: 2))),
    Mesaj("güzel seninki?", "ali",
        DateTime.now().subtract(const Duration(minutes: 1))),
  ];
}

final mesajlarProvider = ChangeNotifierProvider(((ref) {
  return MesajlarRepository();
}));

class YeniMesajSayisi extends StateNotifier<int> {
  YeniMesajSayisi(super.state);

  void sifirla() {
    state = 0;
  }
}

final yeniMesajSayisiProvider =
    StateNotifierProvider<YeniMesajSayisi, int>((ref) {
  return YeniMesajSayisi(5);
});
