import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:list_app/repository/mesajlar_repo.dart';

class MesajSayfasi extends ConsumerStatefulWidget {
  const MesajSayfasi({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _MesajSayfasiState();
  }
}

class _MesajSayfasiState extends ConsumerState<MesajSayfasi> {
  @override
  void initState() {
    final a = ref.read(yeniMesajSayisiProvider.notifier).sifirla();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mesajlarRepository = ref.watch(mesajlarProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Mesajlar")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: ((context, index) {
                mesajlarRepository.mesajlar[index];
                return MesajView(
                  mesaj: mesajlarRepository.mesajlar[index],
                );
              }),
              reverse: false, //listi en aşağıdan başlattık
              itemCount: mesajlarRepository.mesajlar.length,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.send_sharp),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MesajView extends StatelessWidget {
  final Mesaj mesaj;
  const MesajView({
    Key? key,
    required this.mesaj,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: mesaj.gonderen == "ali"
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.green.shade800,
              border: Border.all(color: Colors.transparent, width: 2),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(mesaj.yazi),
          ),
        ),
      ),
    );
  }
}
