import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HalamanUtama(),
    ),
  );
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  String warna = 'belum dipilih';

  Future<void> pilihWarna() async {
    final hasil = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => const HalamanPilih(),
      ),
    );

    if (!mounted) return;

    if (hasil != null) {
      setState(() {
        warna = hasil;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Utama'),
        backgroundColor: const Color(0xFF4C2365),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Warna favorit: $warna',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4C2365),
                foregroundColor: Colors.white,
              ),
              onPressed: pilihWarna,
              child: const Text('Pilih Warna'),
            ),
          ],
        ),
      ),
    );
  }
}

class HalamanPilih extends StatelessWidget {
  const HalamanPilih({super.key});

  @override
  Widget build(BuildContext context) {
    const pilihan = ['Merah', 'Hijau', 'Biru'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Warna'),
        backgroundColor: const Color(0xFF4C2365),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: pilihan.map((warna) {
          return ListTile(
            title: Text(warna),
            onTap: () {
              Navigator.pop(context, warna);
            },
          );
        }).toList(),
      ),
    );
  }
}
