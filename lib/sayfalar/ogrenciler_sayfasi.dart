import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/ogrenci_repo.dart';

class OgrencilerSayfasi extends ConsumerWidget {
  const OgrencilerSayfasi({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ogrencilerRepo = ref.watch(ogrenciProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Öğrenciler")),
      body: Column(children: [
        PhysicalModel(
          elevation: 10,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Text("${ogrencilerRepo.ogrenciler.length} öğrenci var"),
          ),
        ),
        Expanded(
            child: ListView.separated(
                itemBuilder: ((context, index) {
                  return OgrenciView(
                    ogrenci: ogrencilerRepo.ogrenciler[index],
                  );
                }),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                      thickness: 2,
                    ),
                itemCount: ogrencilerRepo.ogrenciler.length))
      ]),
    );
  }
}

class OgrenciView extends ConsumerWidget {
  final Ogrenci ogrenci;

  const OgrenciView({
    Key? key,
    required this.ogrenci,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool seviyorMuyum = ref.watch(ogrenciProvider).seviyorMuyum(ogrenci);

    return ListTile(
      leading: ogrenci.cinsiyet == "kadın"
          ? const Icon(Icons.woman_rounded)
          : const Icon(Icons.man_sharp),
      title: Text(ogrenci.ad),
      trailing: IconButton(
          onPressed: () {
            ref.read(ogrenciProvider).sev(ogrenci, !seviyorMuyum);
          },
          icon: Icon(
            seviyorMuyum ? Icons.favorite : Icons.favorite_outline_outlined,
            color: Colors.red,
          )),
    );
  }
}
