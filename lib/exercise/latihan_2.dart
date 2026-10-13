import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: DaftarWisata(),
    ),
  );
}

class Wisata {
  final String nama;
  final String deskripsi;

  const Wisata(this.nama, this.deskripsi);
}

const List<Wisata> daftarWisata = [
  Wisata('Pantai Padang', 'Pantai di tengah Kota Padang.'),
  Wisata('Jam Gadang', 'Menara jam ikonik di Bukittinggi.'),
  Wisata('Ngarai Sianok', 'Lembah curam dengan pemandangan hijau.'),
];

class DaftarWisata extends StatelessWidget {
  const DaftarWisata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Wisata'),
        backgroundColor: const Color(0xFF4C2365),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: daftarWisata.length,
        itemBuilder: (context, index) {
          final wisata = daftarWisata[index];

          return ListTile(
            leading: const Icon(Icons.place),
            title: Text(wisata.nama),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HalamanDetail(wisata: wisata),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class HalamanDetail extends StatelessWidget {
  final Wisata wisata;

  const HalamanDetail({super.key, required this.wisata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wisata.nama),
        backgroundColor: const Color(0xFF4C2365),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          wisata.deskripsi,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
