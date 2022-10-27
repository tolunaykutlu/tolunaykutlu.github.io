import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:list_app/repository/mesajlar_repo.dart';
import 'package:list_app/repository/ogrenci_repo.dart';
import 'package:list_app/repository/ogretmen_repo.dart';
import 'package:list_app/sayfalar/mesaj_sayfasi.dart';
import 'package:list_app/sayfalar/ogrenciler_sayfasi.dart';
import 'package:list_app/sayfalar/ogretmenler_sayfasi.dart';

void main() {
  runApp(const ProviderScope(child: OgrenciApp()));
}

class OgrenciApp extends StatelessWidget {
  const OgrenciApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ögrenci Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnaSayfa(title: 'Ögrenci ana Sayfa'),
    );
  }
}

class AnaSayfa extends ConsumerWidget {
  const AnaSayfa({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ogrenciRepo = ref.watch(ogrenciProvider);
    final ogretmenRepo = ref.watch(ogretmenlerProvider);
    final mesajlarRepository = ref.watch(mesajlarProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: YanMenu(
            ogrenciRepo: ogrenciRepo,
            ogretmenRepo: ogretmenRepo,
            mesajlarRepository: mesajlarRepository),
        body: Center(
            child: ButonS(
                ogrenciRepo: ogrenciRepo,
                mesajlarRepository: mesajlarRepository,
                ogretmenRepo: ogretmenRepo)));
  }
}

class ButonS extends StatelessWidget {
  const ButonS({
    Key? key,
    required this.ogrenciRepo,
    required this.mesajlarRepository,
    required this.ogretmenRepo,
  }) : super(key: key);

  final OgrenciRepo ogrenciRepo;
  final MesajlarRepository mesajlarRepository;
  final OgretmenRepo ogretmenRepo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const OgrencilerSayfasi())));
            },
            child: Text("${ogrenciRepo.ogrenciler.length} öğrenciler sayfası")),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const MesajSayfasi())));
            },
            child: Text('${mesajlarRepository.mesajlar.length} mesaj')),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const OgretmenSayfasi())));
            },
            child: Text('${ogretmenRepo.ogretmen.length} öğretmen')),
      ],
    );
  }
}

class YanMenu extends StatelessWidget {
  const YanMenu({
    Key? key,
    required this.ogrenciRepo,
    required this.ogretmenRepo,
    required this.mesajlarRepository,
  }) : super(key: key);

  final OgrenciRepo ogrenciRepo;
  final OgretmenRepo ogretmenRepo;
  final MesajlarRepository mesajlarRepository;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      const DrawerHeader(
        curve: Curves.bounceInOut,
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text('ÖĞRENCİ APP'),
      ),
      ListTile(
        title: Text('${ogrenciRepo.ogrenciler.length} ögrenci'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) => const OgrencilerSayfasi())));
        },
      ),
      ListTile(
          title: Text('${ogretmenRepo.ogretmen.length} öğretmen'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => const OgretmenSayfasi())));
          }),
      ListTile(
        title: Text('${mesajlarRepository.mesajlar.length} mesaj'),
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: ((context) => const MesajSayfasi())));
        },
      ),
    ]));
  }
}
