import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:list_app/repository/ogretmen_repo.dart';

import '../models/ogretmen_model.dart';

class OgretmenSayfasi extends ConsumerWidget {
  const OgretmenSayfasi({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ogretmenRepo = ref.watch(ogretmenlerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Öğretmenler")),
      body: Column(children: [
        PhysicalModel(
          elevation: 10,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                child: Text("${ogretmenRepo.ogretmen.length} öğretmen"),
              ),
              IconButton(
                  onPressed: () {
                    ref.read(ogretmenlerProvider).indir();
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
        ),
        Expanded(
            child: ListView.separated(
                itemBuilder: ((context, index) {
                  return OgretmenView(
                    ogretmen: ogretmenRepo.ogretmen[index],
                  );
                }),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                      thickness: 2,
                    ),
                itemCount: ogretmenRepo.ogretmen.length))
      ]),
    );
  }
}

class OgretmenView extends StatelessWidget {
  final Ogretmen ogretmen;
  const OgretmenView({
    Key? key,
    required this.ogretmen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ogretmen.cinsiyet == "kadın"
          ? const Icon(Icons.woman_rounded)
          : const Icon(Icons.man_sharp),
      title: Text(ogretmen.ad),
    );
  }
}
