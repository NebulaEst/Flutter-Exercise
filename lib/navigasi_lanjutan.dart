import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contoh Navigasi',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/pantai': (context) => const DetailPage(
              itemTile: 'Pantai',
              icon: Icons.beach_access,
              themeColor: Colors.blue,
            ),
        '/gunung': (context) => const DetailPage(
              itemTile: 'Gunung',
              icon: Icons.terrain,
              themeColor: Colors.blue,
            ),
        '/budaya': (context) => const DetailPage(
              itemTile: 'Budaya',
              icon: Icons.museum,
              themeColor: Colors.blue,
            ),
        '/kuliner': (context) => const DetailPage(
              itemTile: 'Kuliner',
              icon: Icons.fastfood,
              themeColor: Colors.blue,
            ),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        padding: const EdgeInsets.all(20.0),
        children: [
          // 1. Tombol Pantai - Warna Teal
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/pantai');
            },
            icon: const Icon(Icons.beach_access),
            label: const Text('Pantai'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          // 2. Tombol Gunung - Warna Cokelat
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/gunung');
            },
            icon: const Icon(Icons.terrain),
            label: const Text('Gunung'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          // 3. Tombol Budaya - Warna Oranye Tua
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/budaya');
            },
            icon: const Icon(Icons.museum),
            label: const Text('Budaya'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          // 4. Tombol Kuliner - Warna Amber / Kuning Tua
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/kuliner');
            },
            icon: const Icon(Icons.fastfood),
            label: const Text('Kuliner'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String itemTile;
  final IconData icon;
  final Color themeColor;

  const DetailPage({
    super.key,
    required this.itemTile,
    required this.icon,
    required this.themeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemTile),
        backgroundColor: themeColor,
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(icon),
          label: const Text('Kembali'),
          style: ElevatedButton.styleFrom(
            backgroundColor: themeColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}